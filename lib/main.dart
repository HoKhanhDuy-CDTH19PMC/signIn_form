import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       initialRoute: '/first',
       routes: {
      '/first':(context)=>const Login(),
         '/second':(context)=>const Err_Login(),
       },
     );
  }
}
class Login extends StatelessWidget with InputValidationMixin{
  const Login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(

        backgroundColor: Colors.cyan,
        body: Form(
          key: _formKey,

          child: ListView(
            padding: EdgeInsets.fromLTRB(20, 60, 20, 0),

            children: <Widget>[
              Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/logo.png'),

                  ),
                  shape: BoxShape.circle,
                ),
              ),
                Container(
                      alignment: Alignment.center,
                   padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Column(children: <Widget>[
                      Text(
                      'SignIn',
                       style: TextStyle(color: Colors.white,fontSize: 40),
                         ),
                      Text('Speak,friend, and enter',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)
                        ],
                        ),
             ),
                  Container(
                margin: EdgeInsets.fromLTRB(0,70,0,10  ),
                child: TextFormField( obscureText: false, decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  prefixIcon: Icon(Icons.email,color: Colors.black,),
                  hintText: "Email",
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.black,
                    suffixStyle: const TextStyle(color: Colors.black),

                ),

                ),

              ),
               Container(
                margin: EdgeInsets.fromLTRB(0,30,0,10  ),
                child: TextFormField( obscureText: true, decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  prefixIcon: Icon(Icons.lock,color: Colors.black,),
                  // labelText: "tuanduy@caothang.edu.vn",
                  hintText: "Password",
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.black,
                    suffixStyle: const TextStyle(color: Colors.black),

                ),
                  validator: (value){
                  },
                ),

              ),
              Container(
                margin: EdgeInsets.fromLTRB(0,60,0,10  ),
                   child: ElevatedButton(
                     style:ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0,20,0,20)),
                ),
                  child: const Text('SIGN IN',style: TextStyle(color: Colors.white),),
                     onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Err_Login()));
                     },
          ),
              ),
          
            ],
          ),
        ),
      );

  }

  }
mixin InputValidationMixin {
  bool isEmailNotValid(String email) => email.length == 0;

  bool isPasswordNotValid(String password) => password.length == 1;
}


class Err_Login extends StatelessWidget {
  const Err_Login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
        child: ListView(
          children: <Widget>[
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/logo.png'),

                ),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Column(children: <Widget>[
                Text(
                  "UPS... couldn't Sign IN" ,
                  style: TextStyle(color: Colors.black,fontSize: 22),
                ),
                Text("Your username and password don't match",
                  style: TextStyle(color: Colors.black54),),
                Text("Please, try again.",
                  style: TextStyle(color: Colors.black54),)
              ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0,240,0,10  ),
              child: ElevatedButton(
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0,20,0,20)),
                ),
                onPressed: null,
                child: const Text('TRY AGAIN',style: TextStyle(color: Colors.white),),
              ),
            ),

          ],
        ),
      ),
    );
  }
  }
