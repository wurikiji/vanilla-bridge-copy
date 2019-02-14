import 'package:flutter/material.dart';

import 'common/vanilla_drawer.dart';
import 'package:vanilla_bridge_copy/constants/colors.dart';

class DiscoverMain extends StatefulWidget
{
  @override
  DiscoverMainState createState() {
    return new DiscoverMainState();
  }
}

class DiscoverMainState extends State<DiscoverMain>
  with TickerProviderStateMixin<DiscoverMain>{
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
        title: Text("주선하기", style: TextStyle(color: Colors.black, fontSize: 16.0)),
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
          DiscoverView(),
          HistoryBoxView(),
        ],
        controller: _tabController,
      ),
    );
  }
}

class DiscoverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key("디스커버뷰"),
      child: Text("디스커버 뷰"),
    );
  }
}
class HistoryBoxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key("보관함뷰"),
      child: Text("보관함 뷰"),
    );
  }
}


