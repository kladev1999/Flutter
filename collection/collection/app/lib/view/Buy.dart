import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../database/db_service.dart';

class ProductModel {
  late int id;
  late String name;
  late String details;
  late String price;
  late String category;
  late String image;

  productMap() {
    // ignore: prefer_collection_literals
    var mapping = Map<String, dynamic>();
    mapping['name'] = name;
    mapping['details'] = details;
    mapping['price'] = price;
    mapping['category'] = category;
    mapping['image'] = image;
    return mapping; //
  }
}

// ignore: unused_element
final _listview = ScrollController();
List<ProductModel> proList = <ProductModel>[];



// ignore: camel_case_types
class Next_one extends StatefulWidget {
  const Next_one({
    Key? key,
  }) : super(key: key);
  

  @override
  State<Next_one> createState() => _Next_oneState();
}

// ignore: camel_case_types
class _Next_oneState extends State<Next_one> {
  // creat for delete
  getAllData() async {
    proList = <ProductModel>[];
    var service = DBService();
    var profiles = await service.readData();
    profiles.forEach((pro) {
      setState(() {
        var proModel = ProductModel();
        proModel.id = pro['id'];
        proModel.name = pro['name'];
        proModel.details = pro['details'];
        proModel.price = pro['price'];
        proModel.category = pro['description'];
        proModel.image = pro['image'];
        proList.add(proModel);
      });
    });
  }
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buy now"),
      ),
      body: Center(
        // ignore: unnecessary_const, unnecessary_brace_in_string_interps, unnecessary_string_interpolations
        child: Expanded(
          child: proList.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: proList.length,
                  itemBuilder: (BuildContext context, int index) {
                    // ignore: sized_box_for_whitespace
                    return Center(
                      // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
                      child: Row(
                        // child: Row(
                        children: [
                          Container(
                            width: 370,
                            margin: const EdgeInsets.only(),
                            child:

                                // ignore: avoid_unnecessary_containers

                                Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      // ignore: unnecessary_brace_in_string_interps
                                      '(${proList[index].id}) Name: ${proList[index].name}',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  ],
                                ),
                                Text(
                                  // ignore: unnecessary_brace_in_string_interps, unnecessary_string_interpolations
                                  '${proList[index].category}',
                                  style: const TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  // ignore: unnecessary_brace_in_string_interps
                                  'รายละเอียดสินค้า: "${proList[index].details}"',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 230,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.black),
                                  ),
                                  child: Image.memory(
                                    base64Decode(proList[index].image),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text('ราคา: ${proList[index].price} บาท.'),
                                    const SizedBox(
                                      width: 60,
                                    ),
                                    LikeButton(
                                      size: 30,
                                      circleColor: const CircleColor(
                                          start:
                                              Color.fromARGB(255, 255, 0, 76),
                                          end: Color.fromARGB(255, 204, 0, 95)),
                                      bubblesColor: const BubblesColor(
                                        dotPrimaryColor:
                                            Color.fromARGB(255, 229, 51, 190),
                                        dotSecondaryColor: Color(0xff0099cc),
                                      ),
                                      likeBuilder: (bool isLiked) {
                                        return Icon(
                                          Icons.favorite,
                                          color: isLiked
                                              ? Colors.red
                                              : Colors.grey,
                                          size: 28,
                                        );
                                      },
                                      likeCount: 1,
                                    ),
                                    const SizedBox(
                                      width: 80,
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        var service = DBService();
                                        // ignore: unused_local_variable
                                        var result = await service
                                            .deleteData(proList[index].id);
                                           getAllData();
                                        setState(() {
                                        });
                                      },
                                      child: const Text(
                                        'Delete',
                                        style:
                                            TextStyle(color: Colors.redAccent),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 2,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text("ไม่มีการขาย...!!!"),
                ),
        ),
      ),
    );
  }
}
