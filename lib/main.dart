
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  static const String _title = 'Flutter Code Sample';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: const Scaffold(
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);


  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}


class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(3.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: _offsetAnimation,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset('images/Scooter.png',
            ),
          ),
        ),
        _letras()
      ],
    );
  }
}

Future<Widget> build (BuildContext context) async => _letras();

class _letras extends StatelessWidget {
  const _letras({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
            "Max Scooter",
            style: TextStyle(
                color: Colors.white,
                fontSize: 50,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
        ),
        Text(
          "Nuevo Scooter en Blanco Glam",
        style: TextStyle(
            color: Colors.white70,
            fontSize: 18,
           ),
         ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Center(
            heightFactor: 1,
            child: Text(
              "Un diseños deportivo, con motor ecologico y de alta Prestaciones para un scooter dueño de la ciudad.",
              textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white54,
                fontSize: 13,
            ),
            ),
          ),
        ),
      ],
    );
  }
}
