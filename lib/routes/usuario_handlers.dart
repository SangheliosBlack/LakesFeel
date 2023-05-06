import 'package:cashless/services/auth_service.dart';
import 'package:cashless/views/auth/login_celular.dart';
import 'package:cashless/views/usuario/dashboard_usuario.dart';
import 'package:cashless/views/recargas/dashboard_recargas.dart';
import 'package:cashless/views/venta/dashboard_venta.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class UsuarioHanlder {
  static Handler login = Handler(handlerFunc: ((context, parameters) {
    final authService = Provider.of<AuthService>(context!);

    if (authService.authStatus == AuthStatus.notAuthenticated) {
      return const AutentificarCelular();
    } else {
      return const DashboardUsuarioView();
    }
  }));

  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthService>(context!);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const DashboardUsuarioView();
    } else {
      const AutentificarCelular();
    }
    return null;
  });
}
