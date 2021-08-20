import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userdata/config/size-config.dart';
import 'package:userdata/constants/app_fonts.dart';
import 'package:userdata/constants/widgets/custom_button.dart';

class MyData extends StatelessWidget {
  static const routeName = 'my-data';
  const MyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dynamic userData = ModalRoute.of(context)!.settings.arguments;
    print(userData);
    return Scaffold(
      floatingActionButton: CustomButton(
          text: 'Back to Form',
          onpressed: () => Navigator.of(context).pop(),
          width: size.width * 0.9),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Data'),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.only(
          top: SizeConfig.heightMultiplier! * 10,
          left: SizeConfig.widthMultiplier! * 5,
          right: SizeConfig.widthMultiplier! * 5,
        ),
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DataColumn(
                    title: 'First Name',
                    value: userData['firstName'].toUpperCase()),
                DataColumn(
                    title: 'Last Name',
                    value: userData['lastName'].toUpperCase()),
                DataColumn(title: 'Email Address', value: userData['email']),
                DataColumn(
                    title: 'Phone Number', value: userData['phoneNumber']),
              ],
            )),
      ),
    );
  }
}

class DataColumn extends StatelessWidget {
  const DataColumn({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppFonts.body1),
        Text(value, style: AppFonts.valueStyle),
        SizedBox(
          height: SizeConfig.heightMultiplier! * 4,
        ),
      ],
    );
  }
}
