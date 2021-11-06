import 'package:fixscore/constants/color.dart';
import 'package:fixscore/constants/text.dart';
import 'package:fixscore/data/Haber.dart';
import 'package:flutter/material.dart';

class HaberDetay extends StatefulWidget {
  Haber myHaber;
  int index;
  HaberDetay({required this.myHaber, required this.index, Key? key})
      : super(key: key);

  @override
  _HaberDetayState createState() => _HaberDetayState();
}

class _HaberDetayState extends State<HaberDetay> {
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          widget.myHaber.value![widget.index].title.toString(),
                          style: ConstantsText.textStyle3,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Hero(
                        tag: widget
                            .myHaber.value![widget.index].image!.thumbnail
                            .toString(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  widget.myHaber.value![widget.index].image!
                                      .thumbnail
                                      .toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, bottom: 30.0),
                        child: Text(
                          widget.myHaber.value![widget.index].body.toString(),
                          style: ConstantsText.textStyle2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
