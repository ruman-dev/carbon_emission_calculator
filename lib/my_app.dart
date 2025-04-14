import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: Color(0xFFFFFFFF), useMaterial3: true),
          getPages: Routes.route,

          transitionDuration: const Duration(milliseconds: 200),
          navigatorKey: Get.key,
          initialRoute: Routes.splashScreen,
        );
      },
    );
  }
}
