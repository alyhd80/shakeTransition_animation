import 'package:flutter/material.dart';

class MainShakeTransition extends StatelessWidget {
  const MainShakeTransition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: Text("Shake transitions"),
        elevation: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ShakeTransition(
              child: Text(
                "hello world ",
                style: Theme.of(context).textTheme.headline3,
              ),
              axis: Axis.horizontal,
            ),
            SizedBox(height: 20,),
            ShakeTransition(
              child: Container(
                color: Colors.blue,
                child: TextButton(
            onPressed: () {  }, child: Text(     "hello world ",
                  style: Theme.of(context).textTheme.headline3),
                ),
              ),
              duration: Duration(milliseconds: 1200),
              axis: Axis.vertical,
            ),
            SizedBox(height: 40,),
            ShakeTransition(
              child: CircleAvatar(backgroundColor: Colors.red,),
              offset: 300,
              duration: Duration(milliseconds: 1200),
              axis: Axis.vertical,
            ),


          ],
        ),
      ),
    );
  }
}

class ShakeTransition extends StatelessWidget {
  const ShakeTransition(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 900),
      this.offset = 140,  this.axis=Axis.horizontal})
      : super(key: key);

  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        child: child,
        tween: Tween(begin: 2.0, end: 0.0),
        curve: Curves.bounceOut,
        duration: duration,
        builder: (context, value, child) {
          return Transform.translate(
            offset:axis==Axis.horizontal? Offset(value * offset, 0):Offset(0, value * offset),
            child: child,
          );
        });
  }
}
