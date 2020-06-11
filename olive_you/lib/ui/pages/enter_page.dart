import 'package:flutter/material.dart';
import 'package:olive_you/ui/common/common_button.dart';
import 'package:olive_you/ui/common/common_text_field.dart';
import 'package:olive_you/ui/theme/colors.dart';

class EnterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 36, right: 36),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/logos/logo_olives.png'),
                SizedBox(height: 20),
                Text(
                  '전화번호를 통해 상대방과 연결하세요',
                  style: TextStyle(
                    fontFamily: 'GodoM',
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 44),
                _buildNumberTextField('나', colorPrimaryLight),
                SizedBox(height: 12),
                _buildNumberTextField('상대', colorPink[200]),
                SizedBox(height: 40),
                CommonButton(
                  text: '입장',
                  onPressed: () {
                    Navigator.pushNamed(context, '/inputinformation');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildNumberTextField(String target, Color targetTextColor) => Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Row(
              children: <Widget>[
                Text(
                  target,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'GodoM',
                      color: targetTextColor),
                ),
                Text(
                  '의 전화번호',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'GodoM',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4),
          CommonTextField(hint: '010XXXXXXXX')
        ],
      );
}
