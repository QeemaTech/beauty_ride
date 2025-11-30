
import 'package:beauty_ride/core/network/network_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfoImp extends NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImp({required this.connectivity});

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return result.first != ConnectivityResult.none;
  }
}
