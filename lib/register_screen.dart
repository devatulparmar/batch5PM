import 'package:batch5pm/utils/my_snackbar.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late GlobalKey<FormState> _formKey;
  String _groupValue = '';
  String _groupValue2 = '';
  int _groupValue3 = 0;
  bool isSelected = false;
  bool isSelected2 = false;
  bool isCheckBoxChecked = false;
  bool isPaintingCheckBoxChecked = false;
  bool isEnglishCheckBoxChecked = false;
  bool isGujaratiCheckBoxChecked = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _formKey = GlobalKey();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Screen'),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            TextFormField(
              controller: _nameController,
              cursorColor: Colors.blue,
              cursorWidth: 2,
              cursorHeight: 15,
              cursorRadius: const Radius.circular(35),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              // validator: (String? value) => MySnackBar.emailValidator(value),
              onChanged: (String? value) {},
              onTapOutside: (PointerDownEvent p) {
                FocusManager.instance.primaryFocus?.unfocus();
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
                labelText: "Enter Name",
                labelStyle: const TextStyle(
                  color: Colors.blue,
                ),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                floatingLabelAlignment: FloatingLabelAlignment.start,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
            const SizedBox(height: 20),
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
            Row(
              children: [
                Radio(
                  value: 'Male',
                  groupValue: _groupValue,
                  activeColor: Colors.red,
                  onChanged: (String? obj) {
                    _groupValue = obj!;
                    setState(() {});
                  },
                ),
                const Text('Male'),
                Radio(
                  value: 'Female',
                  groupValue: _groupValue,
                  activeColor: Colors.red,
                  onChanged: (String? obj) {
                    _groupValue = obj!;
                    setState(() {});
                  },
                ),
                const Text('Female'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Radio(
                  value: 'Single',
                  groupValue: _groupValue2,
                  activeColor: Colors.red,
                  onChanged: (String? obj) {
                    _groupValue2 = obj!;
                    setState(() {});
                  },
                ),
                const Text('Single'),
                Radio(
                  value: 'Married',
                  groupValue: _groupValue2,
                  activeColor: Colors.red,
                  onChanged: (String? obj) {
                    _groupValue2 = obj!;
                    setState(() {});
                  },
                ),
                const Text('Married'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    value: 1,
                    groupValue: _groupValue3,
                    activeColor: Colors.white,
                    title: const Text('Indian'),
                    subtitle: const Text('This is subtitle.'),
                    selectedTileColor: Colors.blue,
                    selected: isSelected,
                    // tileColor: Colors.teal.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    onChanged: (int? obj) {
                      _groupValue3 = obj!;
                      isSelected = true;
                      isSelected2 = false;
                      setState(() {});
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    value: 2,
                    groupValue: _groupValue3,
                    activeColor: Colors.white,
                    selected: isSelected2,
                    selectedTileColor: Colors.blue,
                    title: const Text('NRI'),
                    subtitle: const Text('This is subtitle.'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    onChanged: (int? obj) {
                      _groupValue3 = obj!;
                      isSelected = false;
                      isSelected2 = true;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: isCheckBoxChecked,
                  onChanged: (bool? chk) {
                    setState(() {
                      isCheckBoxChecked = chk!;
                    });
                  },
                ),
                const Text('Reading'),
                Checkbox(
                  value: isPaintingCheckBoxChecked,
                  onChanged: (bool? chk) {
                    setState(() {
                      isPaintingCheckBoxChecked = chk!;
                    });
                  },
                ),
                const Text('Painting'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: CheckboxListTile(
                    value: isEnglishCheckBoxChecked,
                    // checkboxShape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(35),
                    // ),

                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('English'),
                    onChanged: (bool? chk) {
                      setState(() {
                        isEnglishCheckBoxChecked = chk!;
                      });
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CheckboxListTile(
                    value: isGujaratiCheckBoxChecked,
                    // checkboxShape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(35),
                    // ),

                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Gujarati'),
                    onChanged: (bool? chk) {
                      setState(() {
                        isGujaratiCheckBoxChecked = chk!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
