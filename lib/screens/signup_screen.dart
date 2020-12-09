// import 'package:GberaaDelivery/providers/current_user.dart';
// import 'package:GberaaDelivery/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SignupScreen extends StatefulWidget {
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();

//   void _signUpUser(String email, String password, BuildContext context) async {
//     CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

//     try {
//       if (await _currentUser.signUpUser(email, password)) {
//         Navigator.of(context).pushReplacementNamed('/login');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size maxSize = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Builder(
//         builder: (context) => Container(
//           margin: EdgeInsets.all(20),
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   Image.asset('assets/images/login.png'),
//                   Text(
//                     'Sign Up',
//                     style: kMainHeading,
//                   ),
//                   SizedBox(
//                     height: maxSize.height * 0.03,
//                   ),
//                   TextFormField(
//                     controller: _fullNameController,
//                     decoration: const InputDecoration(labelText: 'Full Name'),
//                     validator: (String value) {
//                       if (value.isEmpty) {
//                         return 'Please enter your full name';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: maxSize.height * 0.03,
//                   ),
//                   TextFormField(
//                     controller: _emailController,
//                     decoration: const InputDecoration(labelText: 'Email'),
//                     validator: (String value) {
//                       if (value.isEmpty) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: maxSize.height * 0.03,
//                   ),
//                   TextFormField(
//                     controller: _phoneController,
//                     decoration:
//                         const InputDecoration(labelText: 'Phone Number'),
//                     validator: (String value) {
//                       if (value.isEmpty) {
//                         return 'Please enter a valid phone number';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: maxSize.height * 0.03,
//                   ),
//                   TextFormField(
//                     controller: _passwordController,
//                     decoration: const InputDecoration(labelText: 'Password'),
//                     validator: (String value) {
//                       if (value.isEmpty) {
//                         return 'Please enter a password';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: maxSize.height * 0.07,
//                   ),
//                   TextFormField(
//                     controller: _confirmPasswordController,
//                     decoration:
//                         const InputDecoration(labelText: 'Confirm Password'),
//                     validator: (String value) {
//                       if (value.isEmpty) {
//                         return 'Please enter a matching password';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: maxSize.height * 0.07,
//                   ),
//                   Container(
//                     padding: const EdgeInsets.symmetric(vertical: 16.0),
//                     decoration: BoxDecoration(
//                         color: kMainColor,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey[400],
//                             offset: Offset(6.0, 6.0),
//                             blurRadius: 10.0,
//                             spreadRadius: 1.0,
//                           ),
//                           BoxShadow(
//                             color: Colors.white,
//                             offset: Offset(-6.0, -6.0),
//                             blurRadius: 10.0,
//                             spreadRadius: 1.0,
//                           ),
//                         ]),
//                     alignment: Alignment.center,
//                     child: RaisedButton(
//                       color: kMainColor,
//                       highlightColor: kMainColor,
//                       onPressed: () {
//                         if (_formKey.currentState.validate() &&
//                             _passwordController.text ==
//                                 _confirmPasswordController.text) {
//                           _signUpUser(_emailController.text,
//                               _passwordController.text, context);
//                         } else {
//                           Scaffold.of(context).showSnackBar(SnackBar(
//                             content: Text('Confirm the details you entered'),
//                             duration: Duration(seconds: 2),
//                           ));
//                         }
//                       },
//                       child: Text(
//                         'Submit',
//                         style: TextStyle(
//                           backgroundColor: kMainColor,
//                           decorationColor: kMainColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(10.0),
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.pushNamed(context, '/login');
//                       },
//                       child: Text(
//                         'Have an account? Log In',
//                         style: TextStyle(
//                           color: Color(0xFFFBAA29),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: maxSize.height * 0.07,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
