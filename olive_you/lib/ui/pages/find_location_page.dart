import 'package:flutter/material.dart';
import 'package:olive_you/ui/common/common_app_bar.dart';
import 'package:olive_you/ui/common/common_text_field.dart';
import 'package:olive_you/ui/theme/colors.dart';

class FindLocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(titleText: '위치 찾기'),
      body: Column(
        children: <Widget>[
          _buildLocationTextField(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: colorGray[300],
          ),
          _buildLocationList(),
        ],
      ),
    );
  }

  _buildLocationTextField() => Container(
        padding: EdgeInsets.only(left: 36, right: 36, top: 30, bottom: 30),
        child: CommonTextField(label: '위치'),
      );

  _buildLocationList() => Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 24, top: 14, bottom: 12, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '부산역',
                        style: TextStyle(fontSize: 16, fontFamily: 'GodoM'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '부산광역시 동구 초량3동 중앙대로',
                        style: TextStyle(
                            color: colorGray[500],
                            fontSize: 14,
                            fontFamily: 'GodoM'),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: colorGray[200],
                )
              ],
            );
          },
          itemCount: 4,
        ),
      );
}
