import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/components/app_colors.dart';
import 'package:flutter_application_2/components/app_modal_add.dart';
import 'package:flutter_application_2/components/app_textStyle.dart';
import 'package:flutter_application_2/components/app_text_btn.dart';
import 'package:flutter_application_2/pages/auth_page.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/pages/search_page.dart';
import 'package:flutter_application_2/widgets/list_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    user.emailVerified;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (user.emailVerified) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(
              width: size.width * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      showModalBottomSheet(
                          enableDrag: false,
                          context: context,
                          builder: (context) => const AppModalAddContainer(),
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true);
                    },
                    icon: Icon(
                      Icons.add,
                      color: AppColors.primeryTextColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          enableDrag: false,
                          context: context,
                          builder: (context) => const UserModalAddContainer(),
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.primeryTextColor,
                      radius: 20,
                      child: const Icon(
                        Icons.account_box,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchPage()),
                      );
                    },
                    icon: Icon(
                      Icons.search,
                      color: AppColors.primeryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],

          backgroundColor: AppColors.whiteTextColor,
          // title: GestureDetector(
          //   onTap: () {
          //     showDialog(
          //         context: context,
          //         builder: (context) => AlertDialog(
          //               title: Text(
          //                 'Выйти из аккаунта?',
          //                 style: AppTextStyle.titleTextStyle,
          //               ),
          //               actions: [
          //                 TextButton(
          //                   onPressed: () {
          //                     Navigator.of(context).pop();
          //                   },
          //                   child: const Text('Отмена'),
          //                 ),
          //                 TextButton(
          //                   onPressed: () {
          //                     FirebaseAuth.instance
          //                         .signOut()
          //                         .then((_) => Navigator.push(
          //                             context,
          //                             MaterialPageRoute(
          //                               builder: (context) => const AuthPage(),
          //                             )));
          //                     Navigator.of(context).pop();

          //                     // Navigator.push(
          //                     //   context,
          //                     //   MaterialPageRoute(
          //                     //     builder: (context) => const HomePage(),
          //                     //   ),
          //                     // );
          //                   },
          //                   child: const Text('Выйти'),
          //                 ),
          //               ],
          //             ));
          //   },
          //   child: Text(
          //     '${user.email}',
          //     // 'Все объявления',
          //     style: AppTextStyle.titleTextStyle,
          //   ),
          // ),

          centerTitle: true,

          elevation: 3,
          shadowColor: AppColors.whiteTextColor,
        ),
        body: Column(
          children: const [
            ListViewWidget(),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.80,
                child: Text(
                  'Пожалуйста подтвердите почту для получения доступа к контенту. Проверьте папку "Входящие" а так же папку "Спам"',
                  style: AppTextStyle.priceTextStyle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: size.width * 0.80,
                child: Text(
                  'Затем авторизуйтесь через ваш логин и пароль, на странице "Авторизации"',
                  style: AppTextStyle.priceTextStyle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              LoginTextbtn(
                  func: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthPage(),
                        ));
                  },
                  text: 'Страница авторизации'),
            ],
          ),
        ),
      );
    }
  }
}
