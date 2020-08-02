import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Flutter Test Application'),
      ),
      body: Center(
        child: Text('Hi! My name is Dmytro\n\n'
                    'According to the test task which Yana sent me I have implemented my first Flutter application\n\n'
                    'As you mantioned in the task in order to get some bonus points besides the main task I have practiced creating and decorating side menu for the application',
        style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic,),),
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
      DrawerHeader(
      child: Text(
        'My Test Flutter Application Side Menu',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
      decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/forest.jpg'))),
    ),
    ListTile(
    leading: Icon(Icons.info_outline),
    title: Text('WelcomePage'),
    onTap: () => {
    Navigator.of(context).pop(),
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()))
    },
    ),
    ListTile(
    leading: Icon(Icons.check_circle_outline),
    title: Text('TestTaskPage'),
    onTap: () => {Navigator.of(context).pop(),
    Navigator.push(context, MaterialPageRoute(builder: (context) => TestTaskPage()))
    },
    ),
    ],
    ),
    );
    }
}

class TestTaskPage extends StatefulWidget {

  TestTaskPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  TestTaskPageState createState() => new TestTaskPageState();
}

class TestTaskPageState extends State<TestTaskPage> {
  Color color = ColorGenerator.getColor();

  void _randomColor() {
    setState(() {
      color = ColorGenerator.getColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      backgroundColor: color,

      appBar: new AppBar(
        title: new Text('Flutter Test Application'),
      ),

      body: GestureDetector(
          behavior: HitTestBehavior.opaque,
        onTap: () {
          _randomColor();
        },
        child: Center(
          child: Text('Hey there!'),
        ),
      ),
    );
  }
}

class ColorGenerator {

  static Random random = new Random();

  static Color getColor() {
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

}

