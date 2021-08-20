import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:userdata/compulsory-task/print_name_function.dart';
import 'package:userdata/config/size-config.dart';
import 'package:userdata/screens/my_data.dart';
import 'package:userdata/screens/my_data_form.dart';

void main() {
  runApp(const MyApp());
  CompulsoryTask.printName();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          title: 'MyData',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyDataForm(),
          routes: {
            MyData.routeName: (context) => const MyData(),
          },
        );
      });
    });
  }
}
