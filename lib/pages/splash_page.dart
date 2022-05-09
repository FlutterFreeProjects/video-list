import 'dart:convert';

import 'package:flickd_app/models/app_config.dart';
import 'package:flickd_app/sevices/http_sevices.dart';
import 'package:flickd_app/sevices/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;
  const SplashPage({Key? key, required this.onInitializationComplete})
      : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setup(context).then((_) => widget.onInitializationComplete());
    // Future.delayed(Duration(seconds: 1))
    //     .then((_) => widget.onInitializationComplete());
  }

  Future<void> _setup(BuildContext _context) async {
    final getIt = GetIt.instance;
    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);

    getIt.registerSingleton<AppConfig>(AppConfig(configData['BASE_API_URL'],
        configData['BASE_IMAGE_API_URL'], configData['API_KEY']));
    getIt.registerSingleton<HTTPServices>(
      HTTPServices(),
    );

    getIt.registerSingleton<MovieService>(
      MovieService(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flickd',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.contain)),
        ),
      ),
    );
  }
}
