import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/TopContainer.dart';
import 'widgets/mainPageData.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarTextColor.setTextColor(null);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '아라미',
      home: MyHomePage(title: 'Flutter KMOUIN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void scopeOut() {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void pagePop(int i) {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => subpage[i],
      ),
    );
  }

  Widget build(BuildContext context) {
    int _connect = 0;

    double _mainWidth = MediaQuery.of(context).size.width;
    double _mainHeight = MediaQuery.of(context).size.height;
    double _backgroundHeight = _mainHeight * (33.0 / 100);
    double _backgroundHeight2 = _mainHeight * (50.0 / 100);
    double _titleLeftBorder = _mainWidth * (8.0 / 100);
    double _sideBorder = _mainWidth * (6.0 / 100);
    double _logoSize = _mainWidth * (14.4 / 100);
    double _searchHeight = _mainHeight * (6.5 / 100);
    double _searchPadding = _searchHeight * (22.7 / 100);

    ScreenUtil.init(context,
        width: _mainWidth, height: _mainHeight, allowFontScaling: false);

    return GestureDetector(
      onTap: () {
        scopeOut();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            TopContainer(
              child: Image.asset(
                'images/arame/arameLogo2.png',
//                fit: BoxFit.fill,
                height: _backgroundHeight2/2,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
//                        Container(
//                          margin: EdgeInsets.only(
//                            top: _mainHeight * (8.0 / 100),
//                          ),
//                          child: Text(
//                            "한국해양대학교 입학홍보대사",
//                            style: TextStyle(
//                              color: Color(0xffffffff),
//                              letterSpacing: -0.5,
//                              fontWeight: FontWeight.w300,
//                              fontFamily: "NotoSansKR",
//                              fontStyle: FontStyle.normal,
//                              fontSize: ScreenUtil().setSp(24.0),
////                              fontSize: 24.0,
//                            ),
//                            textAlign: TextAlign.left,
//                          ),
//                        ),
//                        Container(
//                          margin: EdgeInsets.only(
//                            top: _backgroundHeight * (5.0 / 100),
//                          ),
//                          child: Row(
//                            children: <Widget>[
//                              Container(
//                                margin: EdgeInsets.only(
//                                  bottom: _backgroundHeight * (2.1 / 100),
//                                ),
//                                child: Text(
//                                  "해대인",
//                                  style: TextStyle(
//                                    color: Colors.orangeAccent,
//                                    letterSpacing: -0.5,
//                                    fontWeight: FontWeight.bold,
//                                    fontFamily: "NotoSansKR",
//                                    fontStyle: FontStyle.normal,
//                                    fontSize: ScreenUtil().setSp(32.0),
//                                  ),
//                                  textAlign: TextAlign.left,
//                                ),
//                              ),
//                              Container(
//                                  width: _logoSize,
//                                  margin: EdgeInsets.only(
//                                    left: _mainWidth * (4.5 / 100),
//                                  ),
//                                  child: Icon(
//                                    Icons.star,
//                                    color: Colors.orangeAccent,
//                                  )),
//                            ],
//                          ),
//                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 5.0,
                          ),
                          margin: EdgeInsets.fromLTRB(
                            _sideBorder,
                            _sideBorder*7,
                            _sideBorder,
                            _sideBorder,
                          ),
                          width: _mainWidth * (86.4 / 100),
                          height: 48,
                          //높이 조절해야함 _ 상대말고 고정!
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.all(
                                Radius.circular(_searchHeight)),
                            border: Border.all(
                                color: const Color(0xffffffff), width: 1),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0x80cacaca),
                                  offset: Offset(0, -1),
                                  blurRadius: 16,
                                  spreadRadius: 2),
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              IconButton(
//                                onPressed: (){
//                                  Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                      builder: (context) => subpage[_connect],
//                                    ),
//                                  );
//                                },
                                icon: Icon(
                                  Icons.search,
                                  color: Color(0xff307ac6),
                                ),
                                color: Color(0xff307ac6),
                              ),
                              Flexible(
                                child: Center(
                                  child: TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '검색하기',
                                      suffixIcon: IconButton(
                                        onPressed: () => _controller.clear(),
                                        icon: Center(child: Icon(Icons.clear)),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "NotoSansKR",
                                      fontStyle: FontStyle.normal,
                                      fontSize: ScreenUtil().setSp(14.0),
                                    ),
                                    cursorColor: Colors.blueAccent,
                                    controller: _controller,
                                    onSubmitted: (String value) async {
                                      for (int i = 0;
                                          i < keywords.length;
                                          i++) {
                                        if (value.toString() ==
                                            keywords[i].toString()) {
                                          _connect = i;
                                          _controller.clear();
                                          return pagePop(i);
                                        }
                                      }
                                      await showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CupertinoAlertDialog(
                                            title: Text(
                                              '죄송합니다',
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenUtil().setSp(14)),
                                            ),
                                            content: Column(
                                              children: [
                                                Text(
                                                  '"$value"(이)라는 키워드가 없습니다. \n',
                                                  style: TextStyle(
                                                      fontSize: ScreenUtil()
                                                          .setSp(14)),
                                                ),
                                                Text(
                                                  "-------",
                                                  style: TextStyle(
                                                      fontSize: ScreenUtil()
                                                          .setSp(14)),
                                                ),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                onPressed: () {
                                                  _controller.clear();
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'OK',
                                                  style: TextStyle(
                                                      fontSize: ScreenUtil()
                                                          .setSp(14)),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ), //상단 타이틀 및 검색바 부분
                Flexible(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: CategoryCards(
                          logoContainer: IconContainer(
                            backColor: Colors.indigo,
                            foreImage: Icon(
                              Icons.bookmark,
                            ),
                          ),
                          containerTitle: '모집요강',
                          containerDescription: '#2021#수시#정시',
                          order: 1,
                        ),
                      ),
                      Flexible(
                        child: CategoryCards(
                          logoContainer: IconContainer(
                            backColor: Colors.indigo,
                            foreImage: Icon(
                              Icons.list,
                            ),
                          ),
                          containerTitle: 'FAQ',
                          containerDescription: '#주요질문사항정리',
                          order: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: CategoryCards(
                          logoContainer: IconContainer(
                            backColor: Colors.indigo,
                            foreImage: Icon(
                              Icons.star,
                            ),
                          ),
                          containerTitle: '입시결과',
                          containerDescription: '#작년도 성적확인#경쟁률 확인',
                          order: 3,
                        ),
                      ),
                      Flexible(
                        child: CategoryCards(
                          logoContainer: IconContainer(
                            backColor: Colors.indigo,
                            foreImage: Icon(
                              Icons.search,
                            ),
                          ),
                          containerTitle: '입학문의',
                          containerDescription: '#카카오톡#인스타그램..',
                          order: 4,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Center(
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      child: Text("한국해양대학교 입학처 바로가기",
                          style: TextStyle(
                            color: Color(0xff2c6ec4),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansKR",
                            fontStyle: FontStyle.normal,
                            fontSize: ScreenUtil().setSp(16.0),
                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCards extends StatelessWidget {
  CategoryCards({
    @required this.logoContainer,
    @required this.containerTitle,
    @required this.containerDescription,
    @required this.order,
  });

  final int order;
  final logoContainer;
  final String containerTitle;
  final String containerDescription;

  @override
  Widget build(BuildContext context) {
    void scopeOut() {
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    double _mainWidth = MediaQuery.of(context).size.width;
    double _containerSize = _mainWidth * (42.0 / 100);
    double _marginSize = _mainWidth * (2.0 / 100);

    return Container(
      margin: EdgeInsets.all(_marginSize),
      width: _containerSize,
      height: _containerSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: const Color(0x80cacaca),
            offset: Offset(0, -1),
            blurRadius: 16,
            spreadRadius: 2,
          ),
        ],
        color: const Color(0xffffffff),
      ),
      child: FlatButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.all(0.0),
        onPressed: () {
          scopeOut();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => category[order - 1],
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            logoContainer,
            // 버스 정보
            Text(
              containerTitle,
              style: TextStyle(
                color: Color(0xff131415),
                fontWeight: FontWeight.w500,
                fontFamily: "NotoSansKR",
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil().setSp(24.0),
              ),
              textAlign: TextAlign.center,
            ),
            // 실시간 위치를 알 수 있어요
            Text(
              containerDescription,
              style: TextStyle(
                color: Color(0xff5f605f),
                fontWeight: FontWeight.w500,
                fontFamily: "NotoSansKR",
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil().setSp(12.0),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  IconContainer({
    @required this.backColor,
    @required this.foreImage,
  });

  final Color backColor;
  final Icon foreImage;

  @override
  Widget build(BuildContext context) {
    double _mainWidth = MediaQuery.of(context).size.width;
    double _iconSize = _mainWidth * (17.0 / 100);
    double _iconPadding = _iconSize * (18.0 / 100);
    double _iconPaddingTop = _iconSize * (16.5 / 100);

    return Container(
      margin: EdgeInsets.fromLTRB(0.0, _iconPaddingTop, 0.0, _iconPadding),
      width: _iconSize,
      height: _iconSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: backColor,
              borderRadius: BorderRadius.circular(_iconSize),
            ),
          ),
          Container(
            padding: EdgeInsets.all(_iconPadding),
            child: foreImage,
          ),
        ],
      ),
    );
  }
}
