import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //  图标 按钮 列的单个
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme
          .of(context)
          .primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: color,),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    // 可点击按钮的Section
    Widget buttonSection = new Container(
      child: new Row(
//          平均分配
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    // 标题行
    Widget titleSection = new Container(
      padding: new EdgeInsets.all(32.0),

//      首先 整体横向布局
      child: new Row(
        children: <Widget>[

//          首先布局昨天两个竖行的Text
          new Expanded(
//            垂直布局
            child: new Column(
//                子项左对齐
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'CDEC Match In HangZhou',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                new Text(
                  'ZheJiang,HangZhou',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),

//          布局右边的收藏图标 和 数字
          new Icon(
            Icons.star,
            color: Colors.red,
          ),

          new Text(
            '41',
          ),
        ],
      ),
    );

//    实现文本部分
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
//        表示文本应不应该在软换行符号隔开 例如逗号或者句号
        softWrap: true,
      ),
    );

//    实现图像部分和主体部分 为什么放在ListView中呢？是因为ListView会自动滚动
    return new MaterialApp(
      title: 'Lake Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top Lakes'),
        ),
        body: ListView(
          children: <Widget>[
            new Image.asset(
                'images/lake.jpeg',
              width: 600.0,
              height: 240.0,
//              告诉框架 图像应该尽可能小 但要覆盖整个渲染项
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

}


