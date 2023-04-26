import 'package:cashless/routes/usuario_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {

  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  static void configureRoutes() {

    router.define(rootRoute,
        handler: UsuarioHanlder.login,
        transitionDuration: const Duration(milliseconds: 400),
        transitionType: TransitionType.native);

  }
}
 