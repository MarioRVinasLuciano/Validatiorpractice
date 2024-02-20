import 'package:deliverapp/Pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _background(context)
                ],
              ),
            )

          ],
        )

    );
  }

  Widget _background(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery
          .of(context)
          .size
          .height * 1,
      color: Colors.red,

      child: Align(

        alignment: Alignment.topCenter,
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 120),
                child: Icon(Icons.add, size: 80),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: _BoxForm(context),
              ),
            ]

        ),


      ),
    );
  }

  Widget _BoxForm(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.55,
      margin: EdgeInsets.only(
        top: 1,
        left: 50,
        right: 50,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 15,
            offset: Offset(0, 0.75),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _textYourInfo(),
          const SizedBox(height: 30),
          _textemail(),
          _textName(),
          _textLastName(),
          _textPassword(),
          _ConfirmtextPassword(),
          _buttonLogin()

        ],
      ),
    );
  }


  Widget _buttonLogin() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: ElevatedButton(
        style:
        ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 15)),
        onPressed: controller.register,
        child: Text('Registrar'),

      ),
    );
  }


  Widget _textemail() {
    return TextField(
      controller: controller.EmailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        prefixIcon: Icon(Icons.email),
      ),
    );
  }


  Widget _textName() {
    return TextField(
      controller: controller.NameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: 'Nombre',
        prefixIcon: Icon(Icons.accessibility),
      ),
    );
  }

  Widget _textLastName() {
    return TextField(
      controller: controller.LastNameController,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: 'Apellido',
        prefixIcon: Icon(Icons.password),
      ),
    );
  }


  Widget _textPassword() {
    return TextField(
      controller: controller.PasswordController,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: 'Contraseña',
        prefixIcon: Icon(Icons.password),
      ),
    );
  }

  Widget _ConfirmtextPassword() {
    return TextField(
      controller: controller.PasswordControllerConfirm,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: 'Confirmar contraseña',
        prefixIcon: Icon(Icons.password),
      ),
    );
  }


  Widget _textYourInfo() {
    return Text(
      'Ingresa tus datos',
      style: TextStyle(fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

}