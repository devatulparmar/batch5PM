import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _confirmPassController;
  late TextEditingController _passwordController;
  bool isObscureText = true;
  String s1 = '', s2 = '', s3 = '', s4 = '', s6 = '';

  void _validate() {
    if (_emailController.text.isEmpty && _passwordController.text.isEmpty) {
      s1 = "enter an email or password";
    } else if (_passwordController.text != _confirmPassController.text) {
      s2 = 'both password must be same!';
    } else if (_passwordController.text.length < 8) {
      s3 = 'password must be grater then 8';
    } else {
      s4 = 'login success';
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _confirmPassController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _confirmPassController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            children: [
              TextFormField(
                controller: _emailController,
                cursorColor: Colors.red,
                cursorWidth: 2,
                cursorHeight: 15,
                cursorRadius: const Radius.circular(35),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value == null || value == '') {
                    return "Enter an Email";
                  } else {
                    return '';
                  }
                },
                onChanged: (String? value) {
                  print(value);
                },
                onTapOutside: (PointerDownEvent p) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onTap: () {
                  print("on tap called ");
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
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  labelText: "Enter Email",
                  labelStyle: const TextStyle(
                    color: Colors.red,
                  ),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.red,
                  ),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),

              const SizedBox(height: 20),

              // TextField(
              //   // readOnly: true,
              //   controller: _emailController,
              //   cursorColor: Colors.red,
              //   cursorWidth: 2,
              //   cursorHeight: 15,
              //   cursorRadius: const Radius.circular(35),
              //   textDirection: TextDirection.ltr,
              //   textAlign: TextAlign.start,
              //   textInputAction: TextInputAction.next,
              //   keyboardType: TextInputType.emailAddress,
              //   onChanged: (String? value) {
              //     print(value);
              //   },
              //   onTapOutside: (PointerDownEvent p) {
              //     FocusManager.instance.primaryFocus?.unfocus();
              //   },
              //   onTap: () {
              //     print("on tap called ");
              //   },
              //   // maxLength: 5,
              //   // maxLines: 5,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(35),
              //       borderSide: const BorderSide(
              //         color: Colors.black,
              //         width: 2,
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(35),
              //       borderSide: const BorderSide(
              //         color: Colors.red,
              //         width: 2,
              //       ),
              //     ),
              //     // hintText: "Enter your email",
              //     // hintStyle:const TextStyle(
              //     //   color: Colors.grey,
              //     // ),
              //     labelText: "Enter Email",
              //     labelStyle: const TextStyle(
              //       color: Colors.red,
              //     ),
              //     prefixIcon: const Icon(
              //       Icons.email,
              //       color: Colors.red,
              //     ),
              //     suffixIcon: const Icon(
              //       Icons.search,
              //       color: Colors.red,
              //     ),
              //     // enabled: false
              //     floatingLabelAlignment: FloatingLabelAlignment.start,
              //     floatingLabelBehavior: FloatingLabelBehavior.auto,
              //   ),
              // ),
              //
              // const SizedBox(height: 20),
              TextField(
                // readOnly: true,
                controller: _passwordController,
                cursorColor: Colors.red,
                cursorWidth: 2,
                cursorHeight: 15,
                cursorRadius: const Radius.circular(35),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isObscureText,
                // textInputAction: TextInputAction.next,
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
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  // hintText: "Enter your email",
                  // hintStyle:const TextStyle(
                  //   color: Colors.grey,
                  // ),
                  labelText: "Enter Password",
                  labelStyle: const TextStyle(
                    color: Colors.red,
                  ),
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.red,
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
                            color: Colors.red,
                          ),
                  ),
                  // enabled: false
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),

              const SizedBox(height: 20),
              TextField(
                // readOnly: true,
                controller: _confirmPassController,
                cursorColor: Colors.red,
                cursorWidth: 2,
                cursorHeight: 15,
                cursorRadius: const Radius.circular(35),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isObscureText,
                // textInputAction: TextInputAction.next,
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
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  // hintText: "Enter your email",
                  // hintStyle:const TextStyle(
                  //   color: Colors.grey,
                  // ),
                  labelText: "Enter Confirm Password",
                  labelStyle: const TextStyle(
                    color: Colors.red,
                  ),
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.red,
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
                            color: Colors.red,
                          ),
                  ),
                  // enabled: false
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                  /// API call
                  }
                },
                child: const Text('Login'),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text('Show'),
              ),
              Text(_emailController.text),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _emailController.clear();
                  _confirmPassController.clear();
                  _passwordController.clear();
                  setState(() {});
                },
                child: const Text('Clear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
