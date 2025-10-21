import 'package:desafio_rickandmorty/core/services/dependency_injection_service.dart';
import 'package:desafio_rickandmorty/ui/core/themes/theme.dart';
import 'package:desafio_rickandmorty/ui/list_characters/widgets/list_characters_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  await injectDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      theme: ThemeData(
        fontFamily: CustomTheme.fontFamily,
        useMaterial3: true,
        textTheme: CustomTheme.text(context),
        progressIndicatorTheme: CustomTheme.progressIndicatorTheme(context),
        appBarTheme: CustomTheme.appBarTheme(context),
        scaffoldBackgroundColor: Color(0xFFF4F4F5),
        bottomSheetTheme: CustomTheme.bottomSheetTheme(context),
      ),
      home: ListCharactersScreen(),
    );
  }
}
