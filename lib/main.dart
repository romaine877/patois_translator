import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patois_translator/presentation/extensions/media_query_extention.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
          iconTheme:const  IconThemeData(
            color: Colors.black,
          ),
        colorSchemeSeed: const Color(0xffF9DF08),
        brightness: Brightness.dark,
        appBarTheme:const AppBarTheme(
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
        scaffoldBackgroundColor: Colors.black
      
      ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.bookmark),
        title: Text(widget.title),
        
        actions: const [
          Icon(Icons.settings)
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.widthPercentageOf(5),
          vertical: context.heightPercentageOf(5),
        ),
        width: double.infinity,
        height: context.heightPercentageOf(40),
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
                 children: const [Icon(Icons.flag, color: Colors.black,), Text('English')],
                ),
                const SizedBox(width: 10,),
                const Icon(Icons.compare_arrows),
                const SizedBox(width: 10,),
                Row(
                 children: const [Icon(Icons.flag, color: Colors.black,), Text('Patois')],
                ),
                
              ],
            ),
            const TextField(
              decoration: InputDecoration(
               border: InputBorder.none,
                labelText: 'Enter your text',
              ),
            
            ),
            const TextField(
              decoration: InputDecoration(
               border: InputBorder.none,
                labelText: 'translated text here',
              ),
            
            ),
           
                ElevatedButton(
                  onPressed: (){},
                  child: const Text('Translate'),
                ),
              
              
            
           
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
