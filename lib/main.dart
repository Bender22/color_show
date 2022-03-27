import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  try{
    if (Platform.isWindows) {
      setWindowMaxSize(const Size(600, 800));
      setWindowMinSize(const Size(600, 800));
    }
  }catch(e){
    if (kDebugMode) {
      print(e);
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _redController = TextEditingController();
  final TextEditingController _greenController = TextEditingController();
  final TextEditingController _blueController = TextEditingController();
  RegExp regularExp =
  RegExp(r"[g-zG-Z)\\(\\.,!$%@&$'*+/=?^_`{|}~-]", caseSensitive: false);

  bool isHexa = true;

  bool hasClick = false;

  double _redSliderValue = 0.0;
  double _greenSliderValue = 0.0;
  double _blueSliderValue = 0.0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // void startProcess() async {
  //
  //   ProcessResult result;
  //   try {
  //     if(Platform.isLinux){
  //       result = await Process.run("xdg-open", [ ]);
  //     }
  //     else if(Platform.isWindows){
  //       // result = await Process.run('C:\\Program Files (x86)\\Cuota\\cuota.exe', ['C:\\Program Files (x86)\\Cuota']);
  //       result = await Process.run('net stop Mongodb', [''],  runInShell:true);
  //       stdout.write('net stop MongoDB');
  //
  //     }
  //   } on ProcessException catch (e){
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  //
  // }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _textController.addListener(() => setState(() {}));
    _redController.addListener(() => setState(() {}));
    _greenController.addListener(() => setState(() {}));
    _blueController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                  Icons.add_alert,
                  color: Colors.red
              ),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar'))
                );
              },
            ),
            IconButton(
              icon: const Icon(
                  Icons.add_alert,
                  color: Colors.green
              ),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar'))
                );
              },
            )
          ]
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  //   child: Text(
                  //
                  //     'Contraseña:',
                  //     style: Theme.of(context).textTheme.headline6,
                  //   ),
                  // ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
                    child: TextFormField(
                      onChanged: (value) {

                        isHexa = true;
                        if (value.isNotEmpty) {
                          // if (regularExp.hasMatch(textController.text)) {
                          //
                          //   // textController.text="";
                          //   if(!_formKey.currentState!.validate()){
                          //     return;
                          //   }
                          //
                          //
                          // }
                          if (regularExp.hasMatch(_textController
                              .text[_textController.text.length - 1]) ||
                              (_textController.text[
                              _textController.text.length - 1] ==
                                  '(' ||
                                  _textController.text[
                                  _textController.text.length - 1] ==
                                      ')')) {

                            var texto = _textController.text
                                .substring(0, _textController.text.length - 1);

                            _textController.text = texto;
                            _textController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: _textController.text.length));
                          }

                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                        }
                      },
                      validator: (text) {
                        if (regularExp.hasMatch(text!)) {
                          return "No es un numero Exadecimal";
                        } else {
                          return null;
                        }
                      },
                      controller: _textController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        //hintText: "#123456",
                        labelText: "Hexadecimal",
                        prefixIcon: Icon(Icons.palette),

                        //icon: Icon(Icons.palette)
                      ),
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.characters,
                      maxLength: _textController.text.isNotEmpty
                          ? (_textController.text[0] == '#' ? 7 : 6)
                          : 7,
                      maxLengthEnforcement:
                      MaxLengthEnforcement.truncateAfterCompositionEnds,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        Flexible(
                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(40.0, 10.0, 10.0, 10.0),
                              child: TextField(
                                controller: _redController,
                                onChanged: (text) {
                                  if (text.isNotEmpty) {
                                    if (int.parse(_redController.text) > 255) {
                                      var texto = _redController.text.substring(
                                          0, _redController.text.length - 1);
                                      _redController.text = texto;
                                      _redController.selection =
                                          TextSelection.fromPosition(TextPosition(
                                              offset: _redController.text.length));
                                    }
                                    isHexa = false;
                                    _redSliderValue =
                                        double.parse(_redController.text);
                                  }
                                },
                                decoration: const InputDecoration(
                                  prefixIcon:
                                  Icon(Icons.palette, color: Colors.red),
                                  fillColor: Colors.red,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  border: OutlineInputBorder(),
                                  labelText: 'Rojo',
                                  labelStyle: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 3,
                              ),
                            )),
                        Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                controller: _greenController,
                                onChanged: (text) {
                                  if (text.isNotEmpty) {
                                    if (int.parse(_greenController.text) > 255) {
                                      var texto = _greenController.text.substring(
                                          0, _greenController.text.length - 1);
                                      _greenController.text = texto;
                                      _greenController.selection =
                                          TextSelection.fromPosition(TextPosition(
                                              offset:
                                              _greenController.text.length));
                                    }
                                    isHexa = false;
                                    _greenSliderValue =
                                        double.parse(_greenController.text);
                                  }
                                },
                                decoration: const InputDecoration(
                                  prefixIcon:
                                  Icon(Icons.palette, color: Colors.green),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  border: OutlineInputBorder(),
                                  labelText: 'Verde',
                                  labelStyle: TextStyle(color: Colors.green),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 3,
                              ),
                            )),
                        Flexible(
                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(10.0, 10.0, 40.0, 10.0),
                              child: TextField(
                                controller: _blueController,
                                onChanged: (text) {
                                  if (text.isNotEmpty) {
                                    if (int.parse(_blueController.text) > 255) {
                                      var texto = _blueController.text.substring(
                                          0, _blueController.text.length - 1);
                                      _blueController.text = texto;
                                      _blueController.selection =
                                          TextSelection.fromPosition(TextPosition(
                                              offset: _blueController.text.length));
                                    }
                                    isHexa = false;
                                    _blueSliderValue =
                                        double.parse(_blueController.text);
                                  }
                                },
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.palette, color: Colors.blue),
                                    border: OutlineInputBorder(),
                                    labelText: 'Azul'),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 3,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Slider(
                      value: _redSliderValue,
                      activeColor: Colors.red,
                      inactiveColor: Colors.red[100],
                      min: 0,
                      max: 255,
                      label: _redSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          isHexa = false;
                          _redSliderValue = value;
                          _blueController.text = '0';
                          _greenController.text = '0';
                          _redController.text = value.round().toString();
                          // if(_redController.text == '0'){
                          // _greenController.clear();
                          // _blueController.clear();
                          // }
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Slider(
                      value: _greenSliderValue,
                      activeColor: Colors.green,
                      inactiveColor: Colors.green[100],
                      min: 0,
                      max: 255,
                      label: _greenSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          isHexa = false;
                          _greenSliderValue = value;
                          _redController.text = '0';
                          _blueController.text = '0';
                          _greenController.text = value.round().toString();
                          // if(_greenController.text == '0'){
                          //   _redController.clear();
                          //   _blueController.clear();
                          // }
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Slider(
                      value: _blueSliderValue,
                      min: 0,
                      max: 255,
                      label: _blueSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          isHexa = false;
                          _blueSliderValue = value;
                          _redController.text = '0';
                          _greenController.text = '0';
                          _blueController.text = value.round().toString();
                          // if(_blueController.text == '0'){
                          //   _redController.clear();
                          //   _greenController.clear();
                          // }
                        });
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CupertinoButton(

                  color: isHexa
                      ? toColor(true, textHexadecimal: _textController.text)
                      : toColor(false,
                      red: _redController.text,
                      green: _greenController.text,
                      blue: _blueController.text),
                  onPressed: () => {
                    setState(() {
                      hasClick = !hasClick;
                    })
                  },
                  padding: const EdgeInsets.fromLTRB(
                      80.0 * 3, 40.0 * 2, 40.0 * 3, 40.0 * 2),
                  child: const Text(""),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color toColor(bool fromHexadecimal,
      {String textHexadecimal = 'faff',
        String red = '0',
        String green = '0',
        String blue = '0'}) {

    Color color = const Color.fromRGBO(0, 0, 0, 100.0);
    var text = textHexadecimal;
    if (fromHexadecimal) {
      if (!regularExp.hasMatch(textHexadecimal) ||
          (textHexadecimal.contains(')') && textHexadecimal.contains('('))) {
        if (textHexadecimal.isNotEmpty) {
          if (textHexadecimal[0] == '#') {
            text = textHexadecimal.substring(1, textHexadecimal.length);
          }
          color = Color(int.parse("FF$text", radix: 16));
          _redController.text = color.red.toString();
          _greenController.text = color.green.toString();
          _blueController.text = color.blue.toString();
          _redSliderValue = color.red.roundToDouble();
          _greenSliderValue = color.green.roundToDouble();
          _blueSliderValue = color.blue.roundToDouble();
        }
      }
    } else {
      if (red.isNotEmpty && green.isNotEmpty && blue.isNotEmpty) {
        color = Color.fromRGBO(
            int.parse(red), int.parse(green), int.parse(blue), 100.0);
      }
    }

    return color;
  }

  String isExa(String text) {
    if (regularExp.hasMatch(text)) {
      return "No es un numero Exadecimal";
    }
    return "";
  }

  @override
  void dispose() {
    _textController.dispose();
    _redController.dispose();
    _greenController.dispose();
    _blueController.dispose();
    super.dispose();
  }
}
