import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter/services.dart';
import 'package:hla/models/active-users.dart';

class CanvasWidget extends StatefulWidget {
@override
_CanvasState createState() => _CanvasState();
}

class AvatarContainer extends StatelessWidget {
AvatarContainer();

@override
Widget build(BuildContext context) {
return AvatarSelector();
}
}

class DrawingArea {
Offset point;
Paint areaPaint;

DrawingArea({this.point, this.areaPaint});
}

class _CanvasState extends State<CanvasWidget> {
List<DrawingArea> points = [];
Color selectedColor;
double strokeWidth;

@override
void initState() {
super.initState();
selectedColor = Colors.black;
strokeWidth = 2.0;
SystemChrome.setPreferredOrientations([
DeviceOrientation.landscapeLeft,
DeviceOrientation.landscapeRight,
]);
}

void selectColor() {
showDialog(
context: context,
builder: (BuildContext context) => AlertDialog(
title: const Text('Color Chooser'),
content: SingleChildScrollView(
child: BlockPicker(
pickerColor: selectedColor,
onColorChanged: (color) {
this.setState(() {
selectedColor = color;
});
},
),
),
actions: <Widget>[
TextButton(
onPressed: () {
Navigator.of(context).pop();
},
child: Text("Close"))
],
),
);
}

@override
Widget build(BuildContext context) {
final double width = MediaQuery.of(context).size.width;
final double height = MediaQuery.of(context).size.height;
return Scaffold(
body: Stack(
children: <Widget>[
OrientationBuilder(builder: (context, orientation) {
return Container(
// Background
decoration: BoxDecoration(
image: DecorationImage(
image: orientation == Orientation.portrait
? AssetImage("lib/images/background.jpg")
    : AssetImage("lib/images/background-landscape.jpg"),
fit: BoxFit.cover),
),
);
}),
Padding(
padding: const EdgeInsets.only(left: 40.0),
child: Container(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: width * 0.6,
                    height: height * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 5.0,
                              spreadRadius: 1.0)
                        ]),
                    child: GestureDetector(
                      onPanDown: (details) {
                        this.setState(() {
                          points.add(DrawingArea(
                              point: details.localPosition,
                              areaPaint: Paint()
                                ..strokeCap = StrokeCap.round
                                ..isAntiAlias = true
                                ..color = selectedColor
                                ..strokeWidth = strokeWidth));
                        });
                      },
                      onPanUpdate: (details) {
                        this.setState(() {
                          points.add(DrawingArea(
                              point: details.localPosition,
                              areaPaint: Paint()
                                ..strokeCap = StrokeCap.round
                                ..isAntiAlias = true
                                ..color = selectedColor
                                ..strokeWidth = strokeWidth));
                        });
                      },
                      onPanEnd: (details) {
                        this.setState(() {
                          points.add(null);
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: CustomPaint(
                          painter: MyCustomPainter(points: points),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // Tools container
                    width: width * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Row(children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.color_lens, color: selectedColor),
                          onPressed: () {
                            selectColor();
                          }),
                      Expanded(
                          child: Slider(
                              min: 1.0,
                              max: 7.0,
                              activeColor: selectedColor,
                              value: strokeWidth,
                              onChanged: (value) {
                                this.setState(() {
                                  strokeWidth = value;
                                });
                              })),
                      IconButton(
                          icon: Icon(Icons.layers_clear),
                          onPressed: () {
                            this.setState(() {
                              points.clear();
                            });
                          }),
                    ]),
                  ),
                ],
              ),
            )),
        Container(
          height: height,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      width: 250,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "lib/images/paintings/painting-1.jpg"),
                            fit: BoxFit.fitWidth),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: SizedBox(
                        height: 130, width: 300, child: AvatarContainer()),
                  )),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 100),
                  child: Container(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                        child: Text('Submit'),
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(233, 118, 97, 1)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(38.0),
                            )))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class MyCustomPainter extends CustomPainter {
  List<DrawingArea> points;
  MyCustomPainter({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);

    for (int x = 0; x < points.length - 1; x++) {
      if (points[x] != null && points[x + 1] != null) {
        Paint paint = points[x].areaPaint;
        canvas.drawLine(points[x].point, points[x + 1].point, paint);
      } else if (points[x] != null && points[x + 1] == null) {
        Paint paint = points[x].areaPaint;
        canvas.drawPoints(PointMode.points, [points[x].point], paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}