// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `My Bookings`
  String get myBookings {
    return Intl.message('My Bookings', name: 'myBookings', desc: '', args: []);
  }

  /// `Electronic Wallet`
  String get electronicWallet {
    return Intl.message(
      'Electronic Wallet',
      name: 'electronicWallet',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Cards`
  String get insuranceCards {
    return Intl.message(
      'Insurance Cards',
      name: 'insuranceCards',
      desc: '',
      args: [],
    );
  }

  /// `Saved Addresses`
  String get savedAddresses {
    return Intl.message(
      'Saved Addresses',
      name: 'savedAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Join as a Service Provider`
  String get joinAsServiceProvider {
    return Intl.message(
      'Join as a Service Provider',
      name: 'joinAsServiceProvider',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Customer Service`
  String get customerService {
    return Intl.message(
      'Customer Service',
      name: 'customerService',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `50% Offer`
  String get fiftyPercentOffer {
    return Intl.message(
      '50% Offer',
      name: 'fiftyPercentOffer',
      desc: '',
      args: [],
    );
  }

  /// `On nearby salons`
  String get onNearbySalons {
    return Intl.message(
      'On nearby salons',
      name: 'onNearbySalons',
      desc: '',
      args: [],
    );
  }

  /// `Our Services`
  String get ourServices {
    return Intl.message(
      'Our Services',
      name: 'ourServices',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Wax`
  String get wax {
    return Intl.message('Wax', name: 'wax', desc: '', args: []);
  }

  /// `Massage`
  String get massage {
    return Intl.message('Massage', name: 'massage', desc: '', args: []);
  }

  /// `Manicure`
  String get manicure {
    return Intl.message('Manicure', name: 'manicure', desc: '', args: []);
  }

  /// `Skin Cleansing`
  String get skinCleansing {
    return Intl.message(
      'Skin Cleansing',
      name: 'skinCleansing',
      desc: '',
      args: [],
    );
  }

  /// `Dye`
  String get dye {
    return Intl.message('Dye', name: 'dye', desc: '', args: []);
  }

  /// `Spa`
  String get spa {
    return Intl.message('Spa', name: 'spa', desc: '', args: []);
  }

  /// `Makeup`
  String get makeup {
    return Intl.message('Makeup', name: 'makeup', desc: '', args: []);
  }

  /// `Haircut`
  String get haircut {
    return Intl.message('Haircut', name: 'haircut', desc: '', args: []);
  }

  /// `Most Requested Services`
  String get mostRequestedServices {
    return Intl.message(
      'Most Requested Services',
      name: 'mostRequestedServices',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
