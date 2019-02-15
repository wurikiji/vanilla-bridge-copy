import 'package:flutter/material.dart';

class VanillaDrawer extends StatelessWidget {
  const VanillaDrawer();
  @override
  Widget build(BuildContext context) {
    double drawerWidth = MediaQuery.of(context).size.width * 80 / 100;
    double topPadding = MediaQuery.of(context).padding.top;
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(top: topPadding),
        width: drawerWidth,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: _buildDrawerHeader(drawerWidth, context),
            ),
            Divider(height: 1, color: Colors.grey),
            Expanded(
              flex: 2,
              child: _buildDrawerStatusRow(2),
            ),
            Divider(height: 1, color: Colors.grey),
            Expanded(
              flex: 1,
              child: _buildProApply(),
            ),
            Divider(height: 1, color: Colors.grey),
            Expanded(
              flex: 1,
              child: _buildAuthInfo(),
            ),
            Divider(height: 1, color: Colors.grey),
            Expanded(
              flex: 1,
              child: _buildBridgeCoinInfo(),
            ),
            Divider(height: 1, color: Colors.grey),
            Expanded(
              flex: 5,
              child: _buildDrawerMenu(),
            ),
            Divider(height: 1, color: Colors.deepPurple[400]),
            Expanded(
              flex: 1,
              child: _buildChangeMode(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChangeMode(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("회원 모드로 전환"),
                content: Text(
                  "회원 모드로 전환하시겠습니까?",
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("취소",
                        style: TextStyle(color: Colors.deepPurple[400])),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  FlatButton(
                    child: Text("확인",
                        style: TextStyle(color: Colors.deepPurple[400])),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              );
            });
      },
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.autorenew,
              color: Colors.deepPurple[400],
              size: 16.0,
            ),
            Text("회원 모드로 전환", style: TextStyle(color: Colors.deepPurple[400])),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerMenu() {
    return Container(
      child: ListView(
        children: <Widget>[
          _buildMenuItem(Icons.description, "주선자 매뉴얼"),
          _buildMenuItem(Icons.announcement, "소개팅 주선방법"),
          _buildMenuItem(Icons.person, "문의하기"),
          _buildMenuItem(Icons.flag, "공지사항"),
          _buildMenuItem(Icons.insert_comment, "자주묻는 질문"),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: Colors.black54, size: 16.0),
            SizedBox(width: 8.0),
            Text(title, style: TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }

  Widget _buildBridgeCoinInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.ac_unit, size: 16.0),
              SizedBox(width: 10.0),
              Text("브릿지", style: TextStyle(fontSize: 12.0)),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("0B / 사용가능: 0B", style: TextStyle(fontSize: 12.0)),
              Icon(
                Icons.keyboard_arrow_right,
                size: 16.0,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAuthInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "프로필 인증",
            style: TextStyle(
              color: Colors.deepPurple[400],
              fontSize: 10,
            ),
          ),
          Text(
            "인증 안됨",
            style: TextStyle(
              color: Colors.red,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProApply() {
    return Image.asset('images/apply_pro.png', fit: BoxFit.fill);
  }

  Widget _buildDrawerHeader(double width, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple[100],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: width / 10,
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: ShapeDecoration(
                  color: Colors.orange,
                  shape: StadiumBorder(),
                ),
                alignment: Alignment.center,
                child: Text(
                  "지인소개 주선자",
                  style: TextStyle(color: Colors.white, fontSize: 8.0),
                ),
                margin: EdgeInsets.only(bottom: 4.0),
              ),
              Text("바닐라님", style: TextStyle(fontSize: 12.0)),
              Text("(바닐라브릿지)", style: TextStyle(fontSize: 10.0)),
            ],
          ),
          Expanded(flex: 1, child: Container()),
          Icon(Icons.settings, color: Colors.grey[700]),
        ],
      ),
    );
  }

  Widget _buildDrawerStatusRow(int flex) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: _buildStatusBox("주선성공", "3회"),
        ),
        VerticalDivider(width: 2, color: Colors.grey),
        Expanded(
          flex: 1,
          child: _buildStatusBox("친구", "2명"),
        ),
        VerticalDivider(width: 2, color: Colors.grey),
        Expanded(
          flex: 1,
          child: _buildStatusBox("평균응답시간", "측정중"),
        ),
      ],
    );
  }

  Widget _buildStatusBox(String title, String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 10.0),
        ),
        SizedBox(height: 8.0),
        Text(
          desc,
          style: TextStyle(color: Colors.deepPurple[400]),
        ),
      ],
    );
  }
}
