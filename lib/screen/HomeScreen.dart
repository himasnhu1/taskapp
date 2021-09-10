import 'dart:convert';
import 'package:flutter/cupertino.dart';

import '../model/productmodel.dart';
import 'package:app/constant.dart';
import 'package:flutter/material.dart';
import 'appitem.dart';
import 'package:http/http.dart' as http;

class ProductApp {
  final String id;
  final String imageUrl;

  ProductApp({this.id, this.imageUrl});
}

class ProductApps {
  final String id;
  final String imageUrl;
  final String text;

  ProductApps({this.id, this.imageUrl, this.text});
}

class Homescreen extends StatefulWidget {
  static const style = TextStyle(
    fontSize: 12.0,
    color: Colors.white,
    fontWeight: FontWeight.w300,
  );

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<ProductApp> _item = [];

  Future fetchDeliveryImage() async {
    final response = await http.get(Uri.parse(
        'http://chotu.proinnovativesoftware.co/Api/Rebliss/GetMarkAttendanceUserInfo/5'));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print('====>$result');
      print('${result['Banner6']}');
      setState(() {
        _item.add(ProductApp(id: 'p7', imageUrl: '${result['Banner6']}'));
        _item.add(ProductApp(id: 'p7', imageUrl: '${result['Banner7']}'));
        _item.add(ProductApp(id: 'p7', imageUrl: '${result['Banner8']}'));
      });
    }
  }

  List resultProduct = [];
  Map<String, dynamic> _map;

  Future login() async {
    final login = await http.post(
        'http://chotu.proinnovativesoftware.co/Api/Rebliss/ResturantName/',
        body: {
          "number": '1',
        });
    if (login.statusCode == 200) {
      _map = json.decode(login.body);
      print(_map);
    }
  }

  @override
  void initState() {
    fetchDeliveryImage();
    login();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            color: colorList.shade600,
            child: Column(
              children: [
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Current Location",
                          style: Homescreen.style,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "2069,Kailesh Nagar Gandhi Nagar,Seelampur,",
                          style: Homescreen.style,
                        ),
                        Text(
                          "Shahdara,Delhi,110031,India",
                          style: Homescreen.style,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        body: FutureBuilder(
            future: Future.delayed(Duration(milliseconds: 500), login),
            builder: (c, s) {
              if(s.connectionState == ConnectionState.done){
                StudentDetail studentDetail = StudentDetail.fromJson(_map);
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(children: [
                          Text(
                            "CORONAVIRUS SAFETY",
                            style: TextStyle(
                                fontSize: 20,
                                color: colorList.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          IconButton(
                              icon: Icon(Icons.local_hospital), onPressed: () {}),
                          Text(
                            "XYZ",
                            style: TextStyle(fontSize: 10),
                          )
                        ]),
                        SizedBox(height: 5),
                        Container(
                          height: 100,
                          color: colorList.shade600,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Image.asset('assets/images/sanitizer-64.png',
                                        width: 30, height: 30, fit: BoxFit.fill),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("XYZ",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Image.asset(
                                        'assets/images/iconssanitizer-64.png',
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.fill),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "XYZ",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Image.asset('assets/images/iconscough.png',
                                        width: 30, height: 30, fit: BoxFit.fill),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("XYZ",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Instant delivery to your doorstep",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 110,
                          child: GridView.builder(
                              padding: const EdgeInsets.all(10),
                              itemCount: _item.length,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 3 / 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                              itemBuilder: (c, i) => ProductItem(
                                _item[i].id,
                                _item[i].imageUrl,
                              )),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Image.asset('assets/images/protection-mask.png',
                                    width: 60, height: 60, fit: BoxFit.fill),
                                Text("or"),
                                Image.asset('assets/images/icons8home.png',
                                    width: 60, height: 60, fit: BoxFit.fill),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 5),
                        Center(
                            child: Text(
                              "Shop by category",
                              style: TextStyle(fontSize: 20, color: Colors.green),
                            )),
                        Container(
                            height: 210,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(studentDetail.result.length,
                                      (index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                            height: 50,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${studentDetail.result[index].num}'),
                                                  fit: BoxFit.cover),
                                            ),
                                            child: Align(
                                                alignment: Alignment.bottomCenter,
                                                child: Card(
                                                    color: Colors.white,
                                                    child: Text(studentDetail
                                                        .result[index].amount
                                                        .toString())))),
                                      ),
                                    );
                                  }),
                            )),
                      ],
                    ),
                  ]),
                );
              }
              else {
                return Center(child:CircularProgressIndicator());
              }
            }));
  }
}
