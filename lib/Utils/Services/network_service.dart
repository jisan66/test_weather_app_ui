import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectivity {
  static Future<bool> checkConnectivity() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult == ConnectivityResult.none) {
        return false;
      }

      var result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 3));

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    } on TimeoutException catch (_) {
      return false;
    } catch (e) {
      print('Error checking connectivity: $e');
      return false;
    }
  }
}
