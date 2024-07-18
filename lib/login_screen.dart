import 'package:batch5pm/utils/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _confirmPassController;
  late TextEditingController _passwordController;
  late bool isObscureText;
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    isObscureText = true;
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _confirmPassController = TextEditingController();
    _passwordController = TextEditingController();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              TextFormField(
                controller: _emailController,
                cursorColor: Colors.blue,
                cursorWidth: 2,
                cursorHeight: 15,
                cursorRadius: const Radius.circular(35),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) => MySnackBar.emailValidator(value),
                onChanged: (String? value) {},
                onTapOutside: (PointerDownEvent p) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: MySnackBar.commonInputDecoration,
              ),
              const SizedBox(height: 20),
              IntlPhoneField(
                controller: _phoneController,
                decoration:InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  // labelText: "Enter Mobile",
                  hintStyle: const TextStyle(
                    color: Colors.blue,
                  ),
                  labelText: "Enter Mobile",
                  prefixIcon: const Icon(
                    Icons.mobile_friendly,
                    color: Colors.blue,
                  ),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                initialCountryCode: 'GB',
                onChanged: (phone) {
                  print(phone.completeNumber);
                  print(phone.countryCode);
                  print(phone.countryISOCode);
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                cursorColor: Colors.blue,
                cursorWidth: 2,
                cursorHeight: 15,
                cursorRadius: const Radius.circular(35),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isObscureText,
                onTapOutside: (value) {
                  if (myFocusNode.hasFocus) {
                    myFocusNode.unfocus();
                  }
                },
                onEditingComplete: () {
                  myFocusNode.requestFocus();
                },
                // validator: (String? value) {
                //   if (value == null || value == '') {
                //     return "Enter a password";
                //   } else if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) {
                //     return "Should contain at least one upper case";
                //   } else if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
                //     return "Should contain at least one lower case";
                //   } else if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
                //     return "Should contain at least one digit";
                //   } else if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value)) {
                //     return "Should contain at least one Special character";
                //   } else if (!RegExp(r'^.{10,}').hasMatch(value)) {
                //     return "Must be at least 10 characters in length ";
                //   } else {
                //     return null;
                //   }
                // },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  // hintText: "Enter your email",
                  // hintStyle:const TextStyle(
                  //   color: Colors.grey,
                  // ),
                  labelText: "Enter Password",
                  labelStyle: const TextStyle(
                    color: Colors.blue,
                  ),
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.blue,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    icon: isObscureText
                        ? Image.asset(
                            'images/eye.png',
                            width: 25,
                            height: 25,
                            color: Colors.blue,
                          )
                        : const Icon(
                            Icons.remove_red_eye,
                            color: Colors.blue,
                          ),
                  ),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                focusNode: myFocusNode,
                controller: _confirmPassController,
                cursorColor: Colors.blue,
                cursorWidth: 2,
                cursorHeight: 15,
                cursorRadius: const Radius.circular(35),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isObscureText,
                validator: (String? value) {
                  if (value == null || value == '') {
                    return "Enter a confirm password";
                  } else if (value != _passwordController.text) {
                    return "Both password must be same!";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  // hintText: "Enter your email",
                  // hintStyle:const TextStyle(
                  //   color: Colors.grey,
                  // ),
                  labelText: "Enter Confirm Password",
                  labelStyle: const TextStyle(
                    color: Colors.blue,
                  ),
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.blue,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    icon: isObscureText
                        ? Image.asset(
                            'images/eye.png',
                            width: 25,
                            height: 25,
                            color: Colors.blue,
                          )
                        : const Icon(
                            Icons.remove_red_eye,
                            color: Colors.blue,
                          ),
                  ),
                  // enabled: false
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          MySnackBar.showMySnackBar(
                            context: context,
                            content: _phoneController.text,
                            backgroundColor: Colors.green,
                          );

                          if (_formKey.currentState!.validate()) {
                            /// API call
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  myFocusNode.unfocus();
                  _emailController.clear();
                  _confirmPassController.clear();
                  _passwordController.clear();
                  setState(() {});
                  _formKey.currentState!.reset();
                },
                child: const Text('Clear'),
              ),
              const SizedBox(height: 20),
              // TextButton(
              //   onPressed: () {},
              //   child: Text(
              //     'Forgot Password',
              //     style: TextStyle(
              //       color: Colors.blue.shade900,
              //       decoration: TextDecoration.underline,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      print("inkwell clicked");
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              GestureDetector(
                onTap: (){
                  print('Gesture click');
                },
                onLongPress: (){
                  print('on long press');
                },
                child: Text('Hello'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
