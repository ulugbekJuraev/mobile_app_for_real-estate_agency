import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/components/app_colors.dart';

import 'package:flutter_application_2/components/app_textStyle.dart';
import 'package:flutter_application_2/pages/item_page.dart';
import 'package:flutter_application_2/pages/search_page.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteTextColor,
        title: Text(
          'Результат поиска',
          style: AppTextStyle.titleTextStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          splashRadius: 20,
          onPressed: () {
            // showModalBottomSheet(
            //     enableDrag: false,
            //     context: context,
            //     builder: (context) => const AppModalAddContainer(),
            //     backgroundColor: Colors.transparent,
            //     isScrollControlled: true);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchPage()),
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
      body: Column(
        children: const [
          ListViewWidgetSearch(),
        ],
      ),
    );
  }
}

class ListViewWidgetSearch extends StatefulWidget {
  const ListViewWidgetSearch({
    super.key,
  });

  @override
  State<ListViewWidgetSearch> createState() => _ListViewWidgetSearchState();
}

class _ListViewWidgetSearchState extends State<ListViewWidgetSearch> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    print(args);
    return Expanded(
      child: StreamBuilder(
          stream: _products.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 24, right: 24, top: 10),
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  final items = documentSnapshot['images'];

                  if (documentSnapshot['status'] == args[0] &&
                      documentSnapshot['rentSell'] == args[1] &&
                      documentSnapshot['rs'] == args[2] &&
                      documentSnapshot['district'] == args[3] &&
                      (documentSnapshot['price'] == args[4] ||
                          args[4] > documentSnapshot['price'])) {
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            routeSettings: RouteSettings(arguments: [
                              documentSnapshot.id,
                              documentSnapshot['description'],
                              documentSnapshot['district'],
                              documentSnapshot['floorS'].toString(),
                              documentSnapshot['level'].toString(),
                              documentSnapshot['phone'].toString(),
                              documentSnapshot['price'].toString(),
                              documentSnapshot['rentSell'],
                              documentSnapshot['rooms'].toString(),
                              documentSnapshot['rs'],
                              documentSnapshot['squer'].toString(),
                              documentSnapshot['status'],
                              documentSnapshot['type'],
                              documentSnapshot['images'][0],
                            ]),
                            enableDrag: false,
                            context: context,
                            builder: (context) => const ItemModalContainer(),
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true);
                      },
                      child: MyListTileSearch(
                        district: documentSnapshot['district'] == null
                            ? 'No Data'
                            : documentSnapshot['district'].toString(),
                        floorS: documentSnapshot['floorS'] == null
                            ? 'No Data'
                            : documentSnapshot['floorS'].toString(),
                        level: documentSnapshot['level'] == null
                            ? 'No Data'
                            : documentSnapshot['level'].toString(),
                        price: documentSnapshot['price'] == null
                            ? 'No Data'
                            : documentSnapshot['price'] == null
                                ? 'No Data'
                                : documentSnapshot['price'].toString(),
                        rooms: documentSnapshot['rooms'] == null
                            ? 'No Data'
                            : documentSnapshot['rooms'].toString(),
                        squer: documentSnapshot['squer'] == null
                            ? 'No Data'
                            : documentSnapshot['squer'].toString(),
                        images: items,
                        itemCount: documentSnapshot['images'].length,
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
                itemCount: streamSnapshot.data!.docs.length,
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

class MyListTileSearch extends StatelessWidget {
  final String district, rooms, level, floorS, price, squer;
  final List images;
  final int itemCount;
  const MyListTileSearch({
    super.key,
    required this.district,
    required this.rooms,
    required this.level,
    required this.floorS,
    required this.price,
    required this.squer,
    required this.images,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 1,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: size.width * 0.90,
              height: size.height * 0.20,
              child: CarouselSlider.builder(
                itemCount: itemCount,
                itemBuilder: (context, itemIndex, realIndex) => Image(
                  image: NetworkImage(images[itemIndex]),
                  fit: BoxFit.cover,
                ),
                options: CarouselOptions(
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  disableCenter: true,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  enableInfiniteScroll: true,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text(
                      '$rooms/$level/$floorS ($squer m2)',
                      style: AppTextStyle.titleTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: AppColors.priceValueColor,
                        size: 16,
                      ),
                      Text(
                        district,
                        style: AppTextStyle.filterTextStyle,
                      )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Price',
                    style: AppTextStyle.priceTextStyle,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "\$$price",
                    style: AppTextStyle.titleTextStyle
                        .copyWith(color: AppColors.priceValueColor),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
