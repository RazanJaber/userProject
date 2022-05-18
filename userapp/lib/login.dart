


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userapp/user.dart';
import 'package:http/http.dart' as http;


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  //import user here
  User user = User("", "");
  //add your server url
  String url =  "http://localhost:8080/demo/login";
  //we need to use http here like my future mrthod which will be save but type async, so we can await http post method
  Future save() async{
    //you can define your header like your content type which will be application/json, and the body will be json
    //here inside encode you need to define users details, email and password
    //you need to add Uri.parse, add  "Access-Control_Allow_Origin": "*" to header
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type':'application/json'},
        body: json.encode({'email': user.email,'password': user.password}));
        print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : SingleChildScrollView(
          key: _formKey,
          child: Form(
              child: Column(
                children: [
                  Container(
                    height: 700,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 65, 82, 1),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                           bottomRight:Radius.circular(22),
                      )
                    ) ,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
            children: [
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        child: Text(
                          "Login",
                          style: GoogleFonts.pacifico(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white,
                        )),
                      ),
                   SizedBox(
                       height: 30,
                   ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Email", style: GoogleFonts.roboto(
                         fontSize: 40,
                         color: Color.fromRGBO(255, 255, 255, 0.8),
                   ),
                   ),
                      ),
                  TextFormField(
                    controller: TextEditingController(text: user.email),
                    onChanged: (val){
                      user.email = val;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is Empty';
                      }
                      return '';
                    },

                    style: TextStyle(
                      fontSize: 30,color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none
                      )
                    ),
                  ),
                  Container(
                    height: 8,
                    color: Color.fromRGBO(255, 255, 255, 0.4),
                  ),
            SizedBox(height: 60,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Password", style: GoogleFonts.roboto(
                      fontSize: 40,
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                    ),
                    ),
                  ),
                  TextFormField(
                    controller: TextEditingController(text: user.password),
                    onChanged: (val){
                      user.password = val;
                    },
                    //need to check null
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is Empty';
                      }
                      return '';
                    },

                    style: TextStyle(
                        fontSize: 30,color: Colors.white),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none
                        )
                    ),
                  ),
                  Container(
                    height: 8,
                    color: Color.fromRGBO(255, 255, 255, 0.4),
                  ),
                    SizedBox(
                      height: 30,
                    ),
            Text("Don't have Account?",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),)
            ],
            ),
                    ),
        ),

                  SizedBox(
                    height: 40,
                  ),
                  //flatbutton is deprecated, use textbutton instead
                  TextButton(
                    onPressed: () {
                      save();
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 40,),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromRGBO(233, 65, 82, 1)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(90),
                               //   side: BorderSide(color: Colors.red)
                              )
                          ),
                          side: MaterialStateProperty.all(
                              const BorderSide(width: 2, color: Colors.red)),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 30)))
                    ),

                ],
              ),

          ),
        )
    );
  }
}


