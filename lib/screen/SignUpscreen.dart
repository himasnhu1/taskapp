import 'package:flutter/material.dart';
import 'LoginScreen.dart';

class SignupScreen extends StatefulWidget {

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  bool remember = false,
  _passwordCheck = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SIGN UP'),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height/5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Vector-12.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key:_formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("SIGN UP", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                    SizedBox(height: MediaQuery.of(context).size.height/15,),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name*',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Name can\'t be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/30,),
                    Row(
                      children: <Widget>[

                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/30,),
                    TextFormField(
                      keyboardType:TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mobile Number*',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Mobile Number can\'t be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/30,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Email can\'t be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/30,),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      obscureText: _passwordCheck,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: const EdgeInsets.only(top: 12.0),
                        prefixIcon: Icon(Icons.lock, color: Colors.black),
                        suffixIcon: IconButton(
                          icon: _passwordCheck
                              ? Icon(Icons.visibility_off_rounded)
                              : Icon(Icons.visibility_rounded),
                          onPressed: () {
                            setState(() {
                              _passwordCheck = !_passwordCheck;
                            });
                          },
                        ),
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password can\'t be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/30,),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ReEnter-Password',
                          contentPadding: const EdgeInsets.only(top: 12.0),
                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                          suffixIcon: IconButton(
                            icon: _passwordCheck
                                ? Icon(Icons.visibility_off_rounded)
                                : Icon(Icons.visibility_rounded),
                            onPressed: () {
                              setState(() {
                                _passwordCheck = !_passwordCheck;
                              });
                            },
                          )

                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password can\'t be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/20,),
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color. fromRGBO(255, 153, 43, 1.0),
                        ),
                        child: Center(
                            child: Text("SIGN UP",style: TextStyle(fontSize: MediaQuery.of(context).size.width/22,color: Colors.white))
                        ),
                      ),
                      onTap: (){
                        if(_formKey.currentState.validate() == false)
                        {

                        }
                        else {
                        // ignore: unnecessary_statements
                        Navigator.pushNamed(context, '/home');
                        }
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/20,),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text.rich(
                          TextSpan( // default text style
                            children: <TextSpan>[
                              TextSpan(text: 'Already have an Account? ', style: TextStyle(color: Color. fromRGBO(175, 175, 175, 1.0),)),
                              TextSpan(text: 'LOGIN', style: TextStyle(fontSize: MediaQuery.of(context).size.width/22, color: Color. fromRGBO(255, 153, 43, 1.0),)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}