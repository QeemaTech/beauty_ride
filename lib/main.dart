import 'package:beauty_ride/app/my_app.dart';
import 'package:beauty_ride/app_injections.dart' as di;
import 'package:beauty_ride/core/classes/my_logger.dart';
import 'package:beauty_ride/core/storage/pref_services.dart';
import 'package:beauty_ride/core/storage/secure_storage_service.dart';
import 'package:beauty_ride/shared/cubits/bloc_observer.dart';
import 'package:beauty_ride/shared/cubits/theme/theme_app_cubit.dart';
import 'package:error_stack/error_stack.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  if (message.notification != null) {
    print("======================= onBackGround================");
    print("${message.notification!.title}");
    print("${message.notification!.body}");
    print("${message.data}");
    print("======================= onBackGround================");
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ErrorStack.init(); //* find bugs in development mode
  await SecureStorageService.instance.init(); //* important data (token)
  await PrefServices.instance.init(); //* any simple data not important
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.initFlutter(); //* save heavy data
  Hive.init(appDocumentDir.path);
  await di.appInjections(); //* initialize dependencies in my app
  Bloc.observer = MyBlocObserver(); //* observer changes in  my cubits
  MyLogger.instance.initLogger(); //* to display or hide data in console
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final cubit = ThemeAppCubit();
  await cubit.loadTheme();
  runApp(MyApp(themeAppCubit: cubit));
}
