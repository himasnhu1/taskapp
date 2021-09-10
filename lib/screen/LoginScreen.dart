import 'package:flutter/material.dart';

import '../constant.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget  {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>
with TickerProviderStateMixin {
  TextEditingController _username = TextEditingController(),
      _password = TextEditingController();
  final _formKeys = GlobalKey<FormState>();

  bool _passwordCheck = true;
  AnimationController _controller, _altcontroller;
  Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      lowerBound: 0.5,
      upperBound: 1.0,
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _altcontroller = AnimationController(
      value: 1,
      lowerBound: 0.5,
      upperBound: 1.0,
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    _altcontroller.dispose();
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKeys,
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            children:<Widget>[
              SizedBox(height: 10),
              Text(loginScreenHeader, style: oHeader),
              SizedBox(height:10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Align(
                    alignment: Alignment.centerLeft, child: Text(mobileNumber)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    controller: _username,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(Icons.account_circle, color: Colors.black),
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return 'user Number can\'t be empty';
                      }
                      return null;
                    }
                ),
              ),
              SizedBox(height:5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child:
                Align(alignment: Alignment.centerLeft, child: Text(password)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                    controller: _password,
                    textInputAction: TextInputAction.done,
                    obscureText: _passwordCheck,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)
                      ),
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
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return 'password can\'t be empty';
                      }
                      return null;
                    }
                ),
              ),
            SizedBox(height: 20,),
            FlatButton(onPressed: (){
              if(_formKeys.currentState.validate()== false){}
              else{
                Navigator.pushNamed(context,'/home');
              }

            },
                color: Colors.black26,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ,child: Text('Sign-up')
            ),
              textButton(
                signupButton,
                    () => Navigator.pushNamed(context, '/Registration_Screen'),
              ),
              twoBubblesAnimation()
            ],
          ),
        ),
      ),
    );
  }
  Widget twoBubblesAnimation() => Stack(
    children: <Widget>[
      Transform.translate(
        offset: Offset(-130, 80),
        child: ScaleTransition(
          scale: _animation,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: colorList.shade300.withAlpha(255),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
      Transform.translate(
        offset: Offset(-60, 80),
        child: ScaleTransition(
          scale: _altcontroller,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: colorList.shade500.withAlpha(210),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    ],
  );
}

