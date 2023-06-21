import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gopal/feature_box.dart';
import 'package:gopal/navbar.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'pallete.dart';
import 'openai_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'feature_box.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController textEditingController;
  bool isLoading = true;
  final speechToText = SpeechToText();
  final flutterTts = FlutterTts();
  String lastWords = " ";
  final OpenAiService openaiservice = OpenAiService();
  String? generatedContent;
  String? generatedImageUrl;
  int start = 200;
  int delay = 200;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    initSpeechToText();
    initTextToSpeech();
  }

  Future<void> initTextToSpeech() async {
    await flutterTts.setSharedInstance(true);
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  Future<void> systemSpeak(String content) async {
    await flutterTts.speak(content);
  }

  void submitInput(String input) {
    // Show spinner animation
    setState(() {
      isLoading = true;
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Scaffold(
        drawer: const Navbar(),
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Pallete.whiteColor),
            title: FadeInDown(
              child: const Text('ThunderAI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Pallete.whiteColor,
                  )),
            ),
            // leading: const Icon(Icons.menu),
            centerTitle: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FlipInX(
                child: Stack(
                  children: [
                    //profile pic
                    Center(
                      child: Container(
                        height: 110,
                        width: 120,
                        margin: const EdgeInsets.only(top: 1),
                        decoration: const BoxDecoration(
                            color: Pallete.assistantCircleColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                      ),
                    ),
                    Container(
                      height: 123,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/img1.png'))),
                    )
                  ],
                ),
              ),
              //chat bubble
              SlideInLeft(
                child: Visibility(
                  visible: generatedImageUrl == null,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                      top: 30,
                    ),

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Pallete.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(20)
                          .copyWith(topLeft: Radius.zero),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text(
                        generatedContent == null
                            ? 'Hola Amigo! What can I do for you?'
                            : generatedContent!,
                        style: TextStyle(
                          fontFamily: 'Cera',
                          color: Pallete.mainFontColor,
                          fontSize: generatedContent == null ? 25 : 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //suggestions
                  ),
                ),
              ),
              if (generatedImageUrl != null)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(generatedImageUrl!),
                  ),
                ),

              FadeIn(
                child: Visibility(
                  visible:
                      generatedContent == null && generatedImageUrl == null,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      top: 3,
                      left: 22,
                      bottom: 0.1,
                    ),
                    child: const Text(
                      'Here are a few commands',
                      style: TextStyle(
                        fontFamily: 'Cera',
                        color: Pallete.mainFontColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              //feature list
              Visibility(
                visible: generatedContent == null && generatedImageUrl == null,
                child: Column(
                  children: [
                    SlideInRight(
                      delay: Duration(milliseconds: start),
                      child: const FeatureBox(
                        color: Pallete.firstSuggestionBoxColor,
                        headertext: 'ChatGPT',
                        description:
                            'A smarter way to organise your tasks with ChatGPT',
                      ),
                    ),
                    SlideInLeft(
                      delay: Duration(milliseconds: start + delay),
                      child: const FeatureBox(
                        color: Pallete.secondSuggestionBoxColor,
                        headertext: 'Dall-E',
                        description:
                            'Get isnpired and stay creative with your Personal assitant powerd by Dall-E',
                      ),
                    ),
                    SlideInRight(
                      delay: Duration(milliseconds: start + 2 * delay),
                      child: const FeatureBox(
                        color: Pallete.thirdSuggestionBoxColor,
                        headertext: 'Smart Voice Assistant',
                        description:
                            'Best of both worlds with a voice assitant powerd by Dall-E and ChatGPT',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: ZoomIn(
          delay: Duration(milliseconds: start + 3 * delay),
          child: FloatingActionButton.small(
              backgroundColor: const Color.fromRGBO(158, 245, 255, 1),
              onPressed: () async {
                if (await speechToText.hasPermission &&
                    speechToText.isNotListening) {
                  await startListening();
                } else if (speechToText.isListening) {
                  final speech = await openaiservice.isArtPromptAPI(lastWords);
                  if (speech.contains('https')) {
                    generatedImageUrl = speech;
                    generatedContent = null;
                    setState(() {});
                  } else {
                    generatedImageUrl = null;
                    generatedContent = speech;
                    await systemSpeak(speech);
                    setState(() {});
                  }
                  await systemSpeak(speech);
                  await stopListening();
                } else {
                  initSpeechToText();
                }
              },
              child: Icon(speechToText.isListening ? Icons.stop : Icons.mic)),
        ),
        bottomNavigationBar: SingleChildScrollView(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0)),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Stack(
                children: [
                  Material(
                    color: const Color.fromRGBO(66, 66, 66, 1),
                    child: Row(
                      children: [
                        Visibility(
                          visible: (isLoading == true) &&
                              (generatedContent != null ||
                                  generatedImageUrl != null),
                          child: const SpinKitThreeBounce(
                            color: Colors.white,
                            size: 15.0,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            textAlign: TextAlign.left,
                            cursorWidth: 2.0,
                            cursorColor: Pallete.whiteColor,
                            style: const TextStyle(color: Colors.white),
                            controller: textEditingController,
                            onChanged: (text) {
                              setState(() {
                                lastWords = text;
                                isLoading = false;
                              });
                            },
                            onSubmitted: (text) {
                              setState(() async {
                                final speech = await openaiservice
                                    .isArtPromptAPI(lastWords);
                                if (speech.contains('https')) {
                                  generatedImageUrl = speech;
                                  generatedContent = null;
                                  setState(() {
                                    isLoading = true;
                                  });
                                } else {
                                  generatedImageUrl = null;
                                  generatedContent = speech;
                                  setState(() {
                                    isLoading = true;
                                  });
                                }
                                lastWords = textEditingController.text;
                              });
                            },
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 11.0, 20.0, 15.0),
                                hintText: "What's on your mind?",
                                hintStyle: const TextStyle(color: Colors.grey),
                                iconColor:
                                    const Color.fromRGBO(45, 201, 218, 1),
                                prefixIconColor:
                                    const Color.fromRGBO(45, 201, 218, 1),
                                suffixIconColor:
                                    const Color.fromRGBO(45, 201, 218, 1),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(45, 201, 218, 1),
                                    width: 10.0,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    textEditingController.clear();
                                    isLoading = false;
                                  },
                                  icon: const Icon(Icons.clear),
                                  color: Colors.white,
                                  iconSize: 26.0,
                                ),
                                prefixIcon: const Icon(Icons.search,
                                    color: Colors.white, size: 26.0)),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() async {
                                final speech = await openaiservice
                                    .isArtPromptAPI(lastWords);
                                isLoading = true;
                                if (speech.contains('https')) {
                                  generatedImageUrl = speech;
                                  generatedContent = null;
                                  setState(() {});
                                } else {
                                  generatedImageUrl = null;
                                  generatedContent = speech;
                                  // await systemSpeak(speech);
                                  setState(() {
                                    isLoading = true;
                                  });
                                }
                                lastWords = textEditingController.text;
                              });
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  // Future<void> sendmessges()
}
