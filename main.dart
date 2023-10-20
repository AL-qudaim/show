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
      home:   Tween()
    );
  }
}

class Tween extends StatefulWidget {
  const Tween({super.key});
  @override
  State<Tween> createState() => _TweenState();
}
class _TweenState extends State<Tween> {

  Color endColor =Colors.white;
  double _start = 0;
  double _end = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          setState(() {
            if (endColor==Colors.white){
              endColor=Colors.red;}
            else{
              endColor=Colors.white;
            }});},
        child:TweenAnimationBuilder<Color?>(
          tween:ColorTween(begin: Colors.white,end: endColor),
          builder: (_, value,  child){
            return Center(
              child: Container(
                alignment: Alignment.center,
                width: 200,
                height: 200,
                color: value,
                child: child,
              ),);},
          child: Text("This text will be built only once" ,style: TextStyle(fontSize: 20) ,)  ,
          duration: Duration( microseconds: 200),
          curve: Curves.decelerate,
    onEnd: () {
      setState(() {
       var tmp = _start;
        _start = _end;
        _end = tmp;});}) );}}
