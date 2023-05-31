import 'package:flutter/material.dart';
import './main.dart';
import './profile.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './services/snack_bar.dart';
import './signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isHiddenPassword = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> login() async {
    final navigator = Navigator.of(context);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextInputController.text.trim(),
        password: passwordTextInputController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        SnackBarService.showSnackBar(
          context,
          'Неправильный email или пароль. Повторите попытку или зарегистрируйтесь',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
        return;
      }
    }

    navigator.pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/img/back-main.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container (
            padding: EdgeInsets.only(left: 2, top: 54, right: 10, bottom: 10),
            child: Column (
              children: [
                Row(
                  children: [
                    TextButton(onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Home();
                          }));},
                      child: Text(
                        'ЭНЕРГИЯ',
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            letterSpacing: 3.0
                        ),
                        textAlign: TextAlign.left,
                      ),),],
                ),

                Container(
                  margin: EdgeInsets.only(top: 40, bottom: 20),
                  child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Вход',
                          style: TextStyle(
                            fontSize: 27,
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: formKey,
                     child: Column(
                      children: [
                      TextFormField(
                        decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0x20F5F5F5),
                        enabledBorder: OutlineInputBorder(
                        borderSide:  BorderSide(
                        color: Colors.black45,
                        ),),
                        hintText: 'Введите Email',
                        hintStyle: TextStyle(
                        color: Colors.white70,
                        ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    controller: emailTextInputController,
                    validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                    ? 'Введите правильный Email'
                    : null,
                    style: TextStyle(
                    color: Colors.white,
                  ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                autocorrect: false,
                controller: passwordTextInputController,
                obscureText: isHiddenPassword,
                validator: (value) => value != null && value.length < 6
                    ? 'Минимум 6 символов'
                    : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0x20F5F5F5),
                  enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(
                      color: Colors.black45,
                    ),),
                  hintText: 'Введите пароль',
                  hintStyle: TextStyle(
                    color: Colors.white70,
                  ),
                  suffix: InkWell(
                    onTap: togglePasswordView,
                    child: Icon(
                      isHiddenPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
                        TextButton(
                          onPressed:
                            login,
                            child: const Center(
                              child:
                              Text('Войти', style: TextStyle( color: Colors.white, fontSize: 20, fontFamily: 'Roboto'))
                          ),
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0x880000).withOpacity(0.8)))),
                          Container(
                          margin: EdgeInsets.only(top: 40, bottom: 20),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                          onPressed: () {
                          Navigator.push(
                          context,
                            MaterialPageRoute(builder: (context) {
                          return SignUp();
                          }));
                      },
                          child: const Text(
                            'Регистрация',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              ],
          ),),),
      ],
          ),),)
    );
  }
}