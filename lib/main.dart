import 'package:flutter/material.dart';
import 'package:random_cats/network/injector.dart';
import 'package:random_cats/presentation/ui/cat_facts.dart';
import 'package:random_cats/data/models/cat_model.dart';
import 'package:random_cats/init_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CatModelAdapter());
  await Hive.openBox('facts');
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const InitWidget(
      child: MaterialApp(
        home: CatFacts(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
