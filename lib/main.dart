import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/first',
      routes: {
        '/first': (context) => Login(),
        '/second': (context) => const Err_Login(),
      },
    );
  }
}

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController valueEmail = TextEditingController();
  TextEditingController valuePassword = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  void _submit() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }
    if (valueEmail.text != valuePassword.text) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Err_Login()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Loading_Login()));
      Timer(
          Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => Mail())));
    }
    _formKey.currentState!.save();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
              child: Column(
                children: <Widget>[
                  Text(
                    'SignIn',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Text(
                    'Speak,friend, and enter',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 70, 0, 10),
              child: TextFormField(
                controller: valueEmail,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  hintText: "Email",
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.black,
                  suffixStyle: const TextStyle(color: Colors.black),
                ),
                onFieldSubmitted: (email) {
                  //Validator
                },
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Vui lòng nhập email';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: TextFormField(
                controller: valuePassword,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  hintText: "Password",
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.black,
                  suffixStyle: const TextStyle(color: Colors.black),
                ),
                onFieldSubmitted: (password) {},
                validator: (password) {
                  if (password!.isEmpty) {
                    return 'Vui lòng nhập password';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 60, 0, 10),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(0, 20, 0, 20)),
                  ),
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => _submit()),
            ),
          ],
        ),
      ),
    );
  }
}

class Err_Login extends StatelessWidget {
  const Err_Login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Column(
                children: <Widget>[
                  Text(
                    "UPS... couldn't Sign IN",
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  Text(
                    "Your username and password don't match",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(
                    "Please, try again.",
                    style: TextStyle(color: Colors.black54),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 240, 0, 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(0, 20, 0, 20)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'TRY AGAIN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Mail extends StatelessWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MailScreen());
  }
}

class MailScreen extends StatelessWidget {
  const MailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget checkboxWidget = checkbox(title: "title");
    Widget deletebuttonWidget = DeleteButton(title: "title");
    Widget numberWidget = Number(title: "title");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MailBoxes',
        ),
        backgroundColor: Colors.grey,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.grey),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              )
            : null,
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              primary: Colors.blue,
              textStyle: const TextStyle(fontSize: 15),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: const Text('Done'),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
            height: 50,
            color: Colors.grey[400],
            child: Text('MailBoxes'),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                checkboxWidget,
                Icon(Icons.email),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'All Inboxes',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                numberWidget,
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                checkboxWidget,
                Icon(Icons.cloud_off),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'iCloud',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                numberWidget,
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                checkboxWidget,
                Icon(Icons.mark_email_unread_outlined),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Gmail',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                numberWidget,
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                checkboxWidget,
                Icon(Icons.mail_outline_outlined),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Hotmail',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                numberWidget,
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                checkboxWidget,
                Icon(Icons.star),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'VIP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                numberWidget,
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 18, 0, 0),
            height: 50,
            color: Colors.grey[400],
            child: Text('Special folder'),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                checkboxWidget,
                Icon(Icons.grade_outlined),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Secure',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                numberWidget,
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                checkboxWidget,
                Icon(Icons.notifications_active_outlined),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Notifications',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                numberWidget,
              ],
            ),
          ),
          deletebuttonWidget,
        ],
      ),
    );
  }
}

class checkbox extends StatefulWidget {
  const checkbox({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<checkbox> createState() => _checkbox();
}

class _checkbox extends State<checkbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            }),
      ],
    );
  }
}

class DeleteButton extends StatefulWidget {
  const DeleteButton({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<DeleteButton> createState() => _DeleteButton();
}

class _DeleteButton extends State<DeleteButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 250),
      child: Center(
        child: Container(
          width: double.infinity,
          height: 50,
          child: RaisedButton(
            onPressed: () {},
            color: Theme.of(context).accentColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'DELETE',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.delete_outline_rounded,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Number extends StatefulWidget {
  const Number({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Number> createState() => _Number();
}

class _Number extends State<Number> {
  int number = 10;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      child: Text(number.toString()),
    );
  }
}

class Loading_Login extends StatelessWidget {
  const Loading_Login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                    child: Column(
                      children: <Widget>[
                        Text(
                          'SignIn',
                          style: TextStyle(color: Colors.cyan, fontSize: 40),
                        ),
                        Text(
                          'Speak,friend, and enter',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Column(
                        children: <Widget>[
                          SpinKitSpinningLines(color: Colors.black)
                        ],
                      )),
                ])));
  }
}
