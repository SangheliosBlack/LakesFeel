import 'package:cashless/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashLayout extends StatelessWidget {
  const SplashLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FutureBuilder(
            future: checkLoginState(context),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return Container(
                  width: width,
                  height: height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/fondo.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                          child: Container(
                        padding: const EdgeInsets.all(60),
                        child:
                            const Image(image: AssetImage('assets/images/copia.png')),
                      )),
                      Positioned.fill(
                        child: Center(
                          child: SizedBox(
                            width: width - 80,
                            height: width - 80,
                            child: const CircularProgressIndicator(
                              strokeWidth: 10,
                              backgroundColor: Color.fromRGBO(108, 2, 93, 1),
                              color: Colors.white,
                            ),
                          ),
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
