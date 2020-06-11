import 'package:flutter/material.dart';
import 'package:olive_you/ui/common/common_app_bar.dart';
import 'package:olive_you/ui/common/common_button.dart';
import 'package:olive_you/ui/theme/colors.dart';

class InputInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(titleText: '정보입력'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 42, left: 36, right: 36),
          child: Center(
            child: Column(
              children: <Widget>[
                _buildImage(),
                SizedBox(height: 30),
                _buildNameInput(),
                SizedBox(height: 20),
                _buildBirthInput(),
                SizedBox(height: 20),
                _buildGenderInput(),
                SizedBox(height: 20),
                _buildLocationInput(context),
                SizedBox(height: 40),
                CommonButton(text: '완료')
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildImage() => Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              '',
              // 'https://www.topstarnews.net/news/photo/201804/387605_32712_3659.jpg',
              width: 140,
              height: 140,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 4),
            width: 140,
            child: Text(
              '수정',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontFamily: 'GodoM', fontSize: 20),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.black38),
          ),
        ],
        alignment: Alignment.bottomCenter,
      );

  _buildNameInput() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '이름',
            style: TextStyle(fontFamily: 'GodoM', fontSize: 12),
          ),
          TextField(
            style: TextStyle(
              fontFamily: 'GodoM',
              fontSize: 16,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: colorGray[500])),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: colorGray[500])),
            ),
          )
        ],
      );

  _buildBirthInput() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '생일',
            style: TextStyle(fontFamily: 'GodoM', fontSize: 12),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '2003-01-04',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'GodoM',
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 36, right: 36, top: 8, bottom: 8),
                decoration:
                    BoxDecoration(border: Border.all(color: colorBlue[200])),
                child: Text(
                  '설정',
                  style: TextStyle(
                    fontFamily: 'GodoM',
                    color: colorBlue[200],
                    fontSize: 16,
                  ),
                ),
              )
            ],
          )
        ],
      );

  _buildGenderInput() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '성별',
            style: TextStyle(fontFamily: 'GodoM', fontSize: 12),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '남성',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'GodoM',
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: colorBlue[200]),
                ),
                padding:
                    EdgeInsets.only(left: 36, right: 36, top: 8, bottom: 8),
                child: Text(
                  '남성',
                  style: TextStyle(
                    fontFamily: 'GodoM',
                    color: colorBlue[200],
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 36, right: 36, top: 8, bottom: 8),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: colorGray[400]),
                    bottom: BorderSide(color: colorGray[400]),
                    top: BorderSide(color: colorGray[400]),
                  ),
                ),
                child: Text(
                  '여성',
                  style: TextStyle(
                    fontFamily: 'GodoM',
                    color: colorGray[400],
                    fontSize: 16,
                  ),
                ),
              )
            ],
          )
        ],
      );

  _buildLocationInput(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '위치',
            style: TextStyle(fontFamily: 'GodoM', fontSize: 12),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(''),
              ),
              GestureDetector(
                onTap: () { Navigator.pushNamed(context, '/findlocation'); },
                child: Container(
                  padding:
                      EdgeInsets.only(left: 36, right: 36, top: 8, bottom: 8),
                  decoration:
                      BoxDecoration(border: Border.all(color: colorGray[400])),
                  child: Text(
                    '위치 찾기',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'GodoM',
                      color: colorGray[400],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      );
}
