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
  int _pot = 0;
  int _stack = 5000;

  void _bet(int amount) {
    setState(() {
      _pot += amount;
      _stack -= amount;
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
                          '$_pot',
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
          OutlinedButton(onPressed: () {},
              child: const Text("Call")
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: () => _bet(100),
                  child: const Text("Bet 100", style: TextStyle(color: Colors.yellow))
              ),
              OutlinedButton(onPressed: () => _bet(200),
                  child: const Text("Bet 200", style: TextStyle(color: Colors.yellow))
              ),
              OutlinedButton(onPressed: () => _bet(300),
                  child: const Text("Bet 300", style: TextStyle(color: Colors.yellow))
              ),
              OutlinedButton(onPressed: () => _bet(400),
                  child: const Text("Bet 400", style: TextStyle(color: Colors.yellow))
              ),
            ],
          ),
          OutlinedButton(onPressed: () => _bet(_stack),
              child: const Text("All In", style: TextStyle(color: Colors.purple))
          ),
          OutlinedButton(onPressed: () {},
              child: const Text("Fold", style: TextStyle(color: Colors.red))
          ),
          Container(
            width: 200,
            decoration: BoxDecoration(
              border: Border.all()
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text('Stack'),
                  Text('$_stack')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
