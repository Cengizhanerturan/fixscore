import 'dart:convert';
import 'package:fixscore/constants/color.dart';
import 'package:fixscore/constants/text.dart';
import 'package:fixscore/data/Haber.dart';
import 'package:fixscore/page/haber_detay.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HaberPage extends StatefulWidget {
  const HaberPage({Key? key}) : super(key: key);

  @override
  _HaberPageState createState() => _HaberPageState();
}

class _HaberPageState extends State<HaberPage> {
  Haber? myHaber;
  @override
  void initState() {
    super.initState();
    _haberGetir().then((value) {
      myHaber = value;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: ConstantsColor.appColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).maybePop();
                      },
                      child: Hero(
                        tag: 'haberHero',
                        child: CircleAvatar(
                          radius: 22,
                          child: Icon(
                            Icons.chevron_left,
                            color: ConstantsColor.appColor2,
                            size: 40,
                          ),
                          backgroundColor: ConstantsColor.textColor1,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'FixScore',
                          style: ConstantsText.titleTextStyle,
                        ),
                        Text(
                          '#Güncel spor haberleri',
                          style: ConstantsText.subTitleTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  triggerMode: RefreshIndicatorTriggerMode.onEdge,
                  onRefresh: _refresh,
                  child: FutureBuilder(
                    future: _haberGetir(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            itemCount: myHaber!.value!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => HaberDetay(
                                          myHaber: myHaber as Haber,
                                          index: index),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: ConstantsColor.appColor2,
                                    child: Column(
                                      children: [
                                        Hero(
                                          tag: myHaber!
                                              .value![index].image!.thumbnail
                                              .toString(),
                                          child: Container(
                                            height: 300,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  myHaber!.value![index].image!
                                                      .thumbnail
                                                      .toString(),
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            myHaber!.value![index].title
                                                .toString(),
                                            style: ConstantsText.textStyle2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Haber> _haberGetir() async {
    var response = await http.get(Uri.parse(
        'https://contextualwebsearch-websearch-v1.p.rapidapi.com/api/search/NewsSearchAPI?q=football&pageNumber=1&pageSize=10&autoCorrect=true&safeSearch=true&withThumbnails=true&fromPublishedDate=null&toPublishedDate=null&rapidapi-key=56eed295b5mshb916d17972b6d84p1b42f7jsn03e880efc0c6'));
    if (response.statusCode == 200) {
      return Haber.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Hata: ' + response.statusCode.toString());
    }
  }

  Future<void> _refresh() {
    _haberGetir().then((value) {
      setState(() {
        myHaber = value;
      });
    });
    return Future.delayed(
      Duration(seconds: 2),
    );
  }
}
