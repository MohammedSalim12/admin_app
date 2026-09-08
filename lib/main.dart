import 'package:admen_app/bindeing/Initialbinding.dart';
import 'package:admen_app/core/localization/changelocal_controller.dart';
import 'package:admen_app/core/localization/tranzlation.dart';
import 'package:admen_app/core/services/myservices.dart';
import 'package:admen_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await inititalServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Localecontroller controller = Get.put(Localecontroller ());
    return GetMaterialApp(
      translations: MyTranzalion(),
      initialBinding: Initialbinding(),
      locale: controller.language,
      theme: controller.apptheme,
      debugShowCheckedModeBanner: false,
      getPages: routes,
    );
  }
}


