import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taggr/app.dart';
import 'package:taggr/core/di/app_container.dart';
import 'package:taggr/features/auth/di/auth_module.dart';

void main() async{

  // para que jale la asincronia
  WidgetsFlutterBinding.ensureInitialized();

  // levanta el contenedor
  final appContainer = await AppContainer.create();
  
  final authModule = AuthModule(appContainer);


  
runApp(
    DevicePreview(
      enabled: kIsWeb,
      //se hace la ibteyccion
      builder: (context) => MultiProvider( 
        providers: [
          ChangeNotifierProvider(
            create: (_) => authModule.provideAuthProvider(),
          ),
        ],
        child: const MyApp(), 
      ),
    ),
  );
}
 