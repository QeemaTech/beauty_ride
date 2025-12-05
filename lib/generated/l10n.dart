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

  /// `Pedicure`
  String get pedicure {
    return Intl.message('Pedicure', name: 'pedicure', desc: '', args: []);
  }

  /// `Nail Care`
  String get nailCare {
    return Intl.message('Nail Care', name: 'nailCare', desc: '', args: []);
  }

  /// `Hairstyles`
  String get hairstyles {
    return Intl.message('Hairstyles', name: 'hairstyles', desc: '', args: []);
  }

  /// `Skin Treatment`
  String get skinTreatment {
    return Intl.message(
      'Skin Treatment',
      name: 'skinTreatment',
      desc: '',
      args: [],
    );
  }

  /// `Hair Treatment`
  String get hairTreatment {
    return Intl.message(
      'Hair Treatment',
      name: 'hairTreatment',
      desc: '',
      args: [],
    );
  }

  /// `Color Coordination`
  String get colorCoordination {
    return Intl.message(
      'Color Coordination',
      name: 'colorCoordination',
      desc: '',
      args: [],
    );
  }

  /// `Moroccan Bath`
  String get moroccanBath {
    return Intl.message(
      'Moroccan Bath',
      name: 'moroccanBath',
      desc: '',
      args: [],
    );
  }

  /// `Hair Length`
  String get hairLength {
    return Intl.message('Hair Length', name: 'hairLength', desc: '', args: []);
  }

  /// `Dye Type`
  String get dyeType {
    return Intl.message('Dye Type', name: 'dyeType', desc: '', args: []);
  }

  /// `Dye Color`
  String get dyeColor {
    return Intl.message('Dye Color', name: 'dyeColor', desc: '', args: []);
  }

  /// `Additional Notes`
  String get additionalNotes {
    return Intl.message(
      'Additional Notes',
      name: 'additionalNotes',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Less than 50 cm`
  String get lessThan50cm {
    return Intl.message(
      'Less than 50 cm',
      name: 'lessThan50cm',
      desc: '',
      args: [],
    );
  }

  /// `American imported / local`
  String get americanImportedLocal {
    return Intl.message(
      'American imported / local',
      name: 'americanImportedLocal',
      desc: '',
      args: [],
    );
  }

  /// `Burgundy red`
  String get burgundyRed {
    return Intl.message(
      'Burgundy red',
      name: 'burgundyRed',
      desc: '',
      args: [],
    );
  }

  /// `I am allergic to hydrogen peroxide`
  String get allergicToHydrogenPeroxide {
    return Intl.message(
      'I am allergic to hydrogen peroxide',
      name: 'allergicToHydrogenPeroxide',
      desc: '',
      args: [],
    );
  }

  /// `Service Details`
  String get serviceDetails {
    return Intl.message(
      'Service Details',
      name: 'serviceDetails',
      desc: '',
      args: [],
    );
  }

  /// `50-70 cm`
  String get hairLength50to70 {
    return Intl.message(
      '50-70 cm',
      name: 'hairLength50to70',
      desc: '',
      args: [],
    );
  }

  /// `70-90 cm`
  String get hairLength70to90 {
    return Intl.message(
      '70-90 cm',
      name: 'hairLength70to90',
      desc: '',
      args: [],
    );
  }

  /// `More than 90 cm`
  String get hairLengthMoreThan90 {
    return Intl.message(
      'More than 90 cm',
      name: 'hairLengthMoreThan90',
      desc: '',
      args: [],
    );
  }

  /// `European`
  String get european {
    return Intl.message('European', name: 'european', desc: '', args: []);
  }

  /// `Asian`
  String get asian {
    return Intl.message('Asian', name: 'asian', desc: '', args: []);
  }

  /// `Brown`
  String get brown {
    return Intl.message('Brown', name: 'brown', desc: '', args: []);
  }

  /// `Black`
  String get black {
    return Intl.message('Black', name: 'black', desc: '', args: []);
  }

  /// `Blonde`
  String get blonde {
    return Intl.message('Blonde', name: 'blonde', desc: '', args: []);
  }

  /// `Other colors`
  String get otherColors {
    return Intl.message(
      'Other colors',
      name: 'otherColors',
      desc: '',
      args: [],
    );
  }

  /// `Latest`
  String get latest {
    return Intl.message('Latest', name: 'latest', desc: '', args: []);
  }

  /// `Clear All`
  String get clearAll {
    return Intl.message('Clear All', name: 'clearAll', desc: '', args: []);
  }

  /// `Popular Search`
  String get popularSearch {
    return Intl.message(
      'Popular Search',
      name: 'popularSearch',
      desc: '',
      args: [],
    );
  }

  /// `Nails`
  String get nails {
    return Intl.message('Nails', name: 'nails', desc: '', args: []);
  }

  /// `Skin Care`
  String get skinCare {
    return Intl.message('Skin Care', name: 'skinCare', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Sign in to Beauty Ride`
  String get signInToBeautyRide {
    return Intl.message(
      'Sign in to Beauty Ride',
      name: 'signInToBeautyRide',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Continue with Apple`
  String get continueWithApple {
    return Intl.message(
      'Continue with Apple',
      name: 'continueWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get createNewAccount {
    return Intl.message(
      'Create New Account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create an account for Beauty Ride`
  String get createAccountForBeautyRide {
    return Intl.message(
      'Create an account for Beauty Ride',
      name: 'createAccountForBeautyRide',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `User`
  String get user {
    return Intl.message('User', name: 'user', desc: '', args: []);
  }

  /// `Service Provider`
  String get serviceProvider {
    return Intl.message(
      'Service Provider',
      name: 'serviceProvider',
      desc: '',
      args: [],
    );
  }

  /// `Sign in as`
  String get signInAs {
    return Intl.message('Sign in as', name: 'signInAs', desc: '', args: []);
  }

  /// `Guest`
  String get guest {
    return Intl.message('Guest', name: 'guest', desc: '', args: []);
  }

  /// `Beauty Ride needs access to your location`
  String get beautyRideNeedsLocationAccess {
    return Intl.message(
      'Beauty Ride needs access to your location',
      name: 'beautyRideNeedsLocationAccess',
      desc: '',
      args: [],
    );
  }

  /// `Allow Location Access`
  String get allowLocationAccess {
    return Intl.message(
      'Allow Location Access',
      name: 'allowLocationAccess',
      desc: '',
      args: [],
    );
  }

  /// `Don't Allow`
  String get dontAllow {
    return Intl.message('Don\'t Allow', name: 'dontAllow', desc: '', args: []);
  }

  /// `We sent a 6-digit code to your phone number +965••••1234`
  String get otpSentMessage {
    return Intl.message(
      'We sent a 6-digit code to your phone number +965••••1234',
      name: 'otpSentMessage',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the code?`
  String get didntReceiveCode {
    return Intl.message(
      'Didn\'t receive the code?',
      name: 'didntReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend in 30 seconds`
  String get resendIn30Seconds {
    return Intl.message(
      'Resend in 30 seconds',
      name: 'resendIn30Seconds',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Your beauty starts with your comfort`
  String get beautyStartsFromComfort {
    return Intl.message(
      'Your beauty starts with your comfort',
      name: 'beautyStartsFromComfort',
      desc: '',
      args: [],
    );
  }

  /// `All beauty services you love delivered to your doorstep...`
  String get allBeautyServicesDelivered {
    return Intl.message(
      'All beauty services you love delivered to your doorstep...',
      name: 'allBeautyServicesDelivered',
      desc: '',
      args: [],
    );
  }

  /// `You set the price`
  String get youSetThePrice {
    return Intl.message(
      'You set the price',
      name: 'youSetThePrice',
      desc: '',
      args: [],
    );
  }

  /// `Set a price that suits you, and wait for offers from nearby hairdressers`
  String get setPriceAndWaitForOffers {
    return Intl.message(
      'Set a price that suits you, and wait for offers from nearby hairdressers',
      name: 'setPriceAndWaitForOffers',
      desc: '',
      args: [],
    );
  }

  /// `Your hairdresser is on the way to you`
  String get yourHairdresserOnTheWay {
    return Intl.message(
      'Your hairdresser is on the way to you',
      name: 'yourHairdresserOnTheWay',
      desc: '',
      args: [],
    );
  }

  /// `Track your order moment by moment, and enjoy professional service at home`
  String get trackOrderMomentByMoment {
    return Intl.message(
      'Track your order moment by moment, and enjoy professional service at home',
      name: 'trackOrderMomentByMoment',
      desc: '',
      args: [],
    );
  }

  /// `Required Services`
  String get requiredServices {
    return Intl.message(
      'Required Services',
      name: 'requiredServices',
      desc: '',
      args: [],
    );
  }

  /// `Add Service`
  String get addService {
    return Intl.message('Add Service', name: 'addService', desc: '', args: []);
  }

  /// `Number of people requesting the service`
  String get numberOfServiceSeekers {
    return Intl.message(
      'Number of people requesting the service',
      name: 'numberOfServiceSeekers',
      desc: '',
      args: [],
    );
  }

  /// `Offer the price that suits you`
  String get offerPriceThatSuitsYou {
    return Intl.message(
      'Offer the price that suits you',
      name: 'offerPriceThatSuitsYou',
      desc: '',
      args: [],
    );
  }

  /// `Recommended fare`
  String get recommendedFare {
    return Intl.message(
      'Recommended fare',
      name: 'recommendedFare',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message('Cash', name: 'cash', desc: '', args: []);
  }

  /// `Card`
  String get card {
    return Intl.message('Card', name: 'card', desc: '', args: []);
  }

  /// `Select Payment Method`
  String get selectPaymentMethod {
    return Intl.message(
      'Select Payment Method',
      name: 'selectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Enter discount code`
  String get enterDiscountCode {
    return Intl.message(
      'Enter discount code',
      name: 'enterDiscountCode',
      desc: '',
      args: [],
    );
  }

  /// `Activate`
  String get activate {
    return Intl.message('Activate', name: 'activate', desc: '', args: []);
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Edit Location`
  String get editLocation {
    return Intl.message(
      'Edit Location',
      name: 'editLocation',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get egp {
    return Intl.message('EGP', name: 'egp', desc: '', args: []);
  }

  /// `Hair Styling`
  String get hairStyling {
    return Intl.message(
      'Hair Styling',
      name: 'hairStyling',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Select Services`
  String get selectServices {
    return Intl.message(
      'Select Services',
      name: 'selectServices',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `WhatsApp`
  String get whatsapp {
    return Intl.message('WhatsApp', name: 'whatsapp', desc: '', args: []);
  }

  /// `Send Message`
  String get sendMessage {
    return Intl.message(
      'Send Message',
      name: 'sendMessage',
      desc: '',
      args: [],
    );
  }

  /// `Write your message here`
  String get writeYourMessage {
    return Intl.message(
      'Write your message here',
      name: 'writeYourMessage',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Working Hours`
  String get workingHours {
    return Intl.message(
      'Working Hours',
      name: 'workingHours',
      desc: '',
      args: [],
    );
  }

  /// `Saturday to Thursday`
  String get saturdayToThursday {
    return Intl.message(
      'Saturday to Thursday',
      name: 'saturdayToThursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get friday {
    return Intl.message('Friday', name: 'friday', desc: '', args: []);
  }

  /// `Message sent successfully`
  String get messageSentSuccessfully {
    return Intl.message(
      'Message sent successfully',
      name: 'messageSentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get addNewAddress {
    return Intl.message(
      'Add New Address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Home Screen`
  String get homeScreen {
    return Intl.message('Home Screen', name: 'homeScreen', desc: '', args: []);
  }

  /// `Accept`
  String get accept {
    return Intl.message('Accept', name: 'accept', desc: '', args: []);
  }

  /// `Reject`
  String get reject {
    return Intl.message('Reject', name: 'reject', desc: '', args: []);
  }

  /// `Start Search`
  String get startSearch {
    return Intl.message(
      'Start Search',
      name: 'startSearch',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Search`
  String get cancelSearch {
    return Intl.message(
      'Cancel Search',
      name: 'cancelSearch',
      desc: '',
      args: [],
    );
  }

  /// `Book Later`
  String get bookLater {
    return Intl.message('Book Later', name: 'bookLater', desc: '', args: []);
  }

  /// `Date and Time`
  String get dateAndTime {
    return Intl.message(
      'Date and Time',
      name: 'dateAndTime',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Time`
  String get time {
    return Intl.message('Time', name: 'time', desc: '', args: []);
  }

  /// `Book`
  String get book {
    return Intl.message('Book', name: 'book', desc: '', args: []);
  }

  /// `On the Way`
  String get onTheWay {
    return Intl.message('On the Way', name: 'onTheWay', desc: '', args: []);
  }

  /// `User Name`
  String get userName {
    return Intl.message('User Name', name: 'userName', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Booking`
  String get booking {
    return Intl.message('Booking', name: 'booking', desc: '', args: []);
  }

  /// `Confirm Payment`
  String get confirmPayment {
    return Intl.message(
      'Confirm Payment',
      name: 'confirmPayment',
      desc: '',
      args: [],
    );
  }

  /// `Payment Successful`
  String get paymentSuccessful {
    return Intl.message(
      'Payment Successful',
      name: 'paymentSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Booking Confirmed`
  String get bookingConfirmed {
    return Intl.message(
      'Booking Confirmed',
      name: 'bookingConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get backToHome {
    return Intl.message('Back to Home', name: 'backToHome', desc: '', args: []);
  }

  /// `Data Saved Successfully`
  String get dataSavedSuccessfully {
    return Intl.message(
      'Data Saved Successfully',
      name: 'dataSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Add Insurance Card`
  String get addInsuranceCard {
    return Intl.message(
      'Add Insurance Card',
      name: 'addInsuranceCard',
      desc: '',
      args: [],
    );
  }

  /// `No insurance cards saved`
  String get noInsuranceCardsSaved {
    return Intl.message(
      'No insurance cards saved',
      name: 'noInsuranceCardsSaved',
      desc: '',
      args: [],
    );
  }

  /// `Default`
  String get defaultText {
    return Intl.message('Default', name: 'defaultText', desc: '', args: []);
  }

  /// `Set as Default`
  String get setAsDefault {
    return Intl.message(
      'Set as Default',
      name: 'setAsDefault',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Card Holder`
  String get cardHolder {
    return Intl.message('Card Holder', name: 'cardHolder', desc: '', args: []);
  }

  /// `Card Number`
  String get cardNumber {
    return Intl.message('Card Number', name: 'cardNumber', desc: '', args: []);
  }

  /// `Expiry Date`
  String get expiryDate {
    return Intl.message('Expiry Date', name: 'expiryDate', desc: '', args: []);
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Are you sure you want to delete this card?`
  String get areYouSureDeleteCard {
    return Intl.message(
      'Are you sure you want to delete this card?',
      name: 'areYouSureDeleteCard',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Language Changed Successfully`
  String get languageChangedSuccessfully {
    return Intl.message(
      'Language Changed Successfully',
      name: 'languageChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `No addresses saved`
  String get noAddressesSaved {
    return Intl.message(
      'No addresses saved',
      name: 'noAddressesSaved',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this address?`
  String get areYouSureDeleteAddress {
    return Intl.message(
      'Are you sure you want to delete this address?',
      name: 'areYouSureDeleteAddress',
      desc: '',
      args: [],
    );
  }

  /// `Edit Address`
  String get editAddress {
    return Intl.message(
      'Edit Address',
      name: 'editAddress',
      desc: '',
      args: [],
    );
  }

  /// `Delete Address`
  String get deleteAddress {
    return Intl.message(
      'Delete Address',
      name: 'deleteAddress',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get addAddress {
    return Intl.message(
      'Add New Address',
      name: 'addAddress',
      desc: '',
      args: [],
    );
  }

  /// `Add insurance card screen will be added soon`
  String get addInsuranceCardScreen {
    return Intl.message(
      'Add insurance card screen will be added soon',
      name: 'addInsuranceCardScreen',
      desc: '',
      args: [],
    );
  }

  /// `Edit insurance card screen will be added soon`
  String get editInsuranceCardScreen {
    return Intl.message(
      'Edit insurance card screen will be added soon',
      name: 'editInsuranceCardScreen',
      desc: '',
      args: [],
    );
  }

  /// `Add address screen will be added soon`
  String get addAddressScreen {
    return Intl.message(
      'Add address screen will be added soon',
      name: 'addAddressScreen',
      desc: '',
      args: [],
    );
  }

  /// `Edit address screen will be added soon`
  String get editAddressScreen {
    return Intl.message(
      'Edit address screen will be added soon',
      name: 'editAddressScreen',
      desc: '',
      args: [],
    );
  }

  /// `Building`
  String get building {
    return Intl.message('Building', name: 'building', desc: '', args: []);
  }

  /// `Floor`
  String get floor {
    return Intl.message('Floor', name: 'floor', desc: '', args: []);
  }

  /// `Apartment`
  String get apartment {
    return Intl.message('Apartment', name: 'apartment', desc: '', args: []);
  }

  /// `On the Way`
  String get onTheWayText {
    return Intl.message('On the Way', name: 'onTheWayText', desc: '', args: []);
  }

  /// `minutes`
  String get minutes {
    return Intl.message('minutes', name: 'minutes', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message('Light Mode', name: 'lightMode', desc: '', args: []);
  }

  /// `Wallet Balance`
  String get walletBalance {
    return Intl.message(
      'Wallet Balance',
      name: 'walletBalance',
      desc: '',
      args: [],
    );
  }

  /// `View wallet statement`
  String get viewWalletStatement {
    return Intl.message(
      'View wallet statement',
      name: 'viewWalletStatement',
      desc: '',
      args: [],
    );
  }

  /// `Add funds`
  String get addFunds {
    return Intl.message('Add funds', name: 'addFunds', desc: '', args: []);
  }

  /// `Cards`
  String get cards {
    return Intl.message('Cards', name: 'cards', desc: '', args: []);
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Your payment info is stored securely`
  String get yourPaymentInfoStoredSecurely {
    return Intl.message(
      'Your payment info is stored securely',
      name: 'yourPaymentInfoStoredSecurely',
      desc: '',
      args: [],
    );
  }

  /// `Visa`
  String get visa {
    return Intl.message('Visa', name: 'visa', desc: '', args: []);
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
