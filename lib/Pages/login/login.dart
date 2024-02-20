import 'package:deliverapp/Pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{

  LoginController controller = Get.put(LoginController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _boxCover(context),
          SingleChildScrollView(child: Column(
              children: [
                _imageAnimation(),

                _boxForm(context)

              ]))
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
          child: _textDontHaveAccount()
      ),
    );
  }

  //metodo para cargar la imagen
  Widget _imageCover() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 15),
        child: Image.asset(
          'assets/images/Delivery.png',
          height: 140,
        ),
      ),
    );
  }

  Widget _textAppName() {
    return Text(
      "Delivery App",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 28,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _boxCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.55,
      color: Colors.red,
      child: Align(
        alignment: Alignment.topCenter,
       child: Padding(
         padding: EdgeInsets.only(top: 50),
          child: _textAppName(),
        )

      ),
    );
  }


Widget _imageAnimation() {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(top: 10, bottom: 10),
    child: Lottie.asset('assets/json/Animation - 1702301391273.json'),
  );
}

// formulario de login
Widget _boxForm(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.40,
    margin: EdgeInsets.only(
      top: 1,
      left: 50,
      right: 50,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
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
        const SizedBox(height: 10),
        _textLogin(),
        _textPassword(),
        _buttonLogin(),
      ],
    ),

  );
}

Widget _textLogin() {
  return TextField(
    controller: controller.emailController,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: 'Correo Electronico',
      prefixIcon: Icon(Icons.email),
    ),
  );
}

Widget _textPassword() {
  return TextField(
    controller: controller.passwordController,
    obscureText: true,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: 'Contraseña',
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

Widget _buttonLogin() {
  return Container(
    margin: EdgeInsets.only(top: 15),
    child: ElevatedButton(
      style:
          ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 15)),
      onPressed: controller.login,
      child: Text('Login'),

    ),
  );
}

  Widget _textDontHaveAccount (){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No tienes cuenta?'),
        SizedBox(width: 10),
        GestureDetector(
          child: Text('Registrate', style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,

          ),
          ),
          onTap: (){
            return controller.gotoRegisterPage();
          },
        )
      ],
    );
  }
}

