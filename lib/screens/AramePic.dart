import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FacilityPage extends StatefulWidget {
  @override
  _FacilityPageState createState() => _FacilityPageState();
}

class _FacilityPageState extends State<FacilityPage> {

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarTextColor.setTextColor(null);
    //화면 크기 체크
    //디바이스 너비
    double _width = MediaQuery.of(context).size.width;
    //디바이스 높이
    double _height = MediaQuery.of(context).size.height;
    //상태바 높이
    double _naviTop = MediaQuery.of(context).padding.top;
    //네비게이션바 높이
    double _bottom = MediaQuery.of(context).padding.bottom;
    double _screenHeight = _height;
    ScreenUtil.init(context,
        width: _width, height: _screenHeight, allowFontScaling: false);

    Color _appbarFont = Color(0xffffffff);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44.0),
        child: AppBar(
          centerTitle: false,
          titleSpacing: -6.0,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: Alignment.centerLeft,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(44.0)),
              onPressed: () {
                setState(
                  () {
                    Navigator.pop(context);
                  },
                );
              },
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Align(
                alignment: Alignment.centerLeft,
                widthFactor: 1.5,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      CupertinoIcons.back,
                      color: _appbarFont,
                    ),
                    Text(
                      "메인",
                      style: TextStyle(
                        color: _appbarFont,
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        wordSpacing: 0.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            height: _screenHeight * (50.0 / 100),
            width: _width,
            child: Image.asset(
              'images/arame/arame1.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}