import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userdata/config/size-config.dart';
import 'package:userdata/constants/widgets/custom_button.dart';
import 'package:userdata/screens/my_data.dart';

import '../constants/widgets/custom_input.dart';

class MyDataForm extends StatefulWidget {
  const MyDataForm({Key? key}) : super(key: key);

  @override
  _MyDataFormState createState() => _MyDataFormState();
}

class _MyDataFormState extends State<MyDataForm> {
  final _userDataFormKey = GlobalKey<FormState>();

  Map<String, dynamic> userData = {
    'firstName': '',
    'lastName': '',
    'email': '',
    'phoneNumber': '',
  };

  String? _emailValidator(value) {
    if (value.isEmpty) {
      return 'Please enter email';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Invalid Email';
    }
    return null;
  }

  String? _phoneValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your phone number';
    }
    return null;
  }

  String? _nameValidator(value) {
    if (value.isEmpty) {
      return 'Please enter name';
    }
    return null;
  }

  void _submit() {
    if (!_userDataFormKey.currentState!.validate()) {
      // Invalid
      return;
    }
    _userDataFormKey.currentState!.save();
    Navigator.of(context).pushNamed(MyData.routeName, arguments: userData);
    _userDataFormKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: CustomButton(
          text: 'Save', onpressed: _submit, width: size.width * 0.9),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Data Form'),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.only(top: SizeConfig.heightMultiplier! * 10),
        child: SizedBox(
          height: size.height * 0.8,
          child: Form(
            key: _userDataFormKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier! * 4),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier! * 3,
                    ),
                    CustomInput(
                      hint: 'Celine',
                      label: 'First Name',
                      onSaved: (value) {
                        userData['firstName'] = value!;
                      },
                      validator: _nameValidator,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier! * 3,
                    ),
                    CustomInput(
                      hint: 'Dion',
                      label: 'Last Name',
                      onSaved: (value) {
                        userData['lastName'] = value!;
                      },
                      validator: _nameValidator,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier! * 3,
                    ),
                    CustomInput(
                      hint: 'celine@gmail.com',
                      label: 'Email',
                      validator: _emailValidator,
                      onSaved: (value) {
                        userData['email'] = value!;
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.textMultiplier! * 3,
                    ),
                    CustomInput(
                      label: 'Phone Number',
                      type: 'number',
                      onSaved: (value) {
                        userData['phoneNumber'] = value!;
                      },
                      validator: _phoneValidator,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier! * 10,
                    ),
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
