import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schaffen_task/Components/button.dart';
import 'package:schaffen_task/Constants/size_config.dart';
import 'package:schaffen_task/Services/auth_services.dart';
import 'package:schaffen_task/UI_Screens/Catalogue-Screen/catalogue.dart';
import 'package:schaffen_task/UI_Screens/Deliver-Address/address.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);
  static String routeName = "/log_in";

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'FOODLY',
              style: TextStyle(
                  fontSize: 55,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.08,
              width: SizeConfig.screenWidth! * 0.6,
              child: !Provider.of<Auth>(context, listen: false).isLoading
        ? SignInButton(
                Buttons.GoogleDark,
                onPressed: ()async {

  try {
                UserCredential googleUserCred =
                    await Provider.of<Auth>(context, listen: false)
                        .signInWithGoogle();
                Provider.of<Auth>(context, listen: false)
                    .setUser(googleUserCred.user);
                Provider.of<Auth>(context, listen: false).addUser();
                if (Provider.of<Auth>(context, listen: false).getUser() !=
                    null) {
                  Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.pushNamed(
                    context,
                    CatalogueScreen.routeName,
                  );
                  final snackBar = SnackBar(content: Text('Logged In!'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                setState(() {
                  Provider.of<Auth>(context, listen: false).isLoading = false;
                });
              } catch (e) {
                setState(() {
                  Provider.of<Auth>(context, listen: false).isLoading = false;
                });
                ;
              }
                  
                },
              ): CircularProgressIndicator(
            color: Colors.redAccent,
          ),
            )
          ],
        ),
      ),
    );
  }
}
