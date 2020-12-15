import 'package:GberaaDelivery/models/user_model.dart';
import 'package:GberaaDelivery/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> saveData(context) async {
    User curUser =
        User(name: _nameController.text, phone: _phoneController.text);
    if (_formKey.currentState.validate()) {
      await FlutterSession().set('user', curUser);
      print('Success');
      print('$_nameController.text => $_phoneController.text');
      Navigator.pushReplacementNamed(context, '/homescreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) => SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset('assets/images/login.png'),
                    Text(
                      'Deliver Everything',
                      style: kMainHeading,
                    ),
                    SizedBox(
                      height: maxSize.height * 0.03,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _nameController,
                      decoration: const InputDecoration(
                          labelText: 'What is your name?'),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: maxSize.height * 0.03,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _phoneController,
                      decoration: const InputDecoration(
                          labelText: 'What is your phone number?'),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: maxSize.height * 0.07,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      decoration: BoxDecoration(
                          color: kMainColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400],
                              offset: Offset(6.0, 6.0),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-6.0, -6.0),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                            ),
                          ]),
                      alignment: Alignment.center,
                      child: InkWell(
                        highlightColor: kMainColor,
                        onTap: () {
                          saveData(context);
                          // if (_formKey.currentState.validate()) {
                          //   _logInUser(_emailController.text,
                          //       _passwordController.text, context);
                          // } else {
                          //   Scaffold.of(context).showSnackBar(SnackBar(
                          //     content: Text('Confirm the details you entered'),
                          //     duration: Duration(seconds: 2),
                          //   ));
                          // }
                        },
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            backgroundColor: kMainColor,
                            decorationColor: kMainColor,
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text(
                    //         'Don\'t have an Account ?  ',
                    //       ),
                    //       GestureDetector(
                    //         onTap: () {},
                    //         child: InkWell(
                    //           onTap: () {
                    //             Navigator.pushNamed(context, '/signup');
                    //           },
                    //           child: Text(
                    //             'Sign up Now!',
                    //             style: TextStyle(
                    //               color: Color(0xFFFBAA29),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
