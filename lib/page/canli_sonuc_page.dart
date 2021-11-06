import 'dart:convert';
import 'package:fixscore/constants/color.dart';
import 'package:fixscore/constants/text.dart';
import 'package:fixscore/data/score.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CanliSonucPage extends StatefulWidget {
  const CanliSonucPage({Key? key}) : super(key: key);

  @override
  _CanliSonucPageState createState() => _CanliSonucPageState();
}

class _CanliSonucPageState extends State<CanliSonucPage> {
  Score? myScore;

  @override
  void initState() {
    super.initState();
    _getir().then((value) {
      myScore = value;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: ConstantsColor.appColor,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              onRefresh: _refresh,
              child: FutureBuilder(
                future: _getir(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              snapshot.data!.stages!.length.toString() +
                                  ' maç bulundu!',
                              style: ConstantsText.subTitleTextStyle,
                              textAlign: TextAlign.left,
                            ),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
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
                                        snapshot.data!.stages![index].events![0]
                                                .t1![0].nm
                                                .toString() +
                                            ' Vs ' +
                                            snapshot.data!.stages![index]
                                                .events![0].t2![0].nm
                                                .toString(),
                                        style: ConstantsText.textStyle4,
                                      ),
                                      subtitle: Text(
                                        snapshot.data!.stages![index].events![0]
                                                .tr1
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
                                          snapshot.data!.stages![index]
                                              .events![0].eps
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
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Future<Score> _getir() async {
    var response = await http.get(Uri.parse(
        'https://livescore6.p.rapidapi.com/matches/v2/list-live?rapidapi-key={APIKEY}'));
    if (response.statusCode == 200) {
      return Score.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Hata: ' + response.statusCode.toString());
    }
  }

  Future<void> _refresh() {
    _getir().then((value) {
      setState(() {
        myScore = value;
      });
    });
    return Future.delayed(
      Duration(seconds: 2),
    );
  }
}
