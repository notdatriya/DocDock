
import 'package:doc_dock/Screens/root_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _lastName = '';
  String _contactNumber = '';
  String _email = '';
  String _city = '';
  String _age = '';
  String _gender = '';
  String _password = '';
  String _confirmPassword = '';

  String _genderValue = '';
  final List<String> _genderList = ['M', 'F', 'Others'];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(

      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff151413),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 38,
      ),
      body: SingleChildScrollView(
        reverse: true, // this is new
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            SizedBox(height:30 ,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Container(
                height: height*.92,
                decoration: BoxDecoration(
                  color: Color(0xff2A2C28),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                    children:[
                      SizedBox(height: 20,),
                      Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
                      ),
                      // Phone number text field
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: Color(0xff151413),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter your first name',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            labelStyle: TextStyle(color: Colors.white70),
                          ),
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),

                      // Password text field
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: Color(0xff151413),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter your last name',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            labelStyle: TextStyle(color: Colors.white70),
                          ),
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: Color(0xff151413),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter your phone number',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            labelStyle: TextStyle(color: Colors.white70),
                          ),
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),

                      // Password text field
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: Color(0xff151413),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter your email id',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            labelStyle: TextStyle(color: Colors.white70),
                          ),
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: Color(0xff151413),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter your city',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            labelStyle: TextStyle(color: Colors.white70),
                          ),
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),

                      Container(
                        height: 60,
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        color: Color(0xff2A2C28),
                        // decoration: BoxDecoration(
                        //
                        //   borderRadius: BorderRadius.circular(20),
                        // ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*.42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xff151413),
                            ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your age',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                  labelStyle: TextStyle(color: Colors.white70),
                                ),
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xff151413),
                              ),

                              width: width*.36,
                              child:
                              FormField<String>(
                                builder: (FormFieldState<String> state) {
                                  return Container(
                                    height: 60,
                                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                                    decoration: BoxDecoration(
                                      color: Color(0xff151413),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: DropdownButtonFormField<String>(
                                      dropdownColor: Color(0xff2A2C28),
                                      hint: Text('Gender', style: TextStyle(color: Colors.white70)),
                                      value: _genderValue,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _genderValue = newValue!;
                                          state.didChange(newValue);
                                        });
                                      },
                                      items: _genderList.map((gender) {
                                        return DropdownMenuItem(
                                          value: gender,
                                          child: Text(
                                            gender,
                                            style: TextStyle(color: Colors.white70),
                                          ),
                                        );
                                      }).toList(),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                      ),
                                    ),
                                  );
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select your gender.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Password text field
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: Color(0xff151413),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter your Password',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            labelStyle: TextStyle(color: Colors.white70),
                          ),
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: Color(0xff151413),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            labelStyle: TextStyle(color: Colors.white70),
                          ),
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RootPage()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(0xff6FBDB4),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(child: Text('Sign Up',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),)),
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// Scaffold(
// backgroundColor: Color(0xff151413),
// appBar: AppBar(
// backgroundColor: Colors.transparent,
// //title: Text('Sign Up'),
// ),
// body: SingleChildScrollView(
// child: Container(
// margin:EdgeInsets.all(30.0),
// decoration: BoxDecoration(
// color:Color(0xff2A2C28), //AppColors.loginbgColor.withOpacity(0.4),
// borderRadius: BorderRadius.circular(20)),
// padding: EdgeInsets.all(16.0),
// child: Column(
// children: [
// Center(child: Text('Sign up',style: TextStyle(color: Colors.white70,fontSize: 25,fontWeight: FontWeight.bold))),
// Form(
// key: _formKey,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: <Widget>[
// TextFormField(
// decoration: InputDecoration(labelText: 'First Name*'),
// validator: (value) {
// if (value!.isEmpty) {
// return 'Please enter your first name';
// }
// return null;
// },
// onSaved: (value) => _firstName = value!,
// ),
// TextFormField(
// decoration: InputDecoration(labelText: 'Last Name'),
// onSaved: (value) => _lastName = value!,
// ),
// TextFormField(
// decoration: InputDecoration(labelText: 'Contact Number*'),
// keyboardType: TextInputType.phone,
// validator: (value) {
// if (value!.isEmpty) {
// return 'Please enter your contact number';
// }
// return null;
// },
// onSaved: (value) => _contactNumber = value!,
// ),
// TextFormField(
// decoration: InputDecoration(labelText: 'Email*'),
// keyboardType: TextInputType.emailAddress,
// validator: (value) {
// if (value!.isEmpty) {
// return 'Please enter your email';
// }
// return null;
// },
// onSaved: (value) => _email = value!,
// ),
// TextFormField(
// decoration: InputDecoration(labelText: 'City'),
// onSaved: (value) => _city = value!,
// ),
// TextFormField(
// decoration: InputDecoration(labelText: 'Age*'),
// keyboardType: TextInputType.number,
// validator: (value) {
// if (value!.isEmpty) {
// return 'Please enter your age';
// }
// return null;
// },
// onSaved: (value) => _age = value!,
// ),
//
// // DropdownButtonFormField(
// // decoration: InputDecoration(labelText: 'Gender*'),
// // value: _gender,
// // onChanged: (value) {
// // setState(() {
// // _gender = value!;
// // });
// // },
// // validator: (value) {
// // if (value == null) {
// // return 'Please select your gender';
// // }
// // return null;
// // },
// // items: _genderList.map((gender) {
// // return DropdownMenuItem(
// // value: gender,
// // child: Text(gender),
// // );
// // }).toList(),
// // ),
// //
// TextFormField(
// decoration: InputDecoration(labelText: 'Password*'),
// obscureText: true,
// validator: (value) {
// if (value!.isEmpty) {
// return 'Please enter a password';
// }
// return null;
// },
// onSaved: (value) => _password = value!,
// ),
// TextFormField(
// decoration: InputDecoration(labelText: 'Confirm Password*'),
// obscureText: true,
// validator: (value) {
// if (value!.isEmpty) {
// return 'Please confirm your password';
// } else if (
// _password != value) {
// return 'Passwords do not match';
// }
// return null;
// },
// onSaved: (value) => _confirmPassword = value!,
// ),
// SizedBox(
// height: 16.0,
// ),
// ElevatedButton(
// // color: Theme.of(context).primaryColor,
// // textColor: Colors.white,
// onPressed: () {
// if (_formKey.currentState!.validate()) {
// _formKey.currentState!.save();
//
// }
// },
// child: Text('Sign Up'),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ),
// );