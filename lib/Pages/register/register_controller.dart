import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterController extends GetxController {

  TextEditingController EmailController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController PasswordControllerConfirm = TextEditingController();


  void gotoRegisterPage(){
    Get.toNamed('register');
  }

  void register(){
    String email = EmailController.text.trim();
    String name = NameController.text.trim();
    String lastname = LastNameController.text.trim();
    String password = PasswordController.text.trim();
    String passwordcf = PasswordControllerConfirm.text.trim();

    if(validForm(email,name,lastname,password,passwordcf)){
      print('Formulario listo para hacer la peticion http');
    }

}

 bool validForm(String email, String name, String lastname, String password, String passwordcf){
   if(email.isEmpty && name.isEmpty && lastname.isEmpty && password.isEmpty && passwordcf.isEmpty){
     Get.snackbar("Formulario Vacio", "Ingrese los datos en cada uno de los campos");
     return false;
   }


    if(!GetUtils.isEmail(email)){
     Get.snackbar('Formulario invalido', "ingresa un email valido");
     return false;
   }
   if(email.isEmpty){
     Get.snackbar('Formulario invalido', "Debes ingresar un email");
     return false;
   }
   if(name.isEmpty){
     Get.snackbar('Formulario invalido', "Debes ingresar un nombre valido");
     return false;
   }
   if(lastname.isEmpty){
     Get.snackbar('Formulario invalido', "Debes ingresar un apellido valido");
     return false;
   }
   if(password.isEmpty){
     Get.snackbar('Formulario invalido', "ingresa un password");
     return false;
   }
   if(passwordcf.isEmpty){
     Get.snackbar('Formulario invalido', "ingresa la confirmacion de tu password");
     return false;
   }
   if(passwordcf != password){
     Get.snackbar('Formulario invalido', "ingresa passwords iguales");
     return false;
   }
   return true;
  }
 }