import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/components/app_colors.dart';
import 'package:flutter_application_2/components/app_textStyle.dart';
import 'package:flutter_application_2/pages/item_page.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({super.key});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');
  @override
  Widget build(BuildContext context) {
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
                  // documentSnapshot.id;
                  // documentSnapshot['description'];
                  // documentSnapshot['district'];
                  // documentSnapshot['floorS'].toString();
                  // documentSnapshot['level'].toString();
                  // documentSnapshot['phone'].toString();
                  // documentSnapshot['price'].toString();
                  // documentSnapshot['rentSell'];
                  // documentSnapshot['rooms'].toString();
                  // documentSnapshot['rs'];
                  // documentSnapshot['squer'].toString();
                  // documentSnapshot['status'];
                  // documentSnapshot['type'];

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
                    child: MyListTile(
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
                      // image: 'assets/icons/homeScreen.jpg',
                      images: items,
                      itemCount: documentSnapshot['images'].length,
                    ),
                  );
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

class MyListTile extends StatelessWidget {
  final String district, rooms, level, floorS, price, squer;
  final List images;
  final int itemCount;
  const MyListTile({
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
      // height: size.height * 0.30,
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
                  // image: AssetImage('assets/icons/homeScreen.jpg'),
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
              // child: Image(
              //   image: NetworkImage(image),
              //   // image: AssetImage('assets/icons/homeScreen.jpg'),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
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
