import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void gotoRegisterPage(){
    Get.toNamed('register');
  }

  void login(){
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if(validForm(email,password)){
        print('Formulario listo para hacer la peticion http');
    }
  }

  bool validForm(String email, String password){
    if(!GetUtils.isEmail(email)){
      Get.snackbar('Formulario invalido', "ingresa un email valido");
      return false;
    }
    if(email.isEmpty){
      Get.snackbar('Formulario invalido', "Debes ingresar un email");
      return false;
    }
    if(password.isEmpty){
      Get.snackbar('Formulario invalido', "Debes ingresar un email");
      return false;
    }
    return true;
  }
}