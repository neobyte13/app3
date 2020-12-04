import 'package:GberaaDelivery/providers/current_user.dart';
import 'package:GberaaDelivery/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _logInUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      if (await _currentUser.logInUser(email, password)) {
        Navigator.of(context).pushReplacementNamed('/homescreen');
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('An error occured. Please try again'),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {
      print(e);
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
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: maxSize.height * 0.03,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter a valid password';
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
                      child: RaisedButton(
                        color: kMainColor,
                        highlightColor: kMainColor,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _logInUser(_emailController.text,
                                _passwordController.text, context);
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Confirm the details you entered'),
                              duration: Duration(seconds: 2),
                            ));
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            backgroundColor: kMainColor,
                            decorationColor: kMainColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an Account ?  ',
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text(
                                'Sign up Now!',
                                style: TextStyle(
                                  color: Color(0xFFFBAA29),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
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
