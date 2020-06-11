import 'package:flutter/material.dart';
import 'package:olive_you/ui/common/view_page_indicator.dart';
import 'package:olive_you/ui/theme/colors.dart';

class WaitOpponentPage extends StatefulWidget {
  @override
  _WaitOpponentPageState createState() => _WaitOpponentPageState();
}

class _WaitOpponentPageState extends State<WaitOpponentPage> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildFillImage('assets/events/event_spring.jpg'),
                _buildFillImage('assets/events/event_summer.jpg'),
                _buildFillImage('assets/events/event_autumn.jpg'),
                _buildFillImage('assets/events/event_winter.jpg'),
              ],
            ),
          ),
          SizedBox(height: 5),
          ViewPageIndicator(
            itemCount: 4,
            pageController: _controller,
            activeColor: colorPrimary,
            inactiveColor: colorGray[300],
          ),
          _buildInfoText(),
        ],
      ),
    );
  }

  _buildFillImage(String asset) => Image.asset(
        asset,
        fit: BoxFit.fill,
      );

  _buildInfoText() => Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '상대의 정보 입력을 기다리고 있습니다.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GodoM',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              '상대의 정보 입력이 끝나면 자동으로 시작됩니다.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GodoM',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              '앱을 종료하여도 데이터는 보존됩니다.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GodoM',
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
}
