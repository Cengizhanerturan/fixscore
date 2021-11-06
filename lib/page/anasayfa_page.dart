import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fixscore/constants/color.dart';
import 'package:fixscore/constants/text.dart';
import 'package:fixscore/data/Haber.dart';
import 'package:fixscore/data/score.dart';
import 'package:fixscore/page/haber_detay.dart';
import 'package:fixscore/page/haber_page.dart';
import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  Score? myScore;
  Haber? myHaber;
  int myItemCount = 5;
  int myMatchCount = 4;
  int i = 0;

  @override
  void initState() {
    super.initState();
    _getir().then((value) {
      myScore = value;
    });
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
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'FixScore',
          style: ConstantsText.titleTextStyle,
        ),
        backgroundColor: ConstantsColor.appColor,
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: _refresh,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: ConstantsColor.appColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Haberler',
                  style: ConstantsText.textStyle4,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 1,
                child: FutureBuilder(
                    future: _haberGetir(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 200,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: myItemCount,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: index < (myItemCount - 1)
                                          ? InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            HaberDetay(
                                                                myHaber: myHaber
                                                                    as Haber,
                                                                index: index)));
                                              },
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 200,
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            myHaber!
                                                                .value![index]
                                                                .image!
                                                                .thumbnail
                                                                .toString(),
                                                          ),
                                                          fit: BoxFit.cover,
                                                          colorFilter:
                                                              ColorFilter.mode(
                                                                  Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.6),
                                                                  BlendMode
                                                                      .darken)),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: myHaber!
                                                                .value![index]
                                                                .title!
                                                                .length >
                                                            10
                                                        ? Text(
                                                            myHaber!
                                                                    .value![
                                                                        index]
                                                                    .title!
                                                                    .substring(
                                                                        0, 10) +
                                                                '...',
                                                            style: ConstantsText
                                                                .textStyle4,
                                                          )
                                                        : Text(
                                                            myHaber!
                                                                .value![index]
                                                                .title
                                                                .toString(),
                                                            style: ConstantsText
                                                                .textStyle4,
                                                          ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        HaberPage(),
                                                  ),
                                                );
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Center(
                                                  child: Hero(
                                                    tag: 'haberHero',
                                                    child: CircleAvatar(
                                                      radius: 24,
                                                      child: Icon(
                                                        Icons.chevron_right,
                                                        color: ConstantsColor
                                                            .appColor2,
                                                        size: 40,
                                                      ),
                                                      backgroundColor:
                                                          ConstantsColor
                                                              .textColor1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                    );
                                  }),
                            ),
                          );
                        } else {
                          debugPrint('statement 1');
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                            style: ConstantsText.textStyle4,
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Canlı Skorlar',
                  style: ConstantsText.textStyle4,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 2,
                child: FutureBuilder(
                  future: _getir(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Score> snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          snapshot.data!.stages!.length > 0
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      snapshot.data!.stages!.length.toString() +
                                          ' maç bulundu!',
                                      style: ConstantsText.subTitleTextStyle,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Text(
                                    'Şuan oynanan maç bulunmamaktadır.',
                                    style: ConstantsText.subTitleTextStyle,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data!.stages!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Card(
                                    color: ConstantsColor.appColor2,
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0.0, vertical: 12.0),
                                      child: ListTile(
                                        title: Text(
                                          snapshot.data!.stages![index]
                                                  .events![0].t1![0].nm
                                                  .toString() +
                                              ' Vs ' +
                                              snapshot.data!.stages![index]
                                                  .events![0].t2![0].nm
                                                  .toString(),
                                          style: ConstantsText.textStyle4,
                                        ),
                                        subtitle: Text(
                                          snapshot.data!.stages![index]
                                                  .events![0].tr1
                                                  .toString() +
                                              ' - ' +
                                              snapshot.data!.stages![index]
                                                  .events![0].tr2
                                                  .toString(),
                                          style: ConstantsText.textStyle4,
                                        ),
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.black87,
                                          radius: 28,
                                          child: Text(
                                            myScore!
                                                .stages![index].events![0].eps
                                                .toString(),
                                            style: ConstantsText.textStyle4,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                          style: ConstantsText.textStyle4,
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Score> _getir() async {
    var response = await http.get(Uri.parse(
        'https://livescore6.p.rapidapi.com/matches/v2/list-live?rapidapi-key=56eed295b5mshb916d17972b6d84p1b42f7jsn03e880efc0c6'));
    if (response.statusCode == 200) {
      return Score.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('${response.statusCode.toString()}\nAPI suresi bitti!');
    }
  }

  Future<Haber> _haberGetir() async {
    var response = await http.get(Uri.parse(
        'https://contextualwebsearch-websearch-v1.p.rapidapi.com/api/search/NewsSearchAPI?q=football&pageNumber=1&pageSize=10&autoCorrect=true&safeSearch=true&withThumbnails=true&fromPublishedDate=null&toPublishedDate=null&rapidapi-key=56eed295b5mshb916d17972b6d84p1b42f7jsn03e880efc0c6'));
    if (response.statusCode == 200) {
      return Haber.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('${response.statusCode.toString()}\nAPI suresi bitti!');
    }
  }

  Future<void> _refresh() {
    _getir().then((value) {
      setState(() {
        myScore = value;
      });
    });
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
