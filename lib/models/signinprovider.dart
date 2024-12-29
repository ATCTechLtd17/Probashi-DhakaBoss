import 'package:flutter/material.dart';

class Signinprovider with ChangeNotifier {
  String _countryCode = '+880';
  String _phoneNumber = '';
  String _password = '';
  bool _isPhoneStage = true;
  bool isAgreed = false;

  String get countryCode => _countryCode;
  String get phoneNumber => _phoneNumber;
  String get password => _password;
  bool get isPhoneStage => _isPhoneStage;

  void setCountryCode(String code){
    _countryCode = code;
    notifyListeners();
      }
  void setPhoneNumber(String code){
    _phoneNumber = code;
    notifyListeners();
      }
  void setPasssword(String code){
    _password = code;
    notifyListeners();
      }
      void setAgreed(bool agreed){
        isAgreed = agreed;
        notifyListeners();
      }
  void nextStage(){
    _isPhoneStage = false;
    notifyListeners();
      }
  void resetStage(){
    _isPhoneStage = true;
    notifyListeners();
      }



}