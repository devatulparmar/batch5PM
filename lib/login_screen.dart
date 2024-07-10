import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  bool isObscureText = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              // readOnly: true,
              controller: _emailController,
              cursorColor: Colors.red,
              cursorWidth: 2,
              cursorHeight: 15,
              cursorRadius: const Radius.circular(35),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              onChanged: (String? value){
                print(value);
              },
              onTapOutside: (PointerDownEvent p){
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onTap: (){
                print("on tap called ");
              },
              // maxLength: 5,
              // maxLines: 5,
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
                labelText: "Enter Email",
                labelStyle: const TextStyle(
                  color: Colors.red,
                ),
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.red,
                ),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.red,
                ),
                // enabled: false
                floatingLabelAlignment: FloatingLabelAlignment.start,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              // readOnly: true,
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
                  onPressed: (){
                    isObscureText = !isObscureText;
                    setState(() {});
                  },
                  icon: Icon(
                    isObscureText ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
                    color: isObscureText ? Colors.grey : Colors.red,
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
                setState(() {

                });
              },
              child: const Text('Show'),
            ),
            Text(_emailController.text),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _emailController.clear();
                setState(() {
                });
              },
              child: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}
