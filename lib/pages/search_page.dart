import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';

import 'package:flutter_application_2/components/app_colors.dart';

import 'package:flutter_application_2/components/app_textStyle.dart';
import 'package:flutter_application_2/components/app_text_and_textFielfd.dart';
import 'package:flutter_application_2/components/app_text_btn.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/result_page.dart';

import 'package:image_picker/image_picker.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // final CollectionReference _products =
  //     FirebaseFirestore.instance.collection('products');
///////////
  // final ImagePicker _picker = ImagePicker();
  // List<XFile>? _imageFilesList = [];

  // List imageUrlList = [];
  // List imageNameList = [];
  // bool? isLoadingProductsAdd;
  // bool? isLoadingPhotosAdd;

  final TextEditingController _pricecontroller = TextEditingController();
  // final TextEditingController _squercontroller = TextEditingController();
  // final TextEditingController _roomscontroller = TextEditingController();
  // final TextEditingController _floorScontroller = TextEditingController();
  // final TextEditingController _levelcontroller = TextEditingController();
  // final TextEditingController _phonecontroller = TextEditingController();
  // final TextEditingController _descriptioncontroller = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  // final TextEditingController _photoController = TextEditingController();

  final List<bool> _selectedFruits = <bool>[
    true,
    false,
  ];

  final List<bool> _selectedRS = <bool>[
    true,
    false,
  ];

  // final List<bool> _selectedType = <bool>[
  //   true,
  //   false,
  // ];
  final List<bool> _selectedStatus = <bool>[
    true,
    false,
  ];

  String selectedTextValue = '';
  String statusText = "[<'Active'>]";
  String rentSellText = "[<'Rent'>]";
  String rsText = "[<'Apartment'>]";
  // String typeText = "[<'New B'>]";

  @override
  Widget build(BuildContext context) {
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
    String? selectedValue;

    const List<Widget> status = <Widget>[
      Text('Активный', key: Key('Active')),
      Text('Ост-лено', key: Key('Sold Out')),
    ];
    const List<Widget> rentSell = <Widget>[
      Text('Аренда', key: Key('Rent')),
      Text('Продажа', key: Key('Sell')),
    ];

    const List<Widget> rs = <Widget>[
      Text('Квартира', key: Key('Apartment')),
      Text('Дом', key: Key('House')),
    ];

    // const List<Widget> type = <Widget>[
    //   Text('Новая', key: Key('New B')),
    //   Text('Вторичка', key: Key('Resale')),
    // ];

    // var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteTextColor,
        title: Text(
          'Поиск объявлений',
          style: AppTextStyle.titleTextStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          splashRadius: 20,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.primeryTextColor,
          ),
        ),
        elevation: 3,
        shadowColor: AppColors.whiteTextColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 16,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ToggleButtons(
                      direction: Axis.horizontal,
                      onPressed: (int index) {
                        setState(() {
                          for (int i = 0; i < _selectedStatus.length; i++) {
                            _selectedStatus[i] = i == index;
                          }

                          statusText = status.elementAt(index).key.toString();
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderColor: const Color(0xFFE6E8EC),
                      selectedBorderColor: AppColors.primeryTextColor,
                      selectedColor: AppColors.whiteTextColor,
                      fillColor: AppColors.primeryTextColor,
                      color: AppColors.primeryTextColor,
                      disabledColor: Colors.red,
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                        minWidth: 80.0,
                      ),
                      isSelected: _selectedStatus,
                      children: status,
                    ),
                    const SizedBox(height: 20),
                    ToggleButtons(
                      direction: Axis.horizontal,
                      onPressed: (int index) {
                        setState(() {
                          for (int i = 0; i < _selectedFruits.length; i++) {
                            _selectedFruits[i] = i == index;
                            rentSellText =
                                rentSell.elementAt(index).key.toString();
                          }
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderColor: const Color(0xFFE6E8EC),
                      selectedBorderColor: AppColors.primeryTextColor,
                      selectedColor: AppColors.whiteTextColor,
                      fillColor: AppColors.primeryTextColor,
                      color: AppColors.primeryTextColor,
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                        minWidth: 80.0,
                      ),
                      isSelected: _selectedFruits,
                      children: rentSell,
                    ),
                    const SizedBox(height: 20),
                    ToggleButtons(
                      direction: Axis.horizontal,
                      onPressed: (int index) {
                        setState(() {
                          for (int i = 0; i < _selectedRS.length; i++) {
                            _selectedRS[i] = i == index;
                            rsText = rs.elementAt(index).key.toString();
                          }
                        });
                        ;
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderColor: const Color(0xFFE6E8EC),
                      selectedBorderColor: AppColors.primeryTextColor,
                      selectedColor: AppColors.whiteTextColor,
                      fillColor: AppColors.primeryTextColor,
                      color: AppColors.primeryTextColor,
                      disabledColor: Colors.red,
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                        minWidth: 80.0,
                      ),
                      isSelected: _selectedRS,
                      children: rs,
                    ),
                    const SizedBox(height: 20),

                    // ToggleButtons(
                    //   direction: Axis.horizontal,
                    //   onPressed: (int index) {
                    //     setState(() {
                    //       for (int i = 0; i < _selectedType.length; i++) {
                    //         _selectedType[i] = i == index;
                    //         typeText = type.elementAt(index).key.toString();
                    //       }
                    //     });
                    //     print(typeText);
                    //   },
                    //   borderRadius: const BorderRadius.all(Radius.circular(10)),
                    //   borderColor: const Color(0xFFE6E8EC),
                    //   selectedBorderColor: AppColors.primeryTextColor,
                    //   selectedColor: AppColors.whiteTextColor,
                    //   fillColor: AppColors.primeryTextColor,
                    //   color: AppColors.primeryTextColor,
                    //   disabledColor: Colors.red,
                    //   constraints: const BoxConstraints(
                    //     minHeight: 40.0,
                    //     minWidth: 80.0,
                    //   ),
                    //   isSelected: _selectedType,
                    //   children: type,
                    // ),
                    // const SizedBox(height: 20),

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
                                  child: Text('Выбрать район',
                                      style: AppTextStyle.filterTextStyle
                                          .copyWith(
                                              color: AppColors.whiteTextColor)
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
                                          color: AppColors.secondaryTextColor,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                                selectedTextValue = selectedValue.toString();

                                _districtController.text =
                                    selectedValue.toString();
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

                        const SizedBox(height: 10),

                        // AppTextbtnPhoto(
                        //     func: () async {
                        //       final List<XFile> selectedImages = await _picker
                        //           .pickMultiImage()
                        //           .whenComplete(
                        //               () => print('PICK IMAGES COMPLETED'));

                        //       if (selectedImages.isNotEmpty) {
                        //         _imageFilesList!.addAll(selectedImages);
                        //       }

                        //       if (_imageFilesList!.isNotEmpty) {
                        //         setState(() => isLoadingPhotosAdd = true);

                        //         String uniqueFileName = DateTime.now()
                        //             .millisecondsSinceEpoch
                        //             .toString();

                        //         Reference referenceRoot =
                        //             FirebaseStorage.instance.ref();

                        //         Reference referenceDirImages =
                        //             referenceRoot.child('images');

                        //         Future func() async {
                        //           for (var i = 0;
                        //               i < _imageFilesList!.length;
                        //               i++) {
                        //             _imageFilesList![i].name == uniqueFileName;

                        //             String? imageUrl;

                        //             try {
                        //               Reference referenceImageToUpload =
                        //                   referenceDirImages
                        //                       .child(_imageFilesList![i].name);

                        //               await referenceImageToUpload
                        //                   .putFile(
                        //                       File(_imageFilesList![i].path))
                        //                   .whenComplete(
                        //                       () => print('PutFile COMPLETED'));

                        //               imageUrl = await referenceDirImages
                        //                   .child(_imageFilesList![i].name)
                        //                   .getDownloadURL()
                        //                   .whenComplete(
                        //                       () => print('GET URL COMPLETED'));

                        //               imageUrlList.add(imageUrl);
                        //               imageNameList
                        //                   .add(_imageFilesList![i].name);
                        //             } catch (e) {
                        //               print(e);
                        //             }
                        //           }
                        //         }

                        //         await func();

                        //         setState(() {
                        //           isLoadingPhotosAdd = false;
                        //           _photoController.text =
                        //               'Фотографии загружены';
                        //           // ignore: use_build_context_synchronously
                        //         });
                        //       }
                        //     },
                        //     text: "Выбрать фото"),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                        // isLoadingPhotosAdd == true
                        //     ? ConstrainedBox(
                        //         constraints: const BoxConstraints(
                        //           maxHeight: 50,
                        //           maxWidth: 50,
                        //         ),
                        //         child: CircularProgressIndicator(
                        //           color: AppColors.primeryTextColor,
                        //         ))
                        //     : TextField(
                        //         style: AppTextStyle.filterTextStyle,
                        //         textAlign: TextAlign.center,
                        //         enabled: false,
                        //         controller: _photoController,
                        //         decoration: const InputDecoration(
                        //           disabledBorder: OutlineInputBorder(
                        //             borderSide: BorderSide(
                        //               color: Colors.transparent,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        // const SizedBox(height: 10),
                      ],
                    ),

                    // const SizedBox(height: 20),
                    TextWithTextField(
                      controller: _pricecontroller,
                      text: 'Цена',
                      hintText: 'Цена',
                    ),

                    const SizedBox(height: 20),
                    // TextWithTextField(
                    //   controller: _squercontroller,
                    //   text: 'Квадратура ㎡',
                    //   hintText: '㎡',
                    // ),
                    // const SizedBox(height: 20),
                    // TextWithTextField(
                    //   controller: _roomscontroller,
                    //   text: 'Кл. Комнат',
                    //   hintText: 'Количество Комнат',
                    // ),
                    // const SizedBox(height: 20),
                    // TextWithTextField(
                    //   controller: _floorScontroller,
                    //   text: 'Этажность',
                    //   hintText: 'Этажность',
                    // ),
                    // const SizedBox(height: 20),
                    // TextWithTextField(
                    //   controller: _levelcontroller,
                    //   text: 'Этаж',
                    //   hintText: 'Этаж',
                    // ),
                    // const SizedBox(height: 20),
                    // TextWithTextField(
                    //   controller: _phonecontroller,
                    //   text: 'Телефон',
                    //   hintText: 'Телефон владельца',
                    // ),
                    // const SizedBox(height: 20),
                    // DescriptionWithTextField(
                    //   controller: _descriptioncontroller,
                    //   text: 'Доп. Описание',
                    //   hintText: 'Дополнительная информация',
                    // ),

                    // const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AppTextbtnCancel(
                          func: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          text: 'Отменить',
                        ),
                        AppTextbtn(
                          func: () async {
                            final int? price =
                                int.tryParse(_pricecontroller.text);

                            // final double? squer =
                            //     double.tryParse(_squercontroller.text);
                            // final int? rooms =
                            //     int.tryParse(_roomscontroller.text);
                            // final int? floorS =
                            //     int.tryParse(_floorScontroller.text);
                            // final int? level =
                            //     int.tryParse(_levelcontroller.text);
                            // final int? phone =
                            //     int.tryParse(_phonecontroller.text);
                            // final String description =
                            //     _descriptioncontroller.text;

                            final String district = _districtController.text;

                            final String status = statusText;

                            final String rentSell = rentSellText;

                            final String rs = rsText;

                            // final String type = typeText;

                            // for (var i = 0; i < imageUrlList.length; i++) {
                            //   await _products.add({
                            //     "images": [
                            //       {
                            //         "imageName": imageNameList[i],
                            //         "imageUrl": imageUrlList[i],
                            //       }
                            //     ],
                            //   });
                            // }

                            if (price != null ||
                                district != null ||
                                status != null ||
                                rentSell != null ||
                                rs != null) {
                              // await _products
                              //     .doc(documentSnapshot!.id)
                              //     .update({"name": name, "price": price});
                              // setState(() => isLoadingProductsAdd = true);

                              // setState(() {
                              //   if (isLoadingProductsAdd == true) {
                              //     showDialog(
                              //       builder: (context) {
                              //         Future.delayed(
                              //             const Duration(seconds: 5), () {
                              //           Navigator.of(context).pop(true);
                              //         });
                              //         return Center(
                              //           child: ConstrainedBox(
                              //               constraints:
                              //                   const BoxConstraints(
                              //                 maxHeight: 200,
                              //                 maxWidth: 200,
                              //               ),
                              //               child: Column(
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment.center,
                              //                 crossAxisAlignment:
                              //                     CrossAxisAlignment.center,
                              //                 children: [
                              //                   CircularProgressIndicator(
                              //                     color: AppColors
                              //                         .priceValueColor,
                              //                   ),
                              //                   Text(
                              //                     'Загрузка объявления...',
                              //                     style: AppTextStyle
                              //                         .filterTextStyle
                              //                         .copyWith(
                              //                             color:
                              //                                 Colors.white),
                              //                   )
                              //                 ],
                              //               )),
                              //         );
                              //       },
                              //       context: context,
                              //     );
                              //   }
                              // });

                              // await _products.add({
                              //   "price": price,
                              //   // "squer": squer,
                              //   // "rooms": rooms,
                              //   // "floorS": floorS,
                              //   // "level": level,
                              //   // "phone": phone,
                              //   // "description": description,
                              //   "district": district,
                              //   "status": status,
                              //   "rentSell": rentSell,
                              //   "rs": rs,
                              //   // "type": type,
                              //   // "images": imageUrlList,
                              // });

                              // await _products.add({
                              //   "price": price,
                              //   "district": district,
                              //   "status": status,
                              //   "rentSell": rentSell,
                              //   "rs": rs,
                              // });

                              // setState(() {
                              //   isLoadingProductsAdd = false;
                              //   // ignore: use_build_context_synchronously
                              // });

                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    settings: RouteSettings(arguments: [
                                      status,
                                      rentSell,
                                      rs,
                                      district,
                                      price,
                                    ]),
                                    builder: (context) => const ResultPage()),
                              );

                              // Navigator.of(context).pop();
                              // ignore: use_build_context_synchronously
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //     // animation: Anima,
                              //     // elevation: 0,
                              //     backgroundColor: AppColors.priceValueColor,
                              //     // width: 200,
                              //     content: Text(
                              //       "Новый объект добавлен!",
                              //       style: AppTextStyle.titleTextStyle,
                              //     ),
                              //   ),
                              // );

                            }
                          },
                          text: 'Поиск',
                        ),
                      ],
                    ),
                    // const SizedBox(height: 50),
                  ],
                ),
              ),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
