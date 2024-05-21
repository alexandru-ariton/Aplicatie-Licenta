// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gastrogrid_app/aplicatie_client/Folder_LogIn/authentificare/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:gastrogrid_app/aplicatie_client/Folder_Home/componente_home/pagina_cart.dart';
import 'package:gastrogrid_app/aplicatie_client/Folder_LogIn/authentificare/login_sau_inregistrare.dart';
import 'package:gastrogrid_app/aplicatie_client/clase/info_livrare.dart';
import 'package:gastrogrid_app/themes/theme_provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
  
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
        ChangeNotifierProvider(create: (_) => DeliveryInfo()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginSauInregistrare(),
            theme: themeProvider.themeData,
          );
        },
      ),
    );
  }
}
