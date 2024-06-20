import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Three Animations Demo'),
      ),
      body: Stack(
        children: [
          // Animated Container
          Center(
            child: AnimatedContainer(
              width: _isAnimated ? 200 : 100,
              height: _isAnimated ? 200 : 100,
              color: _isAnimated ? Colors.blue : Colors.red,
              alignment: _isAnimated
                  ? Alignment.center
                  : AlignmentDirectional.topCenter,
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: FlutterLogo(size: 75),
            ),
          ),
          // Animated Opacity
          Positioned(
            top: 300,
            left: 50,
            child: AnimatedOpacity(
              opacity: _isAnimated ? 1.0 : 0.0,
              duration: Duration(seconds: 2),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
          ),
          // Animated Positioned
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            left: _isAnimated ? 200 : 50,
            top: _isAnimated ? 50 : 200,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.purple,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isAnimated = !_isAnimated;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
