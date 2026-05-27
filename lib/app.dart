import 'package:flutter/material.dart';
import 'package:taggr/core/components/main_layout.dart';
import 'package:taggr/features/auth/presentation/screens/login_screen.dart';
import 'package:taggr/features/auth/presentation/screens/register_screen.dart';
import 'package:taggr/features/posts/presentation/screens/create_post_screen.dart';
import 'package:taggr/shared/theme/theme.dart';
import 'package:taggr/shared/theme/util.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Poppins", "Bebas Neue");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'TAGGR',
      theme: theme.light(),
      darkTheme: theme.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: ThemeMode.dark,

      initialRoute: '/login',

    routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const MainLayout(), 
      },
      
    );
  }
}
