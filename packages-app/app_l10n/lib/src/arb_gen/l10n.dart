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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',);
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',);
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `1 OF 2`
  String get onboardingItemFirstNumberTitle {
    return Intl.message(
      '1 OF 2',
      name: 'onboardingItemFirstNumberTitle',
      desc: '',
      args: [],
    );
  }

  /// `ADD YOUR TITLE FOR\nAD TRACKING PERMISSIONS`
  String get onboardingItemFirstTitle {
    return Intl.message(
      'ADD YOUR TITLE FOR\nAD TRACKING PERMISSIONS',
      name: 'onboardingItemFirstTitle',
      desc: '',
      args: [],
    );
  }

  /// `ADD YOUR DESCRIPTION FOR\nAD TRACKING PERMISSIONS`
  String get onboardingItemFirstSubtitleTitle {
    return Intl.message(
      r'ADD YOUR DESCRIPTION FOR\nAD TRACKING PERMISSIONS',
      name: 'onboardingItemFirstSubtitleTitle',
      desc: '',
      args: [],
    );
  }

  /// `ADD YOUR CALL TO ACTION`
  String get onboardingItemFirstButtonTitle {
    return Intl.message(
      'ADD YOUR CALL TO ACTION',
      name: 'onboardingItemFirstButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `ADD YOUR DECLINE TEXT`
  String get onboardingItemSecondaryButtonTitle {
    return Intl.message(
      'ADD YOUR DECLINE TEXT',
      name: 'onboardingItemSecondaryButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `2 OF 2`
  String get onboardingItemSecondNumberTitle {
    return Intl.message(
      '2 OF 2',
      name: 'onboardingItemSecondNumberTitle',
      desc: '',
      args: [],
    );
  }

  /// `ADD YOUR TITLE FOR\nNOTIFICATION PERMISSIONS`
  String get onboardingItemSecondTitle {
    return Intl.message(
      'ADD YOUR TITLE FOR\nNOTIFICATION PERMISSIONS',
      name: 'onboardingItemSecondTitle',
      desc: '',
      args: [],
    );
  }

  /// `ADD YOUR DESCRIPTION FOR\nNOTIFICATION PERMISSIONS`
  String get onboardingItemSecondSubtitleTitle {
    return Intl.message(
      r'ADD YOUR DESCRIPTION FOR\nNOTIFICATION PERMISSIONS',
      name: 'onboardingItemSecondSubtitleTitle',
      desc: '',
      args: [],
    );
  }

  /// `ADD YOUR CALL TO ACTION`
  String get onboardingItemSecondButtonTitle {
    return Intl.message(
      'ADD YOUR CALL TO ACTION',
      name: 'onboardingItemSecondButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to\nMyCaselog!`
  String get onboardingWelcomeTitle {
    return Intl.message(
      'Welcome to\nMyCaselog!',
      name: 'onboardingWelcomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please set your preferences to\nget the app up and running.`
  String get onboardingSubtitle {
    return Intl.message(
      'Please set your preferences to\nget the app up and running.',
      name: 'onboardingSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `SECTIONS`
  String get navigationDrawerSectionsTitle {
    return Intl.message(
      'SECTIONS',
      name: 'navigationDrawerSectionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get themeModeOptionSystem {
    return Intl.message(
      'System',
      name: 'themeModeOptionSystem',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get themeModeOptionLight {
    return Intl.message(
      'Light',
      name: 'themeModeOptionLight',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get themeModeOptionDark {
    return Intl.message(
      'Dark',
      name: 'themeModeOptionDark',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Mycaselog`
  String get welcomeToMycaselog {
    return Intl.message(
      'Welcome to Mycaselog',
      name: 'welcomeToMycaselog',
      desc: '',
      args: [],
    );
  }

  /// `Mycaselog`
  String get appTitle {
    return Intl.message(
      'Mycaselog',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get onBoardingButtonLabel {
    return Intl.message(
      'Get Started',
      name: 'onBoardingButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Re try`
  String get reTryButtonLabel {
    return Intl.message(
      'Re try',
      name: 'reTryButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `year`
  String get year {
    return Intl.message(
      'year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Internet Connection unavailable`
  String get internetConnectionUnavailable {
    return Intl.message(
      'Internet Connection unavailable',
      name: 'internetConnectionUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `This is a required field`
  String get isRequiredFieldMessage {
    return Intl.message(
      'This is a required field',
      name: 'isRequiredFieldMessage',
      desc: '',
      args: [],
    );
  }

  /// `Data type invalid`
  String get dataTypeInvalid {
    return Intl.message(
      'Data type invalid',
      name: 'dataTypeInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get fieldTitleGender {
    return Intl.message(
      'Gender',
      name: 'fieldTitleGender',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get fieldTitleYear {
    return Intl.message(
      'Year',
      name: 'fieldTitleYear',
      desc: '',
      args: [],
    );
  }

  /// `enter..`
  String get inputPlaceholderText {
    return Intl.message(
      'enter..',
      name: 'inputPlaceholderText',
      desc: '',
      args: [],
    );
  }

  /// `Surgery Template`
  String get surgeryTemplate {
    return Intl.message(
      'Surgery Template',
      name: 'surgeryTemplate',
      desc: '',
      args: [],
    );
  }

  /// `select`
  String get select {
    return Intl.message(
      'select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Change in template may corrupt prior saved data`
  String get changeSavedTemplateWarning {
    return Intl.message(
      'Change in template may corrupt prior saved data',
      name: 'changeSavedTemplateWarning',
      desc: '',
      args: [],
    );
  }

  /// `No surgery templates available`
  String get noSurgeryTemplatesAvailable {
    return Intl.message(
      'No surgery templates available',
      name: 'noSurgeryTemplatesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Please create templates under settings`
  String get pleaseCreateTemplatesUnderSettings {
    return Intl.message(
      'Please create templates under settings',
      name: 'pleaseCreateTemplatesUnderSettings',
      desc: '',
      args: [],
    );
  }

  /// `Surgery Templates`
  String get surgeryTemplates {
    return Intl.message(
      'Surgery Templates',
      name: 'surgeryTemplates',
      desc: '',
      args: [],
    );
  }

  /// `clear`
  String get clear {
    return Intl.message(
      'clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Error!`
  String get errorTitle {
    return Intl.message(
      'Error!',
      name: 'errorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Assistants`
  String get assistants {
    return Intl.message(
      'Assistants',
      name: 'assistants',
      desc: '',
      args: [],
    );
  }

  /// `Locations`
  String get locations {
    return Intl.message(
      'Locations',
      name: 'locations',
      desc: '',
      args: [],
    );
  }

  /// `Add Assistant`
  String get addAssistant {
    return Intl.message(
      'Add Assistant',
      name: 'addAssistant',
      desc: '',
      args: [],
    );
  }

  /// `Add Location`
  String get addLocation {
    return Intl.message(
      'Add Location',
      name: 'addLocation',
      desc: '',
      args: [],
    );
  }

  /// `Select Surgery Template`
  String get selectSurgeryTemplate {
    return Intl.message(
      'Select Surgery Template',
      name: 'selectSurgeryTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Error loading data`
  String get errorLoadingData {
    return Intl.message(
      'Error loading data',
      name: 'errorLoadingData',
      desc: '',
      args: [],
    );
  }

  /// `No case template`
  String get noCaseTemplate {
    return Intl.message(
      'No case template',
      name: 'noCaseTemplate',
      desc: '',
      args: [],
    );
  }

  /// `No template fields`
  String get noTemplateFields {
    return Intl.message(
      'No template fields',
      name: 'noTemplateFields',
      desc: '',
      args: [],
    );
  }

  /// `No cases`
  String get noCases {
    return Intl.message(
      'No cases',
      name: 'noCases',
      desc: '',
      args: [],
    );
  }

  /// `current app theme`
  String get currentAppTheme {
    return Intl.message(
      'current app theme',
      name: 'currentAppTheme',
      desc: '',
      args: [],
    );
  }

  /// `Change app theme`
  String get changeAppTheme {
    return Intl.message(
      'Change app theme',
      name: 'changeAppTheme',
      desc: '',
      args: [],
    );
  }

  /// `Light Theme`
  String get appThemeLight {
    return Intl.message(
      'Light Theme',
      name: 'appThemeLight',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get appThemeDark {
    return Intl.message(
      'Dark Theme',
      name: 'appThemeDark',
      desc: '',
      args: [],
    );
  }

  /// `System Theme`
  String get appThemeSystem {
    return Intl.message(
      'System Theme',
      name: 'appThemeSystem',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Select Speciality`
  String get selectSpeciality {
    return Intl.message(
      'Select Speciality',
      name: 'selectSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `Error updating`
  String get errorUpdating {
    return Intl.message(
      'Error updating',
      name: 'errorUpdating',
      desc: '',
      args: [],
    );
  }

  /// `Sub-speciality`
  String get subspeciality {
    return Intl.message(
      'Sub-speciality',
      name: 'subspeciality',
      desc: '',
      args: [],
    );
  }

  /// `Default surgery location`
  String get defaultSurgeryLocation {
    return Intl.message(
      'Default surgery location',
      name: 'defaultSurgeryLocation',
      desc: '',
      args: [],
    );
  }

  /// `General Settings`
  String get generalSettings {
    return Intl.message(
      'General Settings',
      name: 'generalSettings',
      desc: '',
      args: [],
    );
  }

  /// `Location to pre-fill in add surgery form`
  String get surgeryLocationSubTitle {
    return Intl.message(
      'Location to pre-fill in add surgery form',
      name: 'surgeryLocationSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `biometrics enabled`
  String get biometricsEnabled {
    return Intl.message(
      'biometrics enabled',
      name: 'biometricsEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Use biometric security for sensitive data`
  String get useBiometricSecuritySubtitle {
    return Intl.message(
      'Use biometric security for sensitive data',
      name: 'useBiometricSecuritySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Upload full size photos?`
  String get uploadFullSizePhotos {
    return Intl.message(
      'Upload full size photos?',
      name: 'uploadFullSizePhotos',
      desc: '',
      args: [],
    );
  }

  /// `High bandwidth and server storage`
  String get uploadFullSizePhotosSubTitle {
    return Intl.message(
      'High bandwidth and server storage',
      name: 'uploadFullSizePhotosSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sync data on app start`
  String get syncDataOnAppStart {
    return Intl.message(
      'Sync data on app start',
      name: 'syncDataOnAppStart',
      desc: '',
      args: [],
    );
  }

  /// `call server to check updates on every cold start of app`
  String get syncDataOnAppStartSubTitle {
    return Intl.message(
      'call server to check updates on every cold start of app',
      name: 'syncDataOnAppStartSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `surgery detail landing tab`
  String get surgeryDetailLandingTab {
    return Intl.message(
      'surgery detail landing tab',
      name: 'surgeryDetailLandingTab',
      desc: '',
      args: [],
    );
  }

  /// `Case tile display style`
  String get caseTileDisplayStyle {
    return Intl.message(
      'Case tile display style',
      name: 'caseTileDisplayStyle',
      desc: '',
      args: [],
    );
  }

  /// `The local database will be deleted and entire data reloaded from server.\n\nThis process will consume a significant bandwidth and server resources. In addition, it can result in data curruption. \n\n ARE YOU SURE TO PROCEED?`
  String get syncAllDataWarning {
    return Intl.message(
      'The local database will be deleted and entire data reloaded from server.\n\nThis process will consume a significant bandwidth and server resources. In addition, it can result in data curruption. \n\n ARE YOU SURE TO PROCEED?',
      name: 'syncAllDataWarning',
      desc: '',
      args: [],
    );
  }

  /// `Your Encryption key does not match the records. Please use the same key you used before!`
  String get exceptionInvalidCredentials {
    return Intl.message(
      'Your Encryption key does not match the records. Please use the same key you used before!',
      name: 'exceptionInvalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Encryption key is a secret text just like a password. This key will be used for encryption of sensitive app data.\n\nFor security reason, this key is not stored anywhere by app and thus if lost there is no way to retrieve your data or this encryption key.\n\n Please make sure you save this key somewhere safe. You will be required to provide this key for validation in future.`
  String get encryptionKeyInfoDetails {
    return Intl.message(
      'Encryption key is a secret text just like a password. This key will be used for encryption of sensitive app data.\n\nFor security reason, this key is not stored anywhere by app and thus if lost there is no way to retrieve your data or this encryption key.\n\n Please make sure you save this key somewhere safe. You will be required to provide this key for validation in future.',
      name: 'encryptionKeyInfoDetails',
      desc: '',
      args: [],
    );
  }

  /// `you have been warned!!`
  String get youHaveBeenWarned {
    return Intl.message(
      'you have been warned!!',
      name: 'youHaveBeenWarned',
      desc: '',
      args: [],
    );
  }

  /// `submit`
  String get submit {
    return Intl.message(
      'submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Encryption Key`
  String get encryptionKeyScreenTitle {
    return Intl.message(
      'Encryption Key',
      name: 'encryptionKeyScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your encryption key`
  String get enterYourEncryptionKey {
    return Intl.message(
      'Enter your encryption key',
      name: 'enterYourEncryptionKey',
      desc: '',
      args: [],
    );
  }

  /// `Encryption Key`
  String get encryptionKey {
    return Intl.message(
      'Encryption Key',
      name: 'encryptionKey',
      desc: '',
      args: [],
    );
  }

  /// `confirm encryption key`
  String get confirmEncryptionKey {
    return Intl.message(
      'confirm encryption key',
      name: 'confirmEncryptionKey',
      desc: '',
      args: [],
    );
  }

  /// `Ecryption key must be minimum 8 characters`
  String get ecryptionKeyMinCharWarning {
    return Intl.message(
      'Ecryption key must be minimum 8 characters',
      name: 'ecryptionKeyMinCharWarning',
      desc: '',
      args: [],
    );
  }

  /// `What is Encryption Key`
  String get encryptionKeyInfoTitle {
    return Intl.message(
      'What is Encryption Key',
      name: 'encryptionKeyInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `user not available`
  String get userNotAvailable {
    return Intl.message(
      'user not available',
      name: 'userNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get getStarted {
    return Intl.message(
      'Get started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Mycaselog`
  String get appName {
    return Intl.message(
      'Mycaselog',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Misc Settings`
  String get miscSettingsTitle {
    return Intl.message(
      'Misc Settings',
      name: 'miscSettingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mycaselog is an app developed by Dr Vikrant Azad, a practicing Orthopedic surgeon for his own personal use.\n   It serves to keep good record of his surgery cases in HIPAA compliant manner for helping in patient follow-up and research.`
  String get mycaselogIsAboutUsDescription {
    return Intl.message(
      'Mycaselog is an app developed by Dr Vikrant Azad, a practicing Orthopedic surgeon for his own personal use.\n   It serves to keep good record of his surgery cases in HIPAA compliant manner for helping in patient follow-up and research.',
      name: 'mycaselogIsAboutUsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get areYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Login will be required on next app start`
  String get loginRequiredOnSignOut {
    return Intl.message(
      'Login will be required on next app start',
      name: 'loginRequiredOnSignOut',
      desc: '',
      args: [],
    );
  }

  /// `What is encryption key`
  String get whatsEncryptionKey {
    return Intl.message(
      'What is encryption key',
      name: 'whatsEncryptionKey',
      desc: '',
      args: [],
    );
  }

  /// `Templates`
  String get templates {
    return Intl.message(
      'Templates',
      name: 'templates',
      desc: '',
      args: [],
    );
  }

  /// `Select a media source for avatar`
  String get avatarMediaSource {
    return Intl.message(
      'Select a media source for avatar',
      name: 'avatarMediaSource',
      desc: '',
      args: [],
    );
  }

  /// `Never`
  String get never {
    return Intl.message(
      'Never',
      name: 'never',
      desc: '',
      args: [],
    );
  }

  /// `Sync All`
  String get syncAll {
    return Intl.message(
      'Sync All',
      name: 'syncAll',
      desc: '',
      args: [],
    );
  }

  /// `No media`
  String get noMedia {
    return Intl.message(
      'No media',
      name: 'noMedia',
      desc: '',
      args: [],
    );
  }

  /// `data is null`
  String get dataIsNull {
    return Intl.message(
      'data is null',
      name: 'dataIsNull',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Mycaselog app media files`
  String get mediaShareSubjectLine {
    return Intl.message(
      'Mycaselog app media files',
      name: 'mediaShareSubjectLine',
      desc: '',
      args: [],
    );
  }

  /// `No template data`
  String get noTemplateData {
    return Intl.message(
      'No template data',
      name: 'noTemplateData',
      desc: '',
      args: [],
    );
  }

  /// `Patient Data`
  String get patientData {
    return Intl.message(
      'Patient Data',
      name: 'patientData',
      desc: '',
      args: [],
    );
  }

  /// `Please authenticate for data access`
  String get biometricAuthMessage {
    return Intl.message(
      'Please authenticate for data access',
      name: 'biometricAuthMessage',
      desc: '',
      args: [],
    );
  }

  /// `The app uses biometric authentication. Please enable it on device before continuing.`
  String get requireBiometricEnabled {
    return Intl.message(
      'The app uses biometric authentication. Please enable it on device before continuing.',
      name: 'requireBiometricEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Saved credentials not available`
  String get savedCredentialsNotAvailable {
    return Intl.message(
      'Saved credentials not available',
      name: 'savedCredentialsNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `submitting..`
  String get submitting {
    return Intl.message(
      'submitting..',
      name: 'submitting',
      desc: '',
      args: [],
    );
  }

  /// `Male,Female,NA`
  String get genderList {
    return Intl.message(
      'Male,Female,NA',
      name: 'genderList',
      desc: '',
      args: [],
    );
  }

  /// `surgery on`
  String get surgeryOnPrefix {
    return Intl.message(
      'surgery on',
      name: 'surgeryOnPrefix',
      desc: '',
      args: [],
    );
  }

  /// `No results`
  String get noResults {
    return Intl.message(
      'No results',
      name: 'noResults',
      desc: '',
      args: [],
    );
  }

  /// `No timeline items`
  String get noTimelineItems {
    return Intl.message(
      'No timeline items',
      name: 'noTimelineItems',
      desc: '',
      args: [],
    );
  }

  /// `No media to upload`
  String get noMediaToUpload {
    return Intl.message(
      'No media to upload',
      name: 'noMediaToUpload',
      desc: '',
      args: [],
    );
  }

  /// `List of templates`
  String get templatesScreenSubTitle {
    return Intl.message(
      'List of templates',
      name: 'templatesScreenSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `last update`
  String get lastUpdate {
    return Intl.message(
      'last update',
      name: 'lastUpdate',
      desc: '',
      args: [],
    );
  }

  /// `deactivated`
  String get deactivated {
    return Intl.message(
      'deactivated',
      name: 'deactivated',
      desc: '',
      args: [],
    );
  }

  /// `Deactivate Template`
  String get deactivateTemplate {
    return Intl.message(
      'Deactivate Template',
      name: 'deactivateTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Please know that because a template may have been used previously, on deactivation the template is not deleted but only removed from list here`
  String get deactivateTemplateMessage {
    return Intl.message(
      'Please know that because a template may have been used previously, on deactivation the template is not deleted but only removed from list here',
      name: 'deactivateTemplateMessage',
      desc: '',
      args: [],
    );
  }

  /// `Re-activate this template?`
  String get reactiveTemplate {
    return Intl.message(
      'Re-activate this template?',
      name: 'reactiveTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Delete this template?`
  String get deleteThisTemplate {
    return Intl.message(
      'Delete this template?',
      name: 'deleteThisTemplate',
      desc: '',
      args: [],
    );
  }

  /// `none`
  String get none {
    return Intl.message(
      'none',
      name: 'none',
      desc: '',
      args: [],
    );
  }

  /// `Select a template to import fields from`
  String get selectTemplateToImportFields {
    return Intl.message(
      'Select a template to import fields from',
      name: 'selectTemplateToImportFields',
      desc: '',
      args: [],
    );
  }

  /// `Add Field`
  String get addField {
    return Intl.message(
      'Add Field',
      name: 'addField',
      desc: '',
      args: [],
    );
  }

  /// `Edit Field`
  String get editField {
    return Intl.message(
      'Edit Field',
      name: 'editField',
      desc: '',
      args: [],
    );
  }

  /// `Field Type`
  String get fieldType {
    return Intl.message(
      'Field Type',
      name: 'fieldType',
      desc: '',
      args: [],
    );
  }

  /// `Field Title`
  String get fieldTitle {
    return Intl.message(
      'Field Title',
      name: 'fieldTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Template`
  String get addTemplate {
    return Intl.message(
      'Add Template',
      name: 'addTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Edit Template`
  String get editTemplate {
    return Intl.message(
      'Edit Template',
      name: 'editTemplate',
      desc: '',
      args: [],
    );
  }

  /// `title`
  String get title {
    return Intl.message(
      'title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Import Fields`
  String get importFields {
    return Intl.message(
      'Import Fields',
      name: 'importFields',
      desc: '',
      args: [],
    );
  }

  /// `No list to remove field from`
  String get noListToRemoveFieldFrom {
    return Intl.message(
      'No list to remove field from',
      name: 'noListToRemoveFieldFrom',
      desc: '',
      args: [],
    );
  }

  /// `fields`
  String get fields {
    return Intl.message(
      'fields',
      name: 'fields',
      desc: '',
      args: [],
    );
  }

  /// `Default Value`
  String get defaultValue {
    return Intl.message(
      'Default Value',
      name: 'defaultValue',
      desc: '',
      args: [],
    );
  }

  /// `suffix`
  String get suffix {
    return Intl.message(
      'suffix',
      name: 'suffix',
      desc: '',
      args: [],
    );
  }

  /// `required`
  String get required {
    return Intl.message(
      'required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `options`
  String get options {
    return Intl.message(
      'options',
      name: 'options',
      desc: '',
      args: [],
    );
  }

  /// `Add Option`
  String get addOption {
    return Intl.message(
      'Add Option',
      name: 'addOption',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get alert {
    return Intl.message(
      'Alert',
      name: 'alert',
      desc: '',
      args: [],
    );
  }

  /// `option does not exist`
  String get optionDoesNotExist {
    return Intl.message(
      'option does not exist',
      name: 'optionDoesNotExist',
      desc: '',
      args: [],
    );
  }

  /// `Field Preview`
  String get fieldPreview {
    return Intl.message(
      'Field Preview',
      name: 'fieldPreview',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filters {
    return Intl.message(
      'Filters',
      name: 'filters',
      desc: '',
      args: [],
    );
  }

  /// `Search Stats`
  String get searchStats {
    return Intl.message(
      'Search Stats',
      name: 'searchStats',
      desc: '',
      args: [],
    );
  }

  /// `BASIC`
  String get basic {
    return Intl.message(
      'BASIC',
      name: 'basic',
      desc: '',
      args: [],
    );
  }

  /// `template`
  String get template {
    return Intl.message(
      'template',
      name: 'template',
      desc: '',
      args: [],
    );
  }

  /// `timeline`
  String get timeline {
    return Intl.message(
      'timeline',
      name: 'timeline',
      desc: '',
      args: [],
    );
  }

  /// `Case Details`
  String get caseDetails {
    return Intl.message(
      'Case Details',
      name: 'caseDetails',
      desc: '',
      args: [],
    );
  }

  /// `No template selected`
  String get noTemplateSelected {
    return Intl.message(
      'No template selected',
      name: 'noTemplateSelected',
      desc: '',
      args: [],
    );
  }

  /// `Selected template has no fields`
  String get selectedTemplateHasNoFields {
    return Intl.message(
      'Selected template has no fields',
      name: 'selectedTemplateHasNoFields',
      desc: '',
      args: [],
    );
  }

  /// `Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec`
  String get monthsNameShortList {
    return Intl.message(
      'Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec',
      name: 'monthsNameShortList',
      desc: '',
      args: [],
    );
  }

  /// `Basic,Template,Timeline`
  String get caseDataTabsNameList {
    return Intl.message(
      'Basic,Template,Timeline',
      name: 'caseDataTabsNameList',
      desc: '',
      args: [],
    );
  }

  /// `ankle,femoral,local,popliteal,saphenous,scalene`
  String get anesthesiaBlockTypes {
    return Intl.message(
      'ankle,femoral,local,popliteal,saphenous,scalene',
      name: 'anesthesiaBlockTypes',
      desc: '',
      args: [],
    );
  }

  /// `general,spinal,regional,local,tiva,mac`
  String get anesthesiaTypes {
    return Intl.message(
      'general,spinal,regional,local,tiva,mac',
      name: 'anesthesiaTypes',
      desc: '',
      args: [],
    );
  }

  /// `left,right,bilateral,NA`
  String get surgerySideList {
    return Intl.message(
      'left,right,bilateral,NA',
      name: 'surgerySideList',
      desc: '',
      args: [],
    );
  }

  /// `side`
  String get side {
    return Intl.message(
      'side',
      name: 'side',
      desc: '',
      args: [],
    );
  }

  /// `location`
  String get location {
    return Intl.message(
      'location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Ebl`
  String get ebl {
    return Intl.message(
      'Ebl',
      name: 'ebl',
      desc: '',
      args: [],
    );
  }

  /// `anesthesia`
  String get anesthesia {
    return Intl.message(
      'anesthesia',
      name: 'anesthesia',
      desc: '',
      args: [],
    );
  }

  /// `Anesthesia Block`
  String get anesthesiaBlock {
    return Intl.message(
      'Anesthesia Block',
      name: 'anesthesiaBlock',
      desc: '',
      args: [],
    );
  }

  /// `comments`
  String get comments {
    return Intl.message(
      'comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `ICD-10`
  String get icd10 {
    return Intl.message(
      'ICD-10',
      name: 'icd10',
      desc: '',
      args: [],
    );
  }

  /// `CPT`
  String get cpt {
    return Intl.message(
      'CPT',
      name: 'cpt',
      desc: '',
      args: [],
    );
  }

  /// `ASA`
  String get asa {
    return Intl.message(
      'ASA',
      name: 'asa',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `credentials`
  String get credentials {
    return Intl.message(
      'credentials',
      name: 'credentials',
      desc: '',
      args: [],
    );
  }

  /// `No message`
  String get noMessage {
    return Intl.message(
      'No message',
      name: 'noMessage',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get unknownError {
    return Intl.message(
      'Unknown error',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `cases`
  String get cases {
    return Intl.message(
      'cases',
      name: 'cases',
      desc: '',
      args: [],
    );
  }

  /// `media`
  String get media {
    return Intl.message(
      'media',
      name: 'media',
      desc: '',
      args: [],
    );
  }

  /// `settings`
  String get settings {
    return Intl.message(
      'settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `stats`
  String get stats {
    return Intl.message(
      'stats',
      name: 'stats',
      desc: '',
      args: [],
    );
  }

  /// `Encryption already exist`
  String get encryptionAlreadyExist {
    return Intl.message(
      'Encryption already exist',
      name: 'encryptionAlreadyExist',
      desc: '',
      args: [],
    );
  }

  /// `Error in encrypting passcode`
  String get errorInEncryptingPasscode {
    return Intl.message(
      'Error in encrypting passcode',
      name: 'errorInEncryptingPasscode',
      desc: '',
      args: [],
    );
  }

  /// `By signing in, you agree to our `
  String get bySigningInYouAgreeToOurTermsAndConditions {
    return Intl.message(
      'By signing in, you agree to our ',
      name: 'bySigningInYouAgreeToOurTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `terms and conditions`
  String get termsAndConditions {
    return Intl.message(
      'terms and conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `close`
  String get close {
    return Intl.message(
      'close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `A preview of how the field would appear in form`
  String get fieldPreviewDescription {
    return Intl.message(
      'A preview of how the field would appear in form',
      name: 'fieldPreviewDescription',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get noData {
    return Intl.message(
      'No data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `No media to delete`
  String get noMediaToDelete {
    return Intl.message(
      'No media to delete',
      name: 'noMediaToDelete',
      desc: '',
      args: [],
    );
  }

  /// `Please note that the content will be deleted for good.\nThis action can not be undone`
  String get contentHardDeleteWarning {
    return Intl.message(
      'Please note that the content will be deleted for good.\nThis action can not be undone',
      name: 'contentHardDeleteWarning',
      desc: '',
      args: [],
    );
  }

  /// `gender`
  String get gender {
    return Intl.message(
      'gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Birth Year`
  String get birthYear {
    return Intl.message(
      'Birth Year',
      name: 'birthYear',
      desc: '',
      args: [],
    );
  }

  /// `Surgery Date`
  String get surgeryDate {
    return Intl.message(
      'Surgery Date',
      name: 'surgeryDate',
      desc: '',
      args: [],
    );
  }

  /// `diagnosis`
  String get diagnosis {
    return Intl.message(
      'diagnosis',
      name: 'diagnosis',
      desc: '',
      args: [],
    );
  }

  /// `surgery`
  String get surgery {
    return Intl.message(
      'surgery',
      name: 'surgery',
      desc: '',
      args: [],
    );
  }

  /// `side`
  String get surgerySide {
    return Intl.message(
      'side',
      name: 'surgerySide',
      desc: '',
      args: [],
    );
  }

  /// `pcp`
  String get pcp {
    return Intl.message(
      'pcp',
      name: 'pcp',
      desc: '',
      args: [],
    );
  }

  /// `No suggestions`
  String get noSuggestions {
    return Intl.message(
      'No suggestions',
      name: 'noSuggestions',
      desc: '',
      args: [],
    );
  }

  /// `Title of template`
  String get templateTitle {
    return Intl.message(
      'Title of template',
      name: 'templateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `back`
  String get back {
    return Intl.message(
      'back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Passcode verification failed`
  String get passcodeVerificationFailed {
    return Intl.message(
      'Passcode verification failed',
      name: 'passcodeVerificationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Form has error`
  String get formHasError {
    return Intl.message(
      'Form has error',
      name: 'formHasError',
      desc: '',
      args: [],
    );
  }

  /// `Select a template to import fields from`
  String get selectTemplateForFieldImport {
    return Intl.message(
      'Select a template to import fields from',
      name: 'selectTemplateForFieldImport',
      desc: '',
      args: [],
    );
  }

  /// `No user templates`
  String get noUserTemplates {
    return Intl.message(
      'No user templates',
      name: 'noUserTemplates',
      desc: '',
      args: [],
    );
  }

  /// `My surgery assistants`
  String get mySurgeryAssistants {
    return Intl.message(
      'My surgery assistants',
      name: 'mySurgeryAssistants',
      desc: '',
      args: [],
    );
  }

  /// `sync`
  String get sync {
    return Intl.message(
      'sync',
      name: 'sync',
      desc: '',
      args: [],
    );
  }

  /// `App Color`
  String get appColor {
    return Intl.message(
      'App Color',
      name: 'appColor',
      desc: '',
      args: [],
    );
  }

  /// `Change App Color`
  String get changeAppColor {
    return Intl.message(
      'Change App Color',
      name: 'changeAppColor',
      desc: '',
      args: [],
    );
  }

  /// `Select sync time`
  String get selectSyncTime {
    return Intl.message(
      'Select sync time',
      name: 'selectSyncTime',
      desc: '',
      args: [],
    );
  }

  /// `Export CSV data`
  String get exportCsvData {
    return Intl.message(
      'Export CSV data',
      name: 'exportCsvData',
      desc: '',
      args: [],
    );
  }

  /// `Download CSV`
  String get downloadCsv {
    return Intl.message(
      'Download CSV',
      name: 'downloadCsv',
      desc: '',
      args: [],
    );
  }

  /// `Generate CSV`
  String get generateCsv {
    return Intl.message(
      'Generate CSV',
      name: 'generateCsv',
      desc: '',
      args: [],
    );
  }

  /// `Re-generate CSV`
  String get regenerateCsv {
    return Intl.message(
      'Re-generate CSV',
      name: 'regenerateCsv',
      desc: '',
      args: [],
    );
  }

  /// `Share CSV`
  String get shareCsv {
    return Intl.message(
      'Share CSV',
      name: 'shareCsv',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Back to`
  String get backTo {
    return Intl.message(
      'Back to',
      name: 'backTo',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
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

  /// `Forgot Password?`
  String get forgotPasswordQuestion {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPasswordQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Error displaying chart`
  String get errorDisplayingChart {
    return Intl.message(
      'Error displaying chart',
      name: 'errorDisplayingChart',
      desc: '',
      args: [],
    );
  }

  /// `bmi`
  String get bmi {
    return Intl.message(
      'bmi',
      name: 'bmi',
      desc: '',
      args: [],
    );
  }

  /// `active basic data fields`
  String get activeBasicDataFields {
    return Intl.message(
      'active basic data fields',
      name: 'activeBasicDataFields',
      desc: '',
      args: [],
    );
  }

  /// `Select input fields for add case data`
  String get activeBasicDataFieldsSubTitle {
    return Intl.message(
      'Select input fields for add case data',
      name: 'activeBasicDataFieldsSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please Wait`
  String get pleaseWait {
    return Intl.message(
      'Please Wait',
      name: 'pleaseWait',
      desc: '',
      args: [],
    );
  }

  /// `no`
  String get no {
    return Intl.message(
      'no',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `patient phone`
  String get patientPhone {
    return Intl.message(
      'patient phone',
      name: 'patientPhone',
      desc: '',
      args: [],
    );
  }

  /// `Patient Address`
  String get patientAddress {
    return Intl.message(
      'Patient Address',
      name: 'patientAddress',
      desc: '',
      args: [],
    );
  }

  /// `delete`
  String get delete {
    return Intl.message(
      'delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Email`
  String get confirmEmail {
    return Intl.message(
      'Confirm Email',
      name: 'confirmEmail',
      desc: '',
      args: [],
    );
  }

  /// `Re-send email verification`
  String get resendEmailVerification {
    return Intl.message(
      'Re-send email verification',
      name: 'resendEmailVerification',
      desc: '',
      args: [],
    );
  }

  /// `description`
  String get description {
    return Intl.message(
      'description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Template description`
  String get templateDescription {
    return Intl.message(
      'Template description',
      name: 'templateDescription',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `No default value`
  String get noDefaultValue {
    return Intl.message(
      'No default value',
      name: 'noDefaultValue',
      desc: '',
      args: [],
    );
  }

  /// `Template Field`
  String get templateField {
    return Intl.message(
      'Template Field',
      name: 'templateField',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to reset form data to original?`
  String get resetFormWarning {
    return Intl.message(
      'Are you sure you want to reset form data to original?',
      name: 'resetFormWarning',
      desc: '',
      args: [],
    );
  }

  /// `No Title`
  String get noTitle {
    return Intl.message(
      'No Title',
      name: 'noTitle',
      desc: '',
      args: [],
    );
  }

  /// `Failed to refresh data`
  String get failedToRefreshData {
    return Intl.message(
      'Failed to refresh data',
      name: 'failedToRefreshData',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized User`
  String get unauthorizedUser {
    return Intl.message(
      'Unauthorized User',
      name: 'unauthorizedUser',
      desc: '',
      args: [],
    );
  }

  /// `Device already has another active user`
  String get deviceHasAnotherAccount {
    return Intl.message(
      'Device already has another active user',
      name: 'deviceHasAnotherAccount',
      desc: '',
      args: [],
    );
  }

  /// `Missing form data`
  String get missingFormData {
    return Intl.message(
      'Missing form data',
      name: 'missingFormData',
      desc: '',
      args: [],
    );
  }

  /// `Encryption key is missing on server`
  String get encryptionKeyIsMissingOnServer {
    return Intl.message(
      'Encryption key is missing on server',
      name: 'encryptionKeyIsMissingOnServer',
      desc: '',
      args: [],
    );
  }

  /// `Client credentials do not match logged in user`
  String get credentialsUserMismatch {
    return Intl.message(
      'Client credentials do not match logged in user',
      name: 'credentialsUserMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Encryption service error`
  String get encryptionServiceError {
    return Intl.message(
      'Encryption service error',
      name: 'encryptionServiceError',
      desc: '',
      args: [],
    );
  }

  /// `Encryption failure`
  String get encryptionFailure {
    return Intl.message(
      'Encryption failure',
      name: 'encryptionFailure',
      desc: '',
      args: [],
    );
  }

  /// `De-cryption failure`
  String get decryptionFailure {
    return Intl.message(
      'De-cryption failure',
      name: 'decryptionFailure',
      desc: '',
      args: [],
    );
  }

  /// `User email has not been verified yet`
  String get userEmailNotVerified {
    return Intl.message(
      'User email has not been verified yet',
      name: 'userEmailNotVerified',
      desc: '',
      args: [],
    );
  }

  /// `User has credentials`
  String get credentialsExist {
    return Intl.message(
      'User has credentials',
      name: 'credentialsExist',
      desc: '',
      args: [],
    );
  }

  /// `File not found`
  String get fileNotFound {
    return Intl.message(
      'File not found',
      name: 'fileNotFound',
      desc: '',
      args: [],
    );
  }

  /// `No stats data`
  String get noStatsData {
    return Intl.message(
      'No stats data',
      name: 'noStatsData',
      desc: '',
      args: [],
    );
  }

  /// `Error in generating CSV file`
  String get errorInGeneratingCsvFile {
    return Intl.message(
      'Error in generating CSV file',
      name: 'errorInGeneratingCsvFile',
      desc: '',
      args: [],
    );
  }

  /// `CSV file is available for download`
  String get csvFileIsAvailableForDownload {
    return Intl.message(
      'CSV file is available for download',
      name: 'csvFileIsAvailableForDownload',
      desc: '',
      args: [],
    );
  }

  /// `Generate csv file from cases data`
  String get generateCsvFile {
    return Intl.message(
      'Generate csv file from cases data',
      name: 'generateCsvFile',
      desc: '',
      args: [],
    );
  }

  /// `processing..`
  String get processing {
    return Intl.message(
      'processing..',
      name: 'processing',
      desc: '',
      args: [],
    );
  }

  /// `File generated successfully`
  String get fileGeneratedSuccessfully {
    return Intl.message(
      'File generated successfully',
      name: 'fileGeneratedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Loading file`
  String get loadingFile {
    return Intl.message(
      'Loading file',
      name: 'loadingFile',
      desc: '',
      args: [],
    );
  }

  /// `Missing File`
  String get missingFile {
    return Intl.message(
      'Missing File',
      name: 'missingFile',
      desc: '',
      args: [],
    );
  }

  /// `Error in compressing media file`
  String get errorInCompressingMediaFile {
    return Intl.message(
      'Error in compressing media file',
      name: 'errorInCompressingMediaFile',
      desc: '',
      args: [],
    );
  }

  /// `Error in resizing media file`
  String get errorInResizingMediaFile {
    return Intl.message(
      'Error in resizing media file',
      name: 'errorInResizingMediaFile',
      desc: '',
      args: [],
    );
  }

  /// `No search results`
  String get noSearchResults {
    return Intl.message(
      'No search results',
      name: 'noSearchResults',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `begin`
  String get begin {
    return Intl.message(
      'begin',
      name: 'begin',
      desc: '',
      args: [],
    );
  }

  /// `An app for surgeons`
  String get appSubTitle {
    return Intl.message(
      'An app for surgeons',
      name: 'appSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Email`
  String get loginWithEmailButtonText {
    return Intl.message(
      'Continue with Email',
      name: 'loginWithEmailButtonText',
      desc: '',
      args: [],
    );
  }

  /// `By signing in, you agree to our terms and conditions`
  String get agreeSignInTermsAndConditions {
    return Intl.message(
      'By signing in, you agree to our terms and conditions',
      name: 'agreeSignInTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use &\nPrivacy Policy`
  String get termsOfServiceModalTitle {
    return Intl.message(
      r'Terms of Use &\nPrivacy Policy',
      name: 'termsOfServiceModalTitle',
      desc: '',
      args: [],
    );
  }

  /// `By signing in, you agree to our `
  String get loginWithEmailSubtitleText {
    return Intl.message(
      'By signing in, you agree to our ',
      name: 'loginWithEmailSubtitleText',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use and Privacy Policy`
  String get loginWithEmailTermsAndPrivacyPolicyText {
    return Intl.message(
      'Terms of Use and Privacy Policy',
      name: 'loginWithEmailTermsAndPrivacyPolicyText',
      desc: '',
      args: [],
    );
  }

  /// `Failed to sign out`
  String get signOutFailure {
    return Intl.message(
      'Failed to sign out',
      name: 'signOutFailure',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Switch Language`
  String get switchLanguage {
    return Intl.message(
      'Switch Language',
      name: 'switchLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Switch Theme`
  String get switchTheme {
    return Intl.message(
      'Switch Theme',
      name: 'switchTheme',
      desc: '',
      args: [],
    );
  }

  /// `Change Color`
  String get changeColor {
    return Intl.message(
      'Change Color',
      name: 'changeColor',
      desc: '',
      args: [],
    );
  }

  /// `Change Font`
  String get changeFont {
    return Intl.message(
      'Change Font',
      name: 'changeFont',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Theme Settings`
  String get themeSettings {
    return Intl.message(
      'Theme Settings',
      name: 'themeSettings',
      desc: '',
      args: [],
    );
  }

  /// `Database Settings`
  String get databaseSettings {
    return Intl.message(
      'Database Settings',
      name: 'databaseSettings',
      desc: '',
      args: [],
    );
  }

  /// `Support Data Settings`
  String get supportDataSettings {
    return Intl.message(
      'Support Data Settings',
      name: 'supportDataSettings',
      desc: '',
      args: [],
    );
  }

  /// `Import shared template`
  String get importSharedTemplate {
    return Intl.message(
      'Import shared template',
      name: 'importSharedTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Import from collection of templates made by other users of mycaselog`
  String get importSharedTemplateSubTitle {
    return Intl.message(
      'Import from collection of templates made by other users of mycaselog',
      name: 'importSharedTemplateSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create New Template`
  String get createTemplate {
    return Intl.message(
      'Create New Template',
      name: 'createTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Create a new template from scratch`
  String get createTemplateSubTitle {
    return Intl.message(
      'Create a new template from scratch',
      name: 'createTemplateSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Form has not been saved. Exit without saving?`
  String get unSavedFormWarning {
    return Intl.message(
      'Form has not been saved. Exit without saving?',
      name: 'unSavedFormWarning',
      desc: '',
      args: [],
    );
  }

  /// `Shared Templates`
  String get sharedTemplates {
    return Intl.message(
      'Shared Templates',
      name: 'sharedTemplates',
      desc: '',
      args: [],
    );
  }

  /// `Select a speciality`
  String get selectASpeciality {
    return Intl.message(
      'Select a speciality',
      name: 'selectASpeciality',
      desc: '',
      args: [],
    );
  }

  /// `No Description`
  String get noDescription {
    return Intl.message(
      'No Description',
      name: 'noDescription',
      desc: '',
      args: [],
    );
  }

  /// `Add Case`
  String get addCase {
    return Intl.message(
      'Add Case',
      name: 'addCase',
      desc: '',
      args: [],
    );
  }

  /// `No options`
  String get noOptions {
    return Intl.message(
      'No options',
      name: 'noOptions',
      desc: '',
      args: [],
    );
  }

  /// `Not implemented yet`
  String get notImplementedYet {
    return Intl.message(
      'Not implemented yet',
      name: 'notImplementedYet',
      desc: '',
      args: [],
    );
  }

  /// `Surgery Locations`
  String get surgeryLocationsTitle {
    return Intl.message(
      'Surgery Locations',
      name: 'surgeryLocationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Passcode`
  String get passcode {
    return Intl.message(
      'Passcode',
      name: 'passcode',
      desc: '',
      args: [],
    );
  }

  /// `continue`
  String get continueText {
    return Intl.message(
      'continue',
      name: 'continueText',
      desc: '',
      args: [],
    );
  }

  /// `Encryption key missing locally`
  String get encryptionKeyMissingLocally {
    return Intl.message(
      'Encryption key missing locally',
      name: 'encryptionKeyMissingLocally',
      desc: '',
      args: [],
    );
  }

  /// `Credentials are invalid`
  String get credentialsAreInvalid {
    return Intl.message(
      'Credentials are invalid',
      name: 'credentialsAreInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Retry upload`
  String get retryUpload {
    return Intl.message(
      'Retry upload',
      name: 'retryUpload',
      desc: '',
      args: [],
    );
  }

  /// `Remove Upload`
  String get stashUpload {
    return Intl.message(
      'Remove Upload',
      name: 'stashUpload',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get searchPlaceHolderText {
    return Intl.message(
      'search',
      name: 'searchPlaceHolderText',
      desc: '',
      args: [],
    );
  }

  /// `Go back`
  String get goBack {
    return Intl.message(
      'Go back',
      name: 'goBack',
      desc: '',
      args: [],
    );
  }

  /// `Local auth`
  String get localAuth {
    return Intl.message(
      'Local auth',
      name: 'localAuth',
      desc: '',
      args: [],
    );
  }

  /// `Enabled local authentication for sensitive data`
  String get localAuthSubTitle {
    return Intl.message(
      'Enabled local authentication for sensitive data',
      name: 'localAuthSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Note`
  String get addNote {
    return Intl.message(
      'Add Note',
      name: 'addNote',
      desc: '',
      args: [],
    );
  }

  /// `Edit Note`
  String get editNote {
    return Intl.message(
      'Edit Note',
      name: 'editNote',
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
