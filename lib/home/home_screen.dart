import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> datas = [];

  @override
  void initState() {
    super.initState();
    datas = [
      {
        "image":
            "https://static.luck-d.com/product/1732/main_carousel/NIKE_AIR_JORDAN_1_HIGH_85_BLACK_WHITE_BQ4422001_45800.jpg",
        "title": "나이키 에어 조던 1 하이 85 블랙 화이트",
        "location": "자양동",
        "price": "120000원",
      },
      {
        "image":
            "https://cdn.weekly.chosun.com/news/photo/202208/21784_42359_1424.jpg",
        "title": "아이폰14프로",
        "location": "능동",
        "price": "500000원",
      },
      {
        "image":
            "https://image.msscdn.net/images/goods_img/20210428/1926034/1926034_1_500.jpg",
        "title": "검정색 반바지",
        "location": "구의동",
        "price": "10000원",
      },
      {
        "image":
            "https://image.msscdn.net/images/goods_img/20200911/1596890/1596890_1_500.jpg",
        "title": "노이즈캔슬링 블루투스 헤드폰",
        "location": "화양동",
        "price": "100000원",
      },
      {
        "image":
            "https://image.msscdn.net/images/goods_img/20220125/2326935/2326935_11_500.jpg",
        "title": "예일 후드티",
        "location": "자양동",
        "price": "30000원",
      },
      {
        "image":
            "https://image.msscdn.net/images/goods_img/20220704/2645649/2645649_1_500.jpg",
        "title": "무브먼트 플라워 미드나잇블루 티셔츠 화이트",
        "location": "자양동",
        "price": "15000원",
      },
      {
        "image":
            "https://image.msscdn.net/images/goods_img/20220331/2458631/2458631_1_500.jpg",
        "title": "RC BB557 ORANGE 선글라스 ",
        "location": "자양동",
        "price": "5000원",
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {},
          child: const Row(
            children: [
              Text('구의동'),
              SizedBox(
                width: 10,
              ),
              FaIcon(
                FontAwesomeIcons.chevronDown,
                size: 20,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.bars),
          ),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          ),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.bell),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        // physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (datas.isNotEmpty) {
            Map<String, String> data = datas[index];
            return Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child: Image.network(
                        datas[index]["image"].toString(),
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, top: 2),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              datas[index]["title"].toString(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              datas[index]["location"].toString(),
                              style: const TextStyle(
                                  fontSize: 12, color: Color(0xff999999)),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              datas[index]["price"].toString(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        itemCount: datas.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 1,
            color: Colors.black.withOpacity(0.1),
          );
        },
      ),
    );
  }
}
