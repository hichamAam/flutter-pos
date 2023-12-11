import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/pages/products/home.dart';
import 'package:stockapp/pages/auth/login.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:stockapp/utils/constants.dart';
import 'package:stockapp/utils/NotificationService.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AuthState extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }
}

late List messages = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthState(),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthState>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: authState.isAuthenticated ? HomePage() : LoginPage(),
        // body: HomePage(),
      ),
    );
  }
}
