import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './services/snack_bar.dart';
import './login.dart';
import './main.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  bool isHiddenPassword = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  TextEditingController passwordTextRepeatInputController =
  TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();
    passwordTextRepeatInputController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> signUp() async {
    final navigator = Navigator.of(context);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    if (passwordTextInputController.text !=
        passwordTextRepeatInputController.text) {
      SnackBarService.showSnackBar(
        context,
        'Пароли должны совпадать',
        true,
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextInputController.text.trim(),
        password: passwordTextInputController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // print(e.code);

      if (e.code == 'email-already-in-use') {
        SnackBarService.showSnackBar(
          context,
          'Такой Email уже используется, повторите попытку с использованием другого Email',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
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
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container (
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
                              'Регистрация',
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
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            controller: emailTextInputController,
                            validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                              ? 'Введите правильный Email'
                              : null,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0x20F5F5F5),
                              border: OutlineInputBorder(
                                borderSide:  BorderSide(
                                  color: Colors.black45,
                                ),
                              ),
                              hintText: 'Введите Email',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                          autocorrect: false,
                          controller: passwordTextInputController,
                          obscureText: isHiddenPassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => value != null && value.length < 6
                              ? 'Минимум 6 символов'
                              : null,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0x20F5F5F5),
                            border: const OutlineInputBorder(
                              borderSide:  BorderSide(
                                color: Colors.black45,
                              ),
                            ),
                            hintText: 'Введите пароль',
                            hintStyle: TextStyle(
                              color: Colors.white,
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
                        TextFormField(
                          autocorrect: false,
                          controller: passwordTextRepeatInputController,
                          obscureText: isHiddenPassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => value != null && value.length < 6
                              ? 'Минимум 6 символов'
                              : null,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0x20F5F5F5),
                            border: const OutlineInputBorder(
                              borderSide:  BorderSide(
                                color: Colors.black45,
                              ),
                            ),
                            hintText: 'Введите пароль еще раз',
                            hintStyle: TextStyle(
                              color: Colors.white,
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0x880000).withOpacity(0.8)),
                          onPressed: signUp,
                          child: const Center(child: Text('Зарегестрироваться', style: TextStyle( color: Colors.white, fontSize: 20, fontFamily: 'Roboto'))),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const Login();
                              }));
                          },
                          child: const Text(
                            'Войти',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),],)),],
            ),
          ),
        )
      ),
    );
  }
}