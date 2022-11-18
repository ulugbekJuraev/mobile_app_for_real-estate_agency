import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/components/app_colors.dart';
import 'package:flutter_application_2/components/app_description_btn.dart';
import 'package:flutter_application_2/components/app_textStyle.dart';
import 'package:flutter_application_2/components/app_text_btn.dart';
import 'package:flutter_application_2/pages/auth_page.dart';
import 'package:flutter_application_2/pages/login_page.dart';

class ForgorPassPage extends StatefulWidget {
  const ForgorPassPage({super.key});

  @override
  State<ForgorPassPage> createState() => _ForgorPassPageState();
}

class _ForgorPassPageState extends State<ForgorPassPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  String text = '';

  String errorMessage(FirebaseAuthException e) {
    if (e.message.toString() == "Given String is empty or null") {
      setState(() {
        text = "Укажите почту!";
      });
    } else if (e.message.toString() ==
        "There is no user record corresponding to this identifier. The user may have been deleted.") {
      setState(() {
        text = "Введите правильную почту. Почта не найдена";
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

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text(
                'Ссылка на восстановление отправлена, проверьте почту! Проверьте папки "Входящие" и "Спам"...'),
            actions: [
              MaterialButton(
                color: AppColors.primeryTextColor,
                disabledColor: AppColors.primeryTextColor,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthPage(),
                    ),
                  );
                },
                child: const Text("Понятно"),
              ),
            ],
          );
        },
      );
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
                'Восстановить пароль!',
                style: AppTextStyle.titleTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Укажите почту для получения ссылки',
                style: AppTextStyle.priceTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 50,
              ),
              LoginTextField(
                controller: emailController,
                hintText: 'Почта',
                text: 'Reset',
              ),
              const SizedBox(
                height: 20,
              ),
              LoginTextbtn(
                func: passwordReset,
                text: 'Отправить ссылку',
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
                        return const AuthPage();
                      },
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Вспомнили пароль? ',
                        style: AppTextStyle.filterTextStyle.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      TextSpan(
                        text: ' Войти через почту и пароль',
                        style: AppTextStyle.filterTextStyle.copyWith(
                          color: AppColors.priceValueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
