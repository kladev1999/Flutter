// ignore_for_file: prefer_typing_uninitialized_variables, sort_child_properties_last
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:app/database/db_service.dart';
import 'view/Buy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'Collection sales '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final details = TextEditingController();
// ignore: non_constant_identifier_names
  final name = TextEditingController();
  final image = TextEditingController();
  final price = TextEditingController();
  var img;
  String category = 'เสื้อผ้า';
  var items = [
    'เสื้อผ้า',
    'เครื่องสำอาง',
    'อาหาร',
    'เครื่องใช้ไฟฟ้า',
    'รถ',
  ];

  int likeCount = 0;

  getAllData() async {
    proList = <ProductModel>[];
    var service = DBService();
    var product = await service.readData(); //readData from database
    product.forEach((pro) {
      setState(() {
        var proModel = ProductModel();
        proModel.id = pro['id'];
        proModel.name = pro['name'];
        proModel.details = pro['details'];
        proModel.price = pro['price'];
        proModel.category = pro['category'];
        proModel.image = pro['image'];
        proList.add(proModel);
      });
    });
  }

  void AddData() {
    setState(() {
      DBService service = DBService();
      ProductModel product = ProductModel();
      product.name = name.text;
      product.details = details.text;
      product.category = category;
      product.price = price.text;
      product.image = image.text;
      var data = product.productMap();
      service.insertData(data);
      List_Buy();
      name.text = '';
      details.text = '';
      category = 'เสื้อผ้า';
      price.text = '';
      img = null;
    });
  }

  // ignore: non_constant_identifier_names
  void List_Buy() {
    Navigator.of(context)
        .push(
      // ignore: non_constant_identifier_names
      MaterialPageRoute(
          // ignore: non_constant_identifier_names
          builder: (Context) => Next_one()),
    )
        .then((value) {
      getAllData();
      setState(() {
        value;
      });
    });
  }

  @override
  void initState() {
    getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Header(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 380,
                height: 560,
                color: Colors.deepOrange,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                child: Column(
                  children: [
                    TextField(
                      controller: name,
                      decoration: InputDecoration(
                          // Given Hint Text
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          hintText: 'ชื่อสินค้า',
                          border: OutlineInputBorder(
                            // Given border to textfield
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          )),
                    ),
                    const SizedBox(height: 10),

                    // textfield2 for taking input as longitude
                    TextField(
                      controller: details,
                      decoration: InputDecoration(
                          // Given hint text
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          hintText: 'รายละเอียด',
                          border: OutlineInputBorder(
                            // given border to textfield
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),

                    const SizedBox(height: 10),

                    // textfield2 for taking input as longitude
                    TextField(
                      controller: price,
                      decoration: InputDecoration(
                          // Given hint text
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          hintText: 'ราคา',
                          border: OutlineInputBorder(
                            // given border to textfield
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'ประเภทสินค้า:',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 130,
                          height: 30,
                          color: Colors.white,
                          child: DropdownButton(
                            // Initial Value
                            value: category,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                category = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: 200,
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color.fromARGB(255, 190, 13, 13),
                              shadowColor: const Color.fromARGB(255, 2, 70, 187),
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.0)),
                              // ignore: prefer_const_constructors
                              minimumSize: Size(70, 30),
                            ),
                            onPressed: () async {
                              PickedFile? pickedFile =
                                  // ignore: deprecated_member_use
                                  await ImagePicker().getImage(
                                source: ImageSource.gallery,
                                maxWidth: 800,
                                maxHeight: 800,
                              );
                              String bit = base64
                                  .encode(await pickedFile!.readAsBytes());
                              image.text = bit;
                              // ignore: unnecessary_null_comparison
                              if (pickedFile != null) {
                                setState(() {
                                  img = File(pickedFile.path);
                                });
                              }
                            },
                            child: const Text(
                              'Upload Image',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          (img == null)
                              ? Container()
                              : Container(
                                  height: 220,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.deepOrangeAccent),
                                  ),
                                  child: Image.file(
                                    img,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                      onPressed: () => AddData(),
                      child: const Text(
                        'Post',
                      ),
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(
                              const BorderSide(width: 2, color: Colors.red)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.redAccent),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 25)),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 15)))),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.redAccent,
                      shadowColor: Colors.blueAccent,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.0)),
                      // ignore: prefer_const_constructors
                      minimumSize: Size(100, 40),
                    ),
                    onPressed: List_Buy,
                    child: const Text(
                      'รายการขาย',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Header() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(0.8),
          child: const Text(
            'Create a sales list',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          height: 30,
        ),
      ],
    ),
  );
}
