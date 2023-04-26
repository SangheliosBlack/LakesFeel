
import 'package:cashless/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashLayout extends StatelessWidget {
  const SplashLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FutureBuilder(
            future: checkLoginState(context),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return Container(
                  width: width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/fondo.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      const Expanded(
                          child: Image(
                              image: AssetImage('assets/images/logo.png'))),
                      Container(
                        margin: const EdgeInsets.only(bottom: 35),
                        child: const CircularProgressIndicator(
                          backgroundColor: Color.fromRGBO(108, 2, 93, 1),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ));
            }),
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final isAutenticado = await authService.isLoggedIn();

    if (isAutenticado) {}
  }
}
