import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'model/core_state.dart';
import 'page/color_page.dart';
import 'page/counter_page.dart';
import 'widget/button_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(ChangeNotifierProvider(
    create: (context) => CoreState(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title = 'ChangeNotifier';

  @override
  Widget build(BuildContext context) {
    return Selector<CoreState, Color>(
      child: const MainPage(),
      selector: (_, state) => state.backgroundColor,
      builder: (_, color, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          scaffoldBackgroundColor: color,
          primaryColor: Colors.white,
        ),
        home: child,
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Selector<CoreState, int>(
              selector: (_, state) => state.counter,
              builder: (_, counter, __) => Text(
                '$counter',
                style: const TextStyle(fontSize: 100),
              ),
            ),
            const SizedBox(height: 47),
            ButtonWidget(
              text: 'Change Color',
              onClicked: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ColorPage(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Change Counter',
              onClicked: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const CounterPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
