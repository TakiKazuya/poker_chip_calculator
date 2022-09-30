import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Poker Chip Calculator'),
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

  void _add100ToCounter() {
    setState(() {
      _counter += 100;
    });
  }

  void _add200ToCounter() {
    setState(() {
      _counter += 200;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: const <Widget>[
          Icon(Icons.settings)
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  color: Colors.green,
                  height: 180,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Pot',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),
                        ),
                        Text(
                          '$_counter',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const Icon(
                          Icons.paid,
                          size: 50,
                          color: Colors.yellow,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(border: Border.all(
              color: Colors.red, width: 8.0
            )),
              child: Row(
                children: [
                  TextButton(onPressed: () { }, child: Text("click!"))
                ],
              )
          ),
          Positioned(
            bottom: 0.0,
            child: TextButton(onPressed: () {}, child: Text('click!'),)
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _add100ToCounter,
            heroTag: "add100",
            backgroundColor: Colors.yellow,
            child: Row(
              children: const <Widget>[
                Icon(Icons.add, color: Colors.black,),
                Text('100', style: TextStyle(color: Colors.black),)
              ],
            )
          ),
          FloatingActionButton(
              onPressed: _add200ToCounter,
              heroTag: "add200",
              backgroundColor: Colors.yellow,
              child: Row(
                children: const <Widget>[
                  Icon(Icons.add, color: Colors.black,),
                  Text(
                    '200',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _add100ToCounter,
      //   tooltip: 'Increment',
      //   child: Row(
      //     children: const <Widget>[
      //       Icon(Icons.add),
      //       Text('100')
      //     ],
      //   )
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
