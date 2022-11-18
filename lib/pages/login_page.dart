import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/app_colors.dart';
import 'package:flutter_application_2/components/app_description_btn.dart';
import 'package:flutter_application_2/components/app_textStyle.dart';
import 'package:flutter_application_2/components/app_text_btn.dart';
import 'package:flutter_application_2/pages/forgot_page.dart';
import 'package:flutter_application_2/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({
    super.key,
    required this.showRegisterPage,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String text = '';

  String errorMessage(FirebaseAuthException e) {
    if (e.message.toString() == "Given String is empty or null") {
      setState(() {
        text = "Заполните все поля!";
      });
    } else if (e.message.toString() ==
        "The password is invalid or the user does not have a password.") {
      setState(() {
        text = "Введите правильную почту или пароль";
      });
    } else if (e.message.toString() ==
        "The email address is badly formatted.") {
      setState(() {
        text = "Неверный формат почты!";
      });
    } else {
      setState(() {
        text = "Что то пошло не так!";
      });
    }

    return text;
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          )
          .then((_) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              )));
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

  //The password is invalid or the user does not have a password
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                'Добро пожаловать!',
                style: AppTextStyle.titleTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Войдите через почту и пароль',
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ForgorPassPage();
                      },
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Забыли пароль? ',
                        style: AppTextStyle.filterTextStyle.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      TextSpan(
                        text: ' Восстановить',
                        style: AppTextStyle.filterTextStyle.copyWith(
                          color: AppColors.priceValueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              LoginTextbtn(
                func: signIn,
                text: 'Войти',
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: widget.showRegisterPage,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Нет аккаунта? ',
                        style: AppTextStyle.filterTextStyle.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      TextSpan(
                        text: ' Регистрация аккаунта',
                        style: AppTextStyle.filterTextStyle.copyWith(
                          color: AppColors.priceValueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
