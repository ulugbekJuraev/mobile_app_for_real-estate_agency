import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/app_colors.dart';
import 'package:flutter_application_2/components/app_textStyle.dart';
import 'package:flutter_application_2/components/app_text_btn.dart';
import 'package:flutter_application_2/components/app_update_modal.dart';
import 'package:flutter_application_2/pages/home_page.dart';

class ItemModalContainer extends StatefulWidget {
  const ItemModalContainer({super.key});

  @override
  State<ItemModalContainer> createState() => _ItemModalContainerState();
}

class _ItemModalContainerState extends State<ItemModalContainer> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  Future<void> _delete(String productId) async {
    await _products.doc(productId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.priceValueColor,
        content: Text(
          "Объект удален!",
          style: AppTextStyle.titleTextStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    final id = args[0];
    final description = args[1];
    final district = args[2];
    final floors = args[3];
    final level = args[4];
    final phone = args[5];
    final price = args[6];
    final rentSell = args[7];
    final rooms = args[8];
    final type = args[9];
    final squere = args[10];
    final status = args[11];
    final rs = args[12];
    final img = args[13];

    var size = MediaQuery.of(context).size;
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: AppColors.whiteTextColor,
          borderRadius: BorderRadius.circular(16),
        ),
        height: size.height * 0.90,
        margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.height * 0.01,
        ),
        child: Column(
          children: [
            Expanded(
              child: DraggableScrollableSheet(
                initialChildSize: 1,
                builder: (context, scrollController) => SingleChildScrollView(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: size.height * 0.02),
                          padding: const EdgeInsets.all(16),
                          width: size.width * 1,
                          height: size.height * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.primeryTextColor,
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop),
                              image: NetworkImage(img),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Image(
                                        image: AssetImage(
                                            'assets/icons/Back.png')),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Text(
                                                  'Удалить объект?',
                                                  style: AppTextStyle
                                                      .titleTextStyle,
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Отмена'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      _delete(id);
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                               HomePage(),
                                                        ),
                                                      );
                                                    },
                                                    child: Text('Удалить'),
                                                  ),
                                                ],
                                              ));
                                   
                                   
                                   
                                    },
                                    child: const Image(
                                        image: AssetImage(
                                            'assets/icons/3dButton2.png')),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${rentSell == "[<'Rent'>]" ? 'Аренда' : 'Продажа'} ${type == "[<'House'>]" ? 'дома' : 'квартиры'} в Ташкенте',
                                    style: AppTextStyle.titleTextStyle.copyWith(
                                      color: AppColors.whiteTextColor,
                                    ),
                                  ),
                                  Text(
                                    district,
                                    style:
                                        AppTextStyle.filterTextStyle.copyWith(
                                      color: AppColors.whiteTextColor,
                                    ),
                                  ),
                                  Text(
                                    '$rooms/$level/$floors',
                                    style:
                                        AppTextStyle.filterTextStyle.copyWith(
                                      color: AppColors.whiteTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Информация объекта',
                            style: AppTextStyle.titleTextStyle,
                          ),
                        ),
                        const SizedBox(height: 10),
                        //status
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Статус:',
                              style: AppTextStyle.titleTextStyle,
                            ),
                            Text(
                              status == "[<'Active'>]"
                                  ? 'Активный'
                                  : 'Остановлено',
                              style: status == "[<'Active'>]"
                                  ? AppTextStyle.titleTextStyle.copyWith(
                                      color: AppColors.priceValueColor)
                                  : AppTextStyle.titleTextStyle.copyWith(
                                      color: const Color.fromARGB(
                                          255, 210, 147, 143),
                                    ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        //RENT SELL
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Процесс:',
                              style: AppTextStyle.titleTextStyle,
                            ),
                            Text(
                              rentSell == "[<'Sell'>]" ? "Продажа" : "Аренда",
                              style: AppTextStyle.titleTextStyle,
                            )
                          ],
                        ),

                        const SizedBox(height: 10),
                        //TYPE
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Тип объекта:',
                              style: AppTextStyle.titleTextStyle,
                            ),
                            Text(
                              type == "[<'House'>]" ? "Дом" : "Квартира",
                              style: AppTextStyle.titleTextStyle,
                            )
                          ],
                        ),

                        const SizedBox(height: 10),
                        //RS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Состояние:',
                              style: AppTextStyle.titleTextStyle,
                            ),
                            Text(
                              rs == "[<'Resale'>]"
                                  ? "Вторичка"
                                  : "Новая постройка",
                              style: AppTextStyle.titleTextStyle,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        //district
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Район:',
                              style: AppTextStyle.titleTextStyle,
                            ),
                            Text(
                              district,
                              style: AppTextStyle.titleTextStyle,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        //PRICE
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Цена:',
                              style: AppTextStyle.titleTextStyle,
                            ),
                            Text(
                              '\$$price',
                              style: AppTextStyle.titleTextStyle.copyWith(
                                color: AppColors.priceValueColor,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        //SQUERE
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Квадратура:',
                              style: AppTextStyle.titleTextStyle,
                            ),
                            Text(
                              '$squere ㎡',
                              style: AppTextStyle.titleTextStyle,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        //ROOMS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Кл. Комнат:',
                              style: AppTextStyle.titleTextStyle,
                            ),
                            Text(
                              rooms,
                              style: AppTextStyle.titleTextStyle,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        //LEVEL
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Этаж:',
                              style: AppTextStyle.titleTextStyle,
                            ),
                            Text(
                              level,
                              style: AppTextStyle.titleTextStyle,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        //FLOORS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Этажность:',
                              style: AppTextStyle.titleTextStyle,
                            ),
                            Text(
                              floors,
                              style: AppTextStyle.titleTextStyle,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),

                        //PHONE
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Телефон:',
                              style: AppTextStyle.titleTextStyle,
                            ),
                            Text(
                              phone,
                              style: AppTextStyle.titleTextStyle,
                            )
                          ],
                        ),

                        const SizedBox(height: 20),

                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Описание',
                            style: AppTextStyle.titleTextStyle,
                          ),
                        ),

                        const SizedBox(height: 10),
                        //descripion
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xFFE6E8EC),
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          width: size.width * 0.90,
                          child: Text(
                            description,
                            style: AppTextStyle.filterTextStyle,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextbtnCancel(
                              func: () {
                                Navigator.of(context).pop();
                              },
                              text: 'Отмена',
                            ),
                            AppTextbtn(
                              func: () {
                                showModalBottomSheet(
                                    routeSettings: RouteSettings(arguments: [
                                      id,
                                      description,
                                      district,
                                      floors,
                                      level,
                                      phone,
                                      price,
                                      rentSell,
                                      rooms,
                                      type,
                                      squere,
                                      status,
                                      rs,
                                    ]),
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) =>
                                        const ApUpdateModalAddContainer(),
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true);
                              },
                              text: "Редактировать",
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
