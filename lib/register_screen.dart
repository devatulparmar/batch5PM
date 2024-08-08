import 'dart:io';

import 'package:batch5pm/utils/const.dart';
import 'package:batch5pm/utils/my_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' hide TextDirection;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  final TextEditingController _ddmController = TextEditingController();
  late GlobalKey<FormState> _formKey;
  DateTime date = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  String _groupValue = '';
  String _groupValue2 = '';
  int _groupValue3 = 0;
  bool isSelected = false;
  bool isSelected2 = false;
  bool isCheckBoxChecked = false;
  bool isPaintingCheckBoxChecked = false;
  bool isEnglishCheckBoxChecked = false;
  bool isGujaratiCheckBoxChecked = false;
  String? cityDDLValue;
  String? stateDDLValue;
  String? dropDownValue3;
  List<String> hobbiesList = [];
  final ImagePicker picker = ImagePicker();
  XFile? selectedImage;
  List<XFile>? multiSelectedImages;

  final List<String> _list = [
    'Vadodara',
    'Ahmedabad',
    'Surat',
    'Anand',
    'Junagadh',
    'Rajkot',
    'Amreli',
  ];

  Future selectDate() async {
    try {
      DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day + 15,
        ),
        initialDatePickerMode: DatePickerMode.day,
        anchorPoint: const Offset(200, 100),
        helpText: 'Help Text',
        confirmText: 'Confirm',
        cancelText: 'Cancel Text',
        currentDate: DateTime(2024, 07, 31),
        errorFormatText: 'errorFormatText',
        fieldHintText: 'fieldHintText',
        fieldLabelText: 'fieldLabelText',
        initialEntryMode: DatePickerEntryMode.calendar,
        keyboardType: TextInputType.datetime,
        errorInvalidText: 'errorInvalidText',
        textDirection: TextDirection.ltr,
        selectableDayPredicate: (DateTime? d) {
          return true;
        },
        useRootNavigator: true,
        routeSettings: const RouteSettings(name: routeLoginScreen),
        builder: (BuildContext context, Widget? widget) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.red,
            ),
            child: widget!,
          );
        },
      );
      date = selectedDate!;
      setState(() {});
    } catch (error) {
      MySnackBar.showMySnackBar(
        context: context,
        content: error.toString(),
        backgroundColor: Colors.red,
      );
    } finally {
      /// DB close
    }
  }

  Future selectTime() async {
    try {
      TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        anchorPoint: const Offset(0, 0),
        cancelText: 'Close',
        confirmText: 'Select',
        helpText: 'help text',
        errorInvalidText: 'error invalid text',
        hourLabelText: 'Select Hours',
        minuteLabelText: 'Select Minutes',
        initialEntryMode: TimePickerEntryMode.dial,
        useRootNavigator: true,
        onEntryModeChanged: (value) {},
        builder: (BuildContext context, Widget? widget) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.red,
            ),
            child: widget!,
          );
        },
      );
      timeOfDay = selectedTime ?? TimeOfDay.now();
      setState(() {});
    } catch (error) {
      MySnackBar.showMySnackBar(
        context: context,
        content: error.toString(),
        backgroundColor: Colors.red,
      );
    } finally {
      /// DB close
    }
  }

  Future _selectImageFromCamera() async {
    selectedImage = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
      preferredCameraDevice: CameraDevice.rear,
    );
    setState(() {});
  }

  Future _selectImageFromGallery() async {
    selectedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    setState(() {});
  }

  Future _selectMultipleImageFromGallery() async {
    multiSelectedImages = await picker.pickMultiImage(imageQuality: 100);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    // _ddmController = TextEditingController();
    _formKey = GlobalKey();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _ddmController.dispose();
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
            const SizedBox(height: 10),
            selectedImage != null
                ? CircleAvatar(
                    radius: 100,
                    backgroundImage: FileImage(File(selectedImage!.path)),
                  )
                : const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(localImage),
                  ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _selectImageFromCamera();
              },
              child: const Text('Select Image From Camera'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _selectMultipleImageFromGallery();
              },
              child: const Text('Select Multiple Image From Gallery'),
            ),
            const SizedBox(height: 10),
            multiSelectedImages == null
                ? Container()
                : ListView.builder(
                    itemCount: multiSelectedImages!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return CircleAvatar(
                        radius: 100,
                        backgroundImage: FileImage(
                          File(multiSelectedImages![index].path),
                        ),
                      );
                    },
                  ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _selectImageFromGallery();
              },
              child: const Text('Select Image From Gallery'),
            ),
            const SizedBox(height: 10),
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
                    if (isCheckBoxChecked) {
                      hobbiesList.add('Reading');
                    } else {
                      hobbiesList.remove('Reading');
                    }
                  },
                ),
                const Text('Reading'),
                Checkbox(
                  value: isPaintingCheckBoxChecked,
                  onChanged: (bool? chk) {
                    setState(() {
                      isPaintingCheckBoxChecked = chk!;
                    });
                    if (isPaintingCheckBoxChecked) {
                      hobbiesList.add('Painting');
                    } else {
                      hobbiesList.remove('Painting');
                    }
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
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton(
                hint: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Select State'),
                ),
                value: stateDDLValue,
                items: const [
                  DropdownMenuItem(
                    value: 'Gujarat',
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Gujarat'),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'MP',
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('MP'),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Himachal',
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Himachal'),
                    ),
                  ),
                ],
                isExpanded: true,
                underline: Container(),
                elevation: 2,
                // icon: const Icon(
                //   Icons.arrow_downward,
                //   size: 20,
                // ),
                borderRadius: BorderRadius.circular(5),
                onChanged: (dynamic d) {
                  stateDDLValue = d;
                  cityDDLValue = null;
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton(
                hint: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Select City'),
                ),
                value: cityDDLValue,
                // selectedItemBuilder: (BuildContext context) {
                //   return _list2
                //       .map(
                //         (String item) => Padding(
                //           padding: const EdgeInsets.all(15),
                //           child: Text(item),
                //         ),
                //       )
                //       .toList();
                // },
                items: _list
                    .map((String element) => DropdownMenuItem(
                          value: element,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(element),
                          ),
                        ))
                    .toList(),
                isExpanded: true,
                underline: Container(),
                elevation: 2,
                // icon: const Icon(
                //   Icons.arrow_downward,
                //   size: 20,
                // ),
                borderRadius: BorderRadius.circular(5),
                onChanged: (dynamic d) {
                  cityDDLValue = d;
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 20),
            // DropdownMenu(
            //   controller: _ddmController,
            //   hintText: 'Select City',
            //   width: MediaQuery.of(context).size.width - 20,
            //   menuStyle: MenuStyle(
            //     shape: MaterialStateProperty.all(
            //       RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //     ),
            //   ),
            //   dropdownMenuEntries: _list
            //       .map((String element) => DropdownMenuEntry(
            //             value: element,
            //             label: element,
            //           ))
            //       .toList(),
            //   onSelected: (dynamic value) {
            //     setState(() {
            //       dropDownValue3 = value;
            //     });
            //   },
            // ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                    'Date of Birth is : ${DateFormat("dd-MM-yyyy").format(date)}'),
                IconButton(
                  onPressed: () {
                    selectDate();
                  },
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text('Date of Birth is : ${timeOfDay.format(context)}'),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      useSafeArea: true,
                      barrierColor: Colors.amber,
                      // barrierDismissible: false,
                      barrierLabel: 'barrierLabel',
                      builder: (_) {
                        ///SimpleDialog
                        // return SimpleDialog(
                        //   title: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       const Text('Title text'),
                        //       IconButton(
                        //         onPressed: () {
                        //           Navigator.pop(context);
                        //         },
                        //         icon: const Icon(
                        //           Icons.close,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        //   children: [
                        //     const Text('This is SimpleDialog'),
                        //     const Text('Hello'),
                        //   ],
                        // );

                        /// AboutDialog
                        // return const AboutDialog(
                        //   applicationIcon: Icon(
                        //     Icons.settings,
                        //   ),
                        //   applicationName: 'Batch 5 PM',
                        //   applicationVersion: '1.0.0',
                        //   applicationLegalese: 'applicationLegalese',
                        //   children: [
                        //     Text('This is about dialog'),
                        //   ],
                        // );

                        /// AlertDialog
                        return AlertDialog(
                          title: const Text('Are you sure want to logout?'),
                          content: const Text('''
                          You need to enable Developer Mode and set a flag on your device, so you can't yet expect predictive back to work on most users' Android devices. If you want to try it out on your own device though, make sure it's running API 33 or higher, and then in Settings => System => Developer options, make sure the switch is enabled next to Predictive back animations.
                          '''),
                          // buttonPadding: const EdgeInsets.symmetric(horizontal: 35),
                          // actionsPadding: const EdgeInsets.symmetric(horizontal: 35),
                          // actionsOverflowButtonSpacing: 60,
                          actionsAlignment: MainAxisAlignment.spaceBetween,
                          // icon: IconButton(
                          //   onPressed: () {
                          //     Navigator.pop(context);
                          //   },
                          //   icon: const Icon(Icons.close),
                          //   visualDensity: VisualDensity.comfortable,
                          // ),
                          scrollable: true,
                          semanticLabel: 'Semantic Label',
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        );

                        ///Dialog
                        // return Dialog(
                        //   insetPadding: EdgeInsets.zero,
                        //   insetAnimationCurve: Curves.linear,
                        //   surfaceTintColor: Colors.pink,
                        //   backgroundColor: Colors.yellow,
                        //   clipBehavior: Clip.antiAliasWithSaveLayer,
                        //   insetAnimationDuration: const Duration(seconds: 20),
                        //   child: SizedBox(
                        //     height: 150,
                        //     width: 200,
                        //     child: CupertinoTimerPicker(
                        //       mode: CupertinoTimerPickerMode.hm,
                        //       initialTimerDuration: Duration.zero,
                        //       // backgroundColor: Colors.orange,
                        //       // This is called when the user changes the timer's
                        //       // duration.
                        //       onTimerDurationChanged: (Duration newDuration) {
                        //         // print('${newDuration.inHours}:${newDuration.inMinutes}');
                        //         var s = newDuration.toString().split(':');
                        //         var time = TimeOfDay(
                        //             hour: int.parse(s[0]),
                        //             minute: int.parse(s[1]));
                        //         // setState(() => duration = newDuration);
                        //       },
                        //     ),
                        //   ),
                        // );
                      },
                    );
                    // selectTime();
                  },
                  icon: const Icon(
                    Icons.watch_later,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text('YEAR_ABBR_MONTH : ${DateFormat.yMMM().format(date)}'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                    'YEAR_ABBR_MONTH : ${DateFormat.yMMMMd('en_US').format(date)}'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  routeRegisterDetailsScreen,
                  arguments: {
                    'name': _nameController.text,
                    'email': _emailController.text,
                    'gender': _groupValue,
                    'status': _groupValue2,
                    'hobbies': hobbiesList,
                    'state': stateDDLValue,
                    'city': cityDDLValue,
                    'dob': DateFormat.yMd().format(date).toString(),
                  },
                );
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cityDDLValue = null;
                stateDDLValue = null;
                _ddmController.clear();
                setState(() {});
              },
              child: const Text('Reset'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
