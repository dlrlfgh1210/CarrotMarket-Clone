import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carrot_market/home/home_screen.dart';
import 'package:http/http.dart' as http;

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String result = '';
  List data = [];

  final TextEditingController _textEditingController = TextEditingController();

  void _onSearchSubmitted(String result) {
    getLocationData();
    data.clear();
  }

  void _onSearchChanged(String result) {
    data.clear();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: CupertinoSearchTextField(
          placeholder: '내 동네 이름(동,읍,면)으로 검색',
          backgroundColor: Colors.white,
          controller: _textEditingController,
          onSubmitted: _onSearchSubmitted,
          onChanged: _onSearchChanged,
        ),
      ),
      body: data.isEmpty
          ? const Center(
              child: Text(
                "데이터가 없습니다",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const ListTile(
                    title: Text(
                      'helllllllllo',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Container(
                height: 1,
                color: Colors.red,
              ),
              itemCount: data.length,
            ),
    );
  }

  Future<String> getLocationData() async {
    final url = Uri.parse(
      "https://business.juso.go.kr/addrlink/addrLinkApi.do?currentPage=1&countPerPage=10&keyword=${_textEditingController.text}&confmKey=U01TX0FVVEgyMDIzMDYyMTE5Mzk1NjExMzg2OTI=&resultType=json&hstryYn=Y",
    );
    print(url);
    var response = await http.get(url);

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      print(dataConvertedToJSON);
      List result = dataConvertedToJSON['juso'] ?? ['hello'];
      data.addAll(result);
      print(data);
    });
    return response.body;
  }
}
