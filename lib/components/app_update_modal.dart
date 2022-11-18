import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/app_colors.dart';
import 'package:flutter_application_2/components/app_textStyle.dart';
import 'package:flutter_application_2/components/app_text_and_textFielfd.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'app_description_btn.dart';
import 'app_text_btn.dart';

class ApUpdateModalAddContainer extends StatefulWidget {
  const ApUpdateModalAddContainer({super.key});

  @override
  State<ApUpdateModalAddContainer> createState() =>
      _ApUpdateModalAddContainerState();
}

class _ApUpdateModalAddContainerState extends State<ApUpdateModalAddContainer> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  final TextEditingController _pricecontroller = TextEditingController();
  final TextEditingController _squercontroller = TextEditingController();
  final TextEditingController _roomscontroller = TextEditingController();
  final TextEditingController _floorScontroller = TextEditingController();
  final TextEditingController _levelcontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _descriptioncontroller = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _statusTextController = TextEditingController();
  final TextEditingController _rentSellTextController = TextEditingController();
  final TextEditingController _typeTextController = TextEditingController();
  final TextEditingController _oldOrNewTextController = TextEditingController();

  String selectedTextValue = '';
  String statusSelectedTextValue = '';
  String rentSellSelectedTextValue = '';
  String typeSelectedTextValue = '';
  String oldOrNewSelectedTextValue = '';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;

    setState(() {
      if (args.isNotEmpty) {
        if (_pricecontroller.text.isEmpty) {
          _pricecontroller.text = args[6];
        } else if (_pricecontroller.text.isNotEmpty) {
          _pricecontroller.text = _pricecontroller.text;
        }
        if (_squercontroller.text.isEmpty) {
          _squercontroller.text = args[10];
        } else if (_squercontroller.text.isNotEmpty) {
          _squercontroller.text = _squercontroller.text;
        }

        if (_roomscontroller.text.isEmpty) {
          _roomscontroller.text = args[8];
        } else if (_roomscontroller.text.isNotEmpty) {
          _roomscontroller.text = _roomscontroller.text;
        }
        if (_floorScontroller.text.isEmpty) {
          _floorScontroller.text = args[3];
        } else if (_floorScontroller.text.isNotEmpty) {
          _floorScontroller.text = _floorScontroller.text;
        }
        if (_levelcontroller.text.isEmpty) {
          _levelcontroller.text = args[4];
        } else if (_levelcontroller.text.isNotEmpty) {
          _levelcontroller.text = _levelcontroller.text;
        }

        if (_phonecontroller.text.isEmpty) {
          _phonecontroller.text = args[5];
        } else if (_phonecontroller.text.isNotEmpty) {
          _phonecontroller.text = _phonecontroller.text;
        }

        if (_descriptioncontroller.text.isEmpty) {
          _descriptioncontroller.text = args[1];
        } else if (_descriptioncontroller.text.isNotEmpty) {
          _descriptioncontroller.text = _descriptioncontroller.text;
        }

        // _phonecontroller.text = args[5];
        // _districtController.text = args[2];
        // _floorScontroller.text = args[3];
        // _levelcontroller.text = args[4];
        // _pricecontroller.text = args[6];
        // _squercontroller.text = args[10];
        // _roomscontroller.text = args[8];
      }
    });

    ////////////////////
    final List<String> items = [
      'Алмазарский рн',
      'Бектемирский рн',
      'Мирабадский рн',
      'Мирзо-Улугбекский рн',
      'Сергелийский рн',
      'Учтепинский рн',
      'Яшнабадский рн',
      'Чиланзарский рн',
      'Шайхантахурский рн',
      'Юнусабадский рн',
      'Яккасарайский рн',
      'Янги-хаятский рн',
    ];
    final List<String> statuses = [
      'Активный',
      'Остановлено',
    ];
    final List<String> rentSell = [
      'Аренда',
      'Продажа',
    ];
    final List<String> type = [
      'Квартира',
      'Дом',
    ];
    final List<String> oldOrNew = [
      'Новая постройка',
      'Вторичка',
    ];

    String? selectedValue;
    String? statusSelectedValue;
    String? rentSellSelectedValue;
    String? typeSelectedValue;
    String? oldOrNewSelectedValue;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 40),
                Text(
                  'Обновление объекта',
                  style: AppTextStyle.titleTextStyle,
                ),
                IconButton(
                  iconSize: 24,
                  splashRadius: 20,
                  // color: AppColors.priceValueColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ],
            ),
            Expanded(
              child: DraggableScrollableSheet(
                initialChildSize: 1,
                builder: (context, scrollController) => SingleChildScrollView(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Icon(
                                    //   Icons.list,
                                    //   size: 16,
                                    //   color: Colors.yellow,
                                    // ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                          _statusTextController.text == ''
                                              ? args[11] == "[<'Active'>]"
                                                  ? "Активный"
                                                  : "Остановлено"
                                              : _statusTextController.text,
                                          style: AppTextStyle.filterTextStyle
                                              .copyWith(
                                                  color:
                                                      AppColors.whiteTextColor)
                                          // overflow: TextOverflow.ellipsis,
                                          ),
                                    ),
                                  ],
                                ),
                                items: statuses
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: statusSelectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    statusSelectedValue = value as String;
                                    statusSelectedTextValue =
                                        statusSelectedValue.toString();

                                    _statusTextController.text =
                                        statusSelectedValue.toString();

                                    print(_statusTextController);
                                    print(statusSelectedTextValue);
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                ),
                                iconSize: 14,
                                iconEnabledColor: AppColors.whiteTextColor,
                                iconDisabledColor: AppColors.priceValueColor,
                                buttonHeight: 50,
                                buttonWidth: 200,
                                buttonPadding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  // border: Border.all(
                                  //   color: Colors.white
                                  // ),
                                  color: AppColors.primeryTextColor,
                                ),
                                // buttonElevation: 2,
                                itemHeight: 40,
                                itemPadding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                dropdownMaxHeight: 200,
                                dropdownWidth: 200,
                                dropdownPadding: null,
                                dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: AppColors.whiteTextColor),
                                dropdownElevation: 1,
                                scrollbarRadius: const Radius.circular(40),
                                scrollbarThickness: 6,
                                scrollbarAlwaysShow: true,
                                offset: const Offset(0, 0),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 200,
                              height: 20,
                              child: TextField(
                                style: AppTextStyle.filterTextStyle,
                                textAlign: TextAlign.center,
                                enabled: false,
                                controller: _statusTextController,
                                decoration: const InputDecoration(
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(

                                          // _statusTextController.text == ''
                                          //   ? args[11] == "[<'Active'>]"
                                          //       ? "Активный"
                                          //       : "Остановлено"
                                          //   : _statusTextController.text,

                                          _rentSellTextController.text == ''
                                              ? args[7] == "[<'Rent'>]"
                                                  ? "Аренда"
                                                  : "Продажа"
                                              : _rentSellTextController.text,
                                          style: AppTextStyle.filterTextStyle
                                              .copyWith(
                                                  color:
                                                      AppColors.whiteTextColor)
                                          // overflow: TextOverflow.ellipsis,
                                          ),
                                    ),
                                  ],
                                ),
                                items: rentSell
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: rentSellSelectedValue,
                                onChanged: (value) {
                                  //         setState(() {
                                  //   statusSelectedValue = value as String;
                                  //   statusSelectedTextValue =
                                  //       statusSelectedValue.toString();

                                  //   _statusTextController.text =
                                  //       statusSelectedValue.toString();

                                  //   print(_statusTextController);
                                  //   print(statusSelectedTextValue);
                                  // });

                                  setState(() {
                                    rentSellSelectedValue = value as String;
                                    rentSellSelectedTextValue =
                                        rentSellSelectedValue.toString();

                                    _rentSellTextController.text =
                                        rentSellSelectedValue.toString();
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                ),
                                iconSize: 14,
                                iconEnabledColor: AppColors.whiteTextColor,
                                iconDisabledColor: AppColors.priceValueColor,
                                buttonHeight: 50,
                                buttonWidth: 200,
                                buttonPadding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  // border: Border.all(
                                  //   color: Colors.white
                                  // ),
                                  color: AppColors.primeryTextColor,
                                ),
                                // buttonElevation: 2,
                                itemHeight: 40,
                                itemPadding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                dropdownMaxHeight: 200,
                                dropdownWidth: 200,
                                dropdownPadding: null,
                                dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: AppColors.whiteTextColor),
                                dropdownElevation: 1,
                                scrollbarRadius: const Radius.circular(40),
                                scrollbarThickness: 6,
                                scrollbarAlwaysShow: true,
                                offset: const Offset(0, 0),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 200,
                              height: 20,
                              child: TextField(
                                style: AppTextStyle.filterTextStyle,
                                textAlign: TextAlign.center,
                                enabled: false,
                                controller: _rentSellTextController,
                                decoration: const InputDecoration(
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Text(selectedTextValue,
                            //     style: AppTextStyle.filterTextStyle),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Icon(
                                    //   Icons.list,
                                    //   size: 16,
                                    //   color: Colors.yellow,
                                    // ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                          _typeTextController.text == ''
                                              ? args[9] == "[<'Apartment'>]"
                                                  ? "Квартира"
                                                  : "Дом"
                                              : _typeTextController.text,
                                          style: AppTextStyle.filterTextStyle
                                              .copyWith(
                                                  color:
                                                      AppColors.whiteTextColor)
                                          // overflow: TextOverflow.ellipsis,
                                          ),
                                    ),
                                  ],
                                ),
                                items: type
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: typeSelectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    typeSelectedValue = value as String;
                                    typeSelectedTextValue =
                                        typeSelectedValue.toString();

                                    _typeTextController.text =
                                        typeSelectedTextValue.toString();

                                    print(_typeTextController.text);
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                ),
                                iconSize: 14,
                                iconEnabledColor: AppColors.whiteTextColor,
                                iconDisabledColor: AppColors.priceValueColor,
                                buttonHeight: 50,
                                buttonWidth: 200,
                                buttonPadding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  // border: Border.all(
                                  //   color: Colors.white
                                  // ),
                                  color: AppColors.primeryTextColor,
                                ),
                                // buttonElevation: 2,
                                itemHeight: 40,
                                itemPadding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                dropdownMaxHeight: 200,
                                dropdownWidth: 200,
                                dropdownPadding: null,
                                dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: AppColors.whiteTextColor),
                                dropdownElevation: 1,
                                scrollbarRadius: const Radius.circular(40),
                                scrollbarThickness: 6,
                                scrollbarAlwaysShow: true,
                                offset: const Offset(0, 0),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 200,
                              height: 20,
                              child: TextField(
                                style: AppTextStyle.filterTextStyle,
                                textAlign: TextAlign.center,
                                enabled: false,
                                controller: _typeTextController,
                                decoration: const InputDecoration(
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Text(selectedTextValue,
                            //     style: AppTextStyle.filterTextStyle),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Icon(
                                    //   Icons.list,
                                    //   size: 16,
                                    //   color: Colors.yellow,
                                    // ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                          _oldOrNewTextController.text == ''
                                              ? args[12] == "[<'New B'>]"
                                                  ? "Новая постройка"
                                                  : "Вторичка"
                                              : _oldOrNewTextController.text,
                                          style: AppTextStyle.filterTextStyle
                                              .copyWith(
                                                  color:
                                                      AppColors.whiteTextColor)
                                          // overflow: TextOverflow.ellipsis,
                                          ),
                                    ),
                                  ],
                                ),
                                items: oldOrNew
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: oldOrNewSelectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    oldOrNewSelectedValue = value as String;
                                    oldOrNewSelectedTextValue =
                                        oldOrNewSelectedValue.toString();

                                    _oldOrNewTextController.text =
                                        oldOrNewSelectedValue.toString();

                                    print(_oldOrNewTextController.text);
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                ),
                                iconSize: 14,
                                iconEnabledColor: AppColors.whiteTextColor,
                                iconDisabledColor: AppColors.priceValueColor,
                                buttonHeight: 50,
                                buttonWidth: 200,
                                buttonPadding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  // border: Border.all(
                                  //   color: Colors.white
                                  // ),
                                  color: AppColors.primeryTextColor,
                                ),
                                // buttonElevation: 2,
                                itemHeight: 40,
                                itemPadding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                dropdownMaxHeight: 200,
                                dropdownWidth: 200,
                                dropdownPadding: null,
                                dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: AppColors.whiteTextColor),
                                dropdownElevation: 1,
                                scrollbarRadius: const Radius.circular(40),
                                scrollbarThickness: 6,
                                scrollbarAlwaysShow: true,
                                offset: const Offset(0, 0),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 200,
                              height: 20,
                              child: TextField(
                                style: AppTextStyle.filterTextStyle,
                                textAlign: TextAlign.center,
                                enabled: false,
                                controller: _oldOrNewTextController,
                                decoration: const InputDecoration(
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Text(selectedTextValue,
                            //     style: AppTextStyle.filterTextStyle),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Icon(
                                    //   Icons.list,
                                    //   size: 16,
                                    //   color: Colors.yellow,
                                    // ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                          _districtController.text == ''
                                              ? args[2]
                                              : _districtController.text,
                                          style: AppTextStyle.filterTextStyle
                                              .copyWith(
                                                  color:
                                                      AppColors.whiteTextColor)
                                          // overflow: TextOverflow.ellipsis,
                                          ),
                                    ),
                                  ],
                                ),
                                items: items
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as String;
                                    selectedTextValue =
                                        selectedValue.toString();

                                    _districtController.text =
                                        selectedValue.toString();

                                    print(_districtController.text);
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                ),
                                iconSize: 14,
                                iconEnabledColor: AppColors.whiteTextColor,
                                iconDisabledColor: AppColors.priceValueColor,
                                buttonHeight: 50,
                                buttonWidth: 200,
                                buttonPadding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  // border: Border.all(
                                  //   color: Colors.white
                                  // ),
                                  color: AppColors.primeryTextColor,
                                ),
                                // buttonElevation: 2,
                                itemHeight: 40,
                                itemPadding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                dropdownMaxHeight: 200,
                                dropdownWidth: 200,
                                dropdownPadding: null,
                                dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: AppColors.whiteTextColor),
                                dropdownElevation: 1,
                                scrollbarRadius: const Radius.circular(40),
                                scrollbarThickness: 6,
                                scrollbarAlwaysShow: true,
                                offset: const Offset(0, 0),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 200,
                              height: 20,
                              child: TextField(
                                style: AppTextStyle.filterTextStyle,
                                textAlign: TextAlign.center,
                                enabled: false,
                                controller: _districtController,
                                decoration: const InputDecoration(
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Text(selectedTextValue,
                            //     style: AppTextStyle.filterTextStyle),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            TextWithTextField(
                              controller: _pricecontroller,
                              text: 'Цена',
                              hintText: 'Цена',
                            ),
                            const SizedBox(height: 20),
                            TextWithTextField(
                              controller: _squercontroller,
                              text: 'Квадратура',
                              hintText: '㎡',
                            ),
                            const SizedBox(height: 20),
                            TextWithTextField(
                              controller: _roomscontroller,
                              text: 'Кл. Комнат',
                              hintText: 'Комнаты',
                            ),
                            const SizedBox(height: 20),
                            TextWithTextField(
                              controller: _floorScontroller,
                              text: 'Этажность',
                              hintText: 'Количество Этажей',
                            ),
                            const SizedBox(height: 20),
                            TextWithTextField(
                              controller: _levelcontroller,
                              text: 'Этаж',
                              hintText: 'Этаж',
                            ),
                            const SizedBox(height: 20),
                            TextWithTextField(
                              controller: _phonecontroller,
                              text: 'Телефон',
                              hintText: 'Телефон владельца',
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                        DescriptionWithTextField(
                          controller: _descriptioncontroller,
                          text: 'Доп. Описание',
                          hintText: 'Дополнитальная информация',
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AppTextbtnCancel(
                              func: () async {
                                Navigator.of(context).pop();
                              },
                              text: 'Отменить',
                            ),
                            AppTextbtn(
                              func: () async {
                                final int? price =
                                    int.tryParse(_pricecontroller.text);
                                final double? squer =
                                    double.tryParse(_squercontroller.text);
                                final int? rooms =
                                    int.tryParse(_roomscontroller.text);
                                final int? floorS =
                                    int.tryParse(_floorScontroller.text);
                                final int? level =
                                    int.tryParse(_levelcontroller.text);
                                final int? phone =
                                    int.tryParse(_phonecontroller.text);
                                final String description =
                                    _descriptioncontroller.text;
                                final String district =
                                    _districtController.text == ''
                                        ? args[2]
                                        : _districtController.text;

                                final String status = _statusTextController
                                        .text.isEmpty
                                    ? args[11]
                                    : _statusTextController.text == "Активный"
                                        ? "[<'Active'>]"
                                        : "[<'Sold Out'>]";
                                final String rentSellFinal =
                                    _rentSellTextController.text.isEmpty
                                        ? args[7]
                                        : _rentSellTextController.text ==
                                                "Аренда"
                                            ? "[<'Rent'>]"
                                            : "[<'Sell'>]";

                                final String typeFinal =
                                    _typeTextController.text.isEmpty
                                        ? args[9]
                                        : _typeTextController.text == "Квартира"
                                            ? "[<'Apartment'>]"
                                            : "[<'House'>]";

                                final String oldOrNewFinal =
                                    _oldOrNewTextController.text.isEmpty
                                        ? args[12]
                                        : _oldOrNewTextController.text ==
                                                "Новая постройка"
                                            ? "[<'New B'>]"
                                            : "[<'Resale'>]";

                                if (price != null &&
                                    squer != null &&
                                    rooms != null &&
                                    floorS != null &&
                                    level != null &&
                                    phone != null &&
                                    description != null &&
                                    district != null &&
                                    status != null &&
                                    rentSellFinal != null &&
                                    typeFinal != null &&
                                    oldOrNewFinal != null) {
                                  await _products.doc(args[0]).update({
                                    "price": price,
                                    "squer": squer,
                                    "rooms": rooms,
                                    "floorS": floorS,
                                    "level": level,
                                    "phone": phone,
                                    "description": description,
                                    "district": district,
                                    "status": status,
                                    "rentSell": rentSellFinal,
                                    "rs": typeFinal,
                                    "type": oldOrNewFinal,
                                  }).then((_) => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const HomePage(),
                                      )));
                                }

                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   SnackBar(
                                //     backgroundColor: AppColors.priceValueColor,
                                //     content: Text(
                                //       "Oбъект обновлен!",
                                //       style: AppTextStyle.titleTextStyle,
                                //     ),
                                //   ),
                                // );
                              },
                              text: 'Обновить',
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
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
