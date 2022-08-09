import 'package:ecoapp/modules/login/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {final formKey = GlobalKey<FormState>();
  late final controller = LoginController(onSuccessLogin: () {
    Navigator.pushNamed(context, "/home");
  }, onUpdate: (){
    setState((){});
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2D4C47),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/littletree.png', height: 80,),
              RichText(
                text: TextSpan(
                  //style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'B', style: TextStyle(color: Colors.white, fontSize: 22)),
                    TextSpan(text: 'ECO', style: TextStyle(color: Color(0xff15BA5B), fontSize: 22)),
                    TextSpan(text: 'MING', style: TextStyle(color: Colors.white, fontSize: 22))
                  ],
                )
              ),
              Text(
                "FRIENDLY",
                style: TextStyle(fontSize: 22, color: Color(0xff15BA5B)),
              ),
              SizedBox(height:35.0,),
              TextFormField(
                style: TextStyle(color: Colors.white),

                decoration: InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "EMAIL",
                    fillColor: Colors.green,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.5),
                    borderRadius: BorderRadius.circular(15.0)
                  )
                    ),
                validator: (value) => controller.validateEmail(value),
                onSaved: (value) => controller.email = value,
              ),
              SizedBox(height:13.0,),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "PASSWORD",
                    fillColor: Colors.green,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)
                    )
                ),
                obscureText: true,
                validator: (value) => controller.validadePassword(value),
                onSaved: (value) => controller.password = value,
              ),
              SizedBox(height: 20.0,),
              if (controller.isLoading)
                CircularProgressIndicator()
              else if (controller.error.isNotEmpty)
                Text(
                  controller.error,
                  style: TextStyle(color: Colors.red),

                )

              else
                TextButton(
                    style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(color: Colors.green),
                      )

                    ),
                    backgroundColor: MaterialStateProperty.all(Color(0xff15BA5B))),
                    onPressed: () {
                      if (controller.validate()) {
                        controller.login();
                      }
                    },
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(color: Colors.white),
                    ))
            ],
          ),
        ),
      ),);
  }
}


