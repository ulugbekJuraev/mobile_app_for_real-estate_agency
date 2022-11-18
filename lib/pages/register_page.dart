import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/app_colors.dart';
import 'package:flutter_application_2/components/app_description_btn.dart';
import 'package:flutter_application_2/components/app_textStyle.dart';

import 'package:flutter_application_2/components/app_text_and_textFielfd.dart';
import 'package:flutter_application_2/components/app_text_btn.dart';
import 'package:flutter_application_2/pages/home_page.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    super.key,
    required this.showLoginPage,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatpasswordController = TextEditingController();

  String text = '';

  String errorMessage(FirebaseAuthException e) {
    if (e.message.toString() == "The email address is badly formatted.") {
      setState(() {
        text = "Неверный формат почты!";
      });
    } else if (e.message.toString() == "Password should be at least 6 characters") {
      setState(() {
        text = "Пароль должен состоять не менее, чем из 6 символов";
      });
    } else {
      setState(() {
        text = "Что то пошло не так!";
      });
    }

    return text;
  }

  bool passwordConfirmed() {
    if (passwordController.text.trim() ==
            repeatpasswordController.text.trim() &&
        emailController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future signUp() async {
    try {
      if (passwordConfirmed() == true) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        await FirebaseAuth.instance.currentUser?.sendEmailVerification().then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              ),
            );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.priceValueColor,
          content: Text(
            // e.message.toString() == "Given String is empty or null"? "Заполните поля!" : "Что то пошло не так!",
            errorMessage(e),
            // e.message.toString(),
            style: AppTextStyle.titleTextStyle,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    repeatpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: size.width * 1,
          height: size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Регистрация акканута!',
                style: AppTextStyle.titleTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Создайте аккаунт чтобы продолжить',
                style: AppTextStyle.priceTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              LoginTextField(
                controller: emailController,
                hintText: 'Почта',
                text: 'Login',
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordTextField(
                controller: passwordController,
                hintText: 'Пароль',
                text: 'Password',
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordTextField(
                controller: repeatpasswordController,
                hintText: 'Повторите пароль',
                text: 'Repeat password',
              ),
              const SizedBox(
                height: 20,
              ),
              LoginTextbtn(
                func: signUp,
                text: 'Создать',
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: widget.showLoginPage,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Есть аккаунт? ',
                        style: AppTextStyle.filterTextStyle.copyWith(
                          color: Colors.grey.shade600,
                        )),
                    TextSpan(
                        text: ' Войти через почту и пароль',
                        style: AppTextStyle.filterTextStyle.copyWith(
                          color: AppColors.priceValueColor,
                        )),
                  ]))),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
