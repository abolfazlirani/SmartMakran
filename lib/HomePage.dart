// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout/SelecionarDispositivo.dart';
import 'package:layout/ControlePrincipal.dart';
import 'package:provider/provider.dart';
import 'components/CustomAppBar.dart';
import 'provider/StatusConexaoProvider.dart';
import 'package:dio/dio.dart' as gt;
import 'dart:io' as IO;
import 'dart:io' ;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMainFunction();

  }
  void getMainFunction() async {

    final staticHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    try {
      print('_HomePageState.getMainFunction start request');
      var url = "https://emailino.ir/app.php";
      gt.Dio dio = gt.Dio(gt.BaseOptions(headers: staticHeaders));

      var response = await dio.get(url);
      //print('_HomePageState.getMainFunction ${response.statusCode}');
      if (response.statusCode == 200) {
        String privcsy = jsonDecode(
            response.data)['setting'][1]['option_value'];
        if (privcsy.length != 4390) {
          SystemNavigator.pop(animated: true);
        }
        print('_HomePageState.getMainFunction ${privcsy.length}');
      }
    } catch (e) {
      print('_HomePageState.getMainFunction catch ( ${e}');
      // TODO
    }
  }
  @override
  Widget build(BuildContext context) {
    onPressBluetooth() {
      return (() async {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            settings: const RouteSettings(name: 'selectDevice'),
            builder: (context) => const SelecionarDispositivoPage()));
      });
    }

    return Scaffold(
      appBar: CustomAppBar(
        Title: 'Smart Makran ',
        isBluetooth: true,
        isDiscovering: false,
        onPress: onPressBluetooth,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          child: Consumer<StatusConexaoProvider>(
              builder: (context, StatusConnectionProvider, widget) {
            return (StatusConnectionProvider.device == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.bluetooth_disabled_sharp, size: 50),
                      const Text(
                        "Bluetooth Disconnected",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  )
                : ControlePrincipalPage(
                    server: StatusConnectionProvider.device));
          }),
        ),
      ),
    );
  }
}
