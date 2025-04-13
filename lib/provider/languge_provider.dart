import 'package:flutter/material.dart';

class LangugeProvider extends ChangeNotifier{
    String currentLocal= "en";

  void changeLanguge(String newLocal){
    if(currentLocal==newLocal){
      return;
    }
        currentLocal=newLocal;
        notifyListeners();
  }
}