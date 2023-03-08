import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patois_translator/data/dio_service.dart';
import 'package:patois_translator/presentation/extensions/media_query_extention.dart';
import 'package:patois_translator/presentation/widgets/texts/text_widget.dart';

void main() async {
  await dotenv.load(fileName: "config/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jamaica Translator App',
      theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          colorSchemeSeed: const Color(0xffF9DF08),
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(
            color: Colors.black,
            foregroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          scaffoldBackgroundColor: Colors.black),
      home: const MyHomePage(title: 'Jamaica Translator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();
  String translatedText = 'Transleted text will appear here';
  void handleTranslation() async {
    if (_textController.text.isEmpty) return;
    var text = await DioService().getTranslation(_textController.text);
    setState(() {
      translatedText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.bookmark),
        title: Text(widget.title),
        actions: const [Icon(Icons.settings)],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.widthPercentageOf(5),
              vertical: context.heightPercentageOf(5),
            ),
            width: double.infinity,
            height: context.heightPercentageOf(50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.flag,
                          color: Colors.black,
                        ),
                        Text('English')
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.compare_arrows),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.flag,
                          color: Colors.black,
                        ),
                        Text('Patois')
                      ],
                    ),
                  ],
                ),
                TextField(
                  maxLines: 2,
                  
                  controller: _textController,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 29,
                  ),
                  decoration: const InputDecoration(
                    
                    border: InputBorder.none,
                    labelText: 'Enter your text',
                  ),
                ),
                 Divider(
                  color: Colors.grey[300],),
                TextWidget(
                  translatedText,
                  fontSize: 30,
                  color: Colors.black,
                ),
                ElevatedButton(
                  onPressed: handleTranslation,
                  child: const Text('Translate'),
                ),
              ],
            ),
          ),
          ListTile(
            title: TextWidget('Ad Placeholder'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  'Popular Translations',
                  fontSize: 20,
                  bold: true,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Expanded(
            child: SafeArea(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: const [
                  PromotionItem(title: 'Phrases from Dancehall Music', image: 'assets/images/dancehall.png'),
                  PromotionItem(title: 'Popular foods and how to order them', image: 'assets/images/patty.png'),
                  PromotionItem(title: 'Funny phrases and sayings', image: 'assets/images/laugh.png',),
                ],
              ),
            ),
          ),
        ],
      ),
  
    );
  }
}

class PromotionItem extends StatelessWidget {
  final String? title, image;
  const PromotionItem({
    super.key, this.title, this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(
            children: [
              Positioned(
                child: SizedBox(
                    height: 70,
                    child: Image.asset(image ?? 'assets/images/dancehall.png')),
                bottom: 10,
                right: 10,
              ),
              TextWidget(
                title ?? '',
                color: Colors.black,
                fontSize: 22,
                bold: true,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
