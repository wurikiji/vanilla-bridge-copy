import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vanilla_bridge_copy/constants/colors.dart';
import 'package:faker/faker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'common/vanilla_drawer.dart';

class VanillaDiscoverMain extends StatefulWidget {
  const VanillaDiscoverMain();
  @override
  VanillaDiscoverMainState createState() {
    return new VanillaDiscoverMainState();
  }
}

class VanillaDiscoverMainState extends State<VanillaDiscoverMain>
    with TickerProviderStateMixin<VanillaDiscoverMain> {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: VanillaDrawer(),
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        centerTitle: true,
        bottom: PreferredSize(
          child: TabBar(
            tabs: <Widget>[
              Container(
                height: 36.0,
                child: Center(child: Text("디스커버")),
              ),
              Container(
                height: 36.0,
                child: Center(child: Text("보관함")),
              ),
            ],
            labelColor: VanillaMainColor,
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
          ),
          preferredSize: Size.fromHeight(32.0),
        ),
        title: Text(
          "주선하기",
          style: TextStyle(color: Colors.black, fontSize: 16.0),
        ),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu, color: VanillaMainColor),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.info_outline, color: VanillaMainColor),
          ),
        ],
      ),
      body: TabBarView(
        children: <Widget>[
          VanillaDiscoverView(),
          VanillaHistoryBoxView(),
        ],
        controller: _tabController,
      ),
    );
  }
}

class VanillaDiscoverView extends StatefulWidget {
  @override
  VanillaDiscoverViewState createState() {
    return new VanillaDiscoverViewState();
  }
}

class VanillaDiscoverViewState extends State<VanillaDiscoverView> {
  int maxCard = 40;
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key("디스커버뷰"),
      padding: EdgeInsets.all(8.0),
      color: Colors.grey[200],
      child: ListView.separated(
        separatorBuilder: (context, idx) {
          return SizedBox(height: 2.0);
        },
        itemBuilder: (context, idx) {
          return _buildSuggestionCard(context, idx);
        },
        itemCount: maxCard,
      ),
    );
  }

  Widget _buildSuggestionCard(BuildContext context, int idx) {
    String name = faker.person.name();
    int age = 20 + Random(1).nextInt(20);
    String resident = faker.address.city();
    String job = faker.job.title();
    String company = faker.company.name();
    Widget detailField = Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 35,
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$name ($age세)",
                ),
                SizedBox(height: 8),
                Text(
                  "$resident\n"
                  "$job\n"
                  "$company",
                  maxLines: 3,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "#${faker.sport.name()} #${faker.food.dish()}",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10.0
                  ),
                )
              ],
            ),
          ],
        ),
        Expanded(flex: 1, child: Container()),
        Row(
          children: <Widget>[
            Icon(FontAwesomeIcons.bookmark, color: VanillaSubColor, size: 18.0),
            SizedBox(width: 8.0),
            Icon(FontAwesomeIcons.shareSquare, color: VanillaSubColor, size: 18.0),
          ],
        )
      ],
    );
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            detailField,
            Container(
              margin: EdgeInsets.only(top:8),
              width: 250,
              child: RaisedButton(
                onPressed: (){},
                color: Colors.indigo,
                textColor: Colors.white,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.user, color: Colors.white, size: 12),
                      Text(
                        "  소개 제안하기",
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VanillaHistoryBoxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key("보관함뷰"),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("보관된 프로필 ", style: TextStyle(fontSize: 10.0),),
              Text("0명",
                style: TextStyle(
                  color: VanillaMainColor,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(flex: 2,child: Container()),
                Text("보관된 프로필이 없습니다.", style: TextStyle(fontSize: 12.0)),
                SizedBox(height: 24.0),
                Icon(FontAwesomeIcons.smileWink, color: Colors.grey,),
                Expanded(flex: 3,child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
