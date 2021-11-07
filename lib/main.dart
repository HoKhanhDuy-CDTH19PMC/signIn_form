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
      '/first':(context)=>Login(),
         '/second':(context)=>const Err_Login(),
       },
     );
  }
}
class Login extends StatefulWidget {

  @override
  _Login createState() => _Login();
}
class _Login extends State<Login>{
  TextEditingController valueEmail =  TextEditingController();
  TextEditingController valuePassword = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  void _submit() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }
    if(valueEmail.text!=valuePassword.text)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Err_Login()));
      }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Loading_Login()));
      Timer(
          Duration(seconds: 3),
              () =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => List_Email())));

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
                child: TextFormField(controller: valueEmail, obscureText: false, decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  prefixIcon: Icon(Icons.email,color: Colors.black,),
                  hintText: "Email",
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.black,
                    suffixStyle: const TextStyle(color: Colors.black),

                ),
                  onFieldSubmitted: (email) {
                    //Validator
                  },
                  validator: (email){
                  if(email!.isEmpty){
                    return 'Vui lòng nhập email';
                  }
                  return null;
                  },
                ),

              ),
               Container(
                margin: EdgeInsets.fromLTRB(0,20,0,10  ),
                child: TextFormField( controller:valuePassword, obscureText: true, decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  prefixIcon: Icon(Icons.lock,color: Colors.black,),
                  hintText: "Password",
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.black,
                    suffixStyle: const TextStyle(color: Colors.black),

                ),
                  onFieldSubmitted: (password) {},
                  validator: (password){
                    if(password!.isEmpty){
                      return 'Vui lòng nhập password';
                    }
                    return null;
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
                     onPressed: () => _submit()
          ),
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
                onPressed: (){Navigator.pop(context);},
                child: const Text('TRY AGAIN',style: TextStyle(color: Colors.white),),
              ),
            ),

          ],
        ),
      ),
    );
  }
  }
class Loading_Login extends StatelessWidget {
  const Loading_Login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
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
                  child: Column(children: <Widget>[
                    Text(
                      'SignIn',
                      style: TextStyle(color: Colors.cyan,fontSize: 40),
                    ),
                    Text('Speak,friend, and enter',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)
                  ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child:Column(
                      children: <Widget>[
                        SpinKitSpinningLines(color: Colors.black)
                      ],
                    )
                ),



          ]
          )

      )


    );


        }
  }

class List_Email extends StatelessWidget {
    const List_Email({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(

          appBar: AppBar(

            centerTitle: true,
            backgroundColor: Colors.cyan,
            title: Text(
              "Mailboxes",
            ),
          ),
          body: SafeArea(
              child: Center(
                child: List_Checkbox(),
              ))),
      );
  }
}
class List_Checkbox extends StatefulWidget {
  @override
 List_CheckboxState createState() =>  List_CheckboxState();
}
class  List_CheckboxState extends State<List_Checkbox>{
  Map<String, bool> List = {
    "All inboxes": false,
    "ICould": false,
    "Gmail": false,
    "HotMail": false,
    "VIP": false,
    "Boxes": false,
  };

  var holder_1 = [];

  removeAllCheckItems() {
    List.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });
    holder_1.forEach((element) {
      setState(() {
        List.remove(element);
      });
    });

    holder_1.clear();
    print(holder_1);



  }

  getItems() {
    print(holder_1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[

      Container(
        color: Colors.grey,
      padding: EdgeInsets.fromLTRB(10,10,10,10),
        margin: EdgeInsets.fromLTRB(0,0,0,5),
        alignment: Alignment.topLeft,

        child: Text(

          'MailBoxes',
          style: TextStyle(color: Colors.black54,fontSize:18),
        ),
      ),
      Expanded(
        child: ListView(
          children: List.keys.map((String key) {
            return  CheckboxListTile(

              value: List[key],
              title: Text(key),

              activeColor: Colors.white,
              checkColor: Colors.black,
              onChanged: (value) =>
                setState(() {
                  List[key] = value as bool;
                  if (value == false) {
                    holder_1.remove(key);
                  } else {
                    holder_1.add(key);
                  }
                }
                )

              ,
            );
          }).toList(),
        ),
      ),
      RaisedButton(
        child: Text("Remove all Checked Items "),
        onPressed: removeAllCheckItems,
        color: Colors.cyan,
        textColor: Colors.white,
        splashColor: Colors.grey,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      )
    ]);
  }

}



