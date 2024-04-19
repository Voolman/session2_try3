import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void showError(BuildContext context, String e){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e)));
}

bool isCorrectEmail(String email){
  return RegExp(r'[a-z0-9]+@[a-z0-9]+\.\w+').hasMatch(email);
}

Future<bool> checkNetworkConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}
