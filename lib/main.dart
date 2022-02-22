import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayer_requests/Screens/splash_screen.dart';
import 'package:prayer_requests/constants/dark_theme.dart';
import 'package:prayer_requests/constants/light_theme.dart';
import 'package:prayer_requests/logic/controller.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  //Firebase settings
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(GetMaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      theme: lightTheme,
      home: const SplashScreen()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  child: const Text("Go to Other"),
                  onPressed: () => Get.to(() => Other())),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.put(Controller());

  Other({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}
