import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schaffen_task/Provider/provider.dart';
import 'package:schaffen_task/Routes/routes.dart';
import 'package:schaffen_task/Services/auth_services.dart';
import 'package:schaffen_task/Themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:schaffen_task/UI_Screens/Catalogue-Screen/catalogue.dart';
import 'UI_Screens/log_in.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>Auth()),
       ChangeNotifierProvider.value(
        value:CounterModel(),
       
      )],
       child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Schaffen',
          theme: theme(),
          initialRoute:(FirebaseAuth.instance.currentUser == null)
            ?  LogIn.routeName:CatalogueScreen.routeName,
          routes: routes,
        ),
    );
  }
}
