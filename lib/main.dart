import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LoginPage(),
        theme: ThemeData(
          primarySwatch: Colors.green,
        ));
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
 late Animation<double> _iconAnimation;
  @override
  void initState(){
    super.initState();
    _iconAnimationController = AnimationController(vsync: this,duration:  Duration(milliseconds: 500));
    _iconAnimation =  CurvedAnimation(parent: _iconAnimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(()=> {this.setState(() {})});
    _iconAnimationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(fit: StackFit.expand, children: <Widget>[
        const Image(
          image: AssetImage("assets/app.png"),
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(
              size: _iconAnimation.value *100,
            ),
            Form(

                child: Theme(
                  data: ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: const InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 20


                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>
              [
                    TextFormField(

    decoration: const InputDecoration(
    labelText: "Enter Your Email",
    ),
                      keyboardType: TextInputType.emailAddress,

                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Enter Your Password",

                      ),
                      keyboardType: TextInputType.text,

                      obscureText: true,

                    ),
                const Padding(padding: EdgeInsets.only(top:20)),
                  MaterialButton(
                color: Colors.teal,
                  textColor: Colors.white,
                  child: Text('Login'),
                  onPressed: () => {},


                ),
              ],
            ),
                  ),
                ))
          ],
        )
      ]),
    );
  }
}
