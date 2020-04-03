import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timeline")),
      /*body: SingleChildScrollView(
          child: Container(
              child: Column(
        children: <Widget>[CustomPaint(painter: Timeline(context))],
      ))),*/
/*        body: Container(
            width: MediaQuery.of(context).size.width,
            height: 10 + (timeSpace * 24),
            child: CustomPaint(painter: Timeline(context))));*/
      body: TimeLineView(),
    );
  }
}

class TimeLineView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TimeLineViewState();
  }
}

class TimeLineViewState extends State<TimeLineView> {
  static double timeMultiplier = 1.0;
  final double timeSpace = 30 * timeMultiplier;
  double touchYPosition = -1;
  double oldTouchYPosition = -1;
  double scrollPos = -1;
  bool isDragging = false;

  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      physics: new NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Column(children: <Widget>[
            Text(
              "",
              textAlign: TextAlign.center,
            ),
            new GestureDetector(
                onPanUpdate: (DragUpdateDetails dragDetail) {
                  setState(() {
                    /*print("pan update : " +
                        dragDetail.localPosition.dy.toString() +
                        "  " +
                        isDragging.toString());*/
                    if (isDragging) {
                      touchYPosition =
                          ((dragDetail.localPosition.dy / timeSpace).toInt() *
                                  timeSpace) +
                              timeSpace;
                    } else {
                      if (scrollPos >= 0) {}
                      if (oldTouchYPosition < dragDetail.localPosition.dy) {
                        if (dragDetail.localPosition.dy - oldTouchYPosition >=
                            50) {
                          print("1-->" +
                              (oldTouchYPosition - dragDetail.localPosition.dy)
                                  .toString());
                          scrollPos =
                              oldTouchYPosition - dragDetail.localPosition.dy;
                          _controller.animateTo(
                            oldTouchYPosition - dragDetail.localPosition.dy,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
                          //going up
                        }
                      } else {
                        if (oldTouchYPosition - dragDetail.localPosition.dy >=
                            50) {
                          //going down
                          print("2-->" +
                              (oldTouchYPosition - dragDetail.localPosition.dy)
                                  .toString());
                          scrollPos =
                              oldTouchYPosition - dragDetail.localPosition.dy;
                          _controller.animateTo(
                            oldTouchYPosition - dragDetail.localPosition.dy,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
                        }
                      }
                    }
                  });
                },
                onPanEnd: (DragEndDetails dragDetail) {
                  setState(() {
                    isDragging = false;
                  });
                },
                onTapDown: (TapDownDetails tapDownDetail) {
                  setState(() {
                    print(tapDownDetail.localPosition.dy.toString() +
                        " " +
                        MediaQuery.of(context).size.height.toString() +
                        " " +
                        (10 + (timeSpace * 48)).toString());
                    /*_controller.animateTo(
                      50,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 600),
                    );*/

                    isDragging = false;
                    print(scrollPos.toString());
                    if (touchYPosition >= 0) {
                      /*print("checking " +
                          tapDownDetail.localPosition.dy.toString() +
                          " " +
                          touchYPosition.toString());*/
                      if (tapDownDetail.localPosition.dy >=
                              (touchYPosition - 25) &&
                          tapDownDetail.localPosition.dy <=
                              (touchYPosition + 25)) {
                        isDragging = true;
                      } else {
//                        if (oldTouchYPosition == -1) {
                          oldTouchYPosition = tapDownDetail.localPosition.dy;
//                        }
                      }
                    } else {
                      isDragging = true;

                      if ((tapDownDetail.localPosition.dy % timeSpace) >=
                          (timeSpace / 2)) {
                        touchYPosition =
                            ((tapDownDetail.localPosition.dy / timeSpace)
                                        .toInt() *
                                    timeSpace) +
                                timeSpace;
                      }

                      /* print("tap down : " +
                          touchYPosition.toString() +
                          " " +
                          tapDownDetail.localPosition.dy.toString() +
                          " " +
                          isDragging.toString());*/
                    }
                  });
                },
                onTapUp: (TapUpDetails tapUpDetail) {
                  setState(() {
                    /*_controller.animateTo(
                      -50,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 600),
                    );*/
                  });
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 10 + (timeSpace * 48),
                    child: CustomPaint(
                        painter:
                            Timeline(context, touchYPosition, isDragging))))
          ]),
        );
      },
      itemCount: 2,
    );
    /*return ListView(
      children: <Widget>[
        Text(
          "",
          textAlign: TextAlign.center,
        ),
        new GestureDetector(
            onPanUpdate: (DragUpdateDetails dragDetail) {
              setState(() {
                print("pan update : " + dragDetail.localPosition.dy.toString());
                RenderBox renderBox = context.findRenderObject();
                Offset offset =
                    renderBox.globalToLocal(dragDetail.globalPosition);
                if (isDragging) {
                  touchYPosition =
                      ((offset.dy / timeSpace).toInt() * timeSpace) + timeSpace;
                }
              });
            },
            onPanEnd: (DragEndDetails dragDetail) {
              setState(() {
                isDragging = false;
              });
            },
            onTapDown: (TapDownDetails tapDownDetail) {
              setState(() {
                isDragging = false;
                if (touchYPosition >= 0) {
                  if (tapDownDetail.localPosition.dy >= (touchYPosition - 5) &&
                      tapDownDetail.localPosition.dy <= (touchYPosition + 5)) {
                    isDragging = true;
                  }
                } else {
                  isDragging = true;

                  if ((tapDownDetail.localPosition.dy % timeSpace) >=
                      (timeSpace / 2)) {
                    touchYPosition =
                        ((tapDownDetail.localPosition.dy / timeSpace).toInt() *
                                timeSpace) +
                            timeSpace;
                  }

                  print("tap down : " +
                      touchYPosition.toString() +
                      " " +
                      tapDownDetail.localPosition.dy.toString() +
                      " " +
                      isDragging.toString());
                }
              });
            },
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 10 + (timeSpace * 48),
                child: CustomPaint(
                    painter: Timeline(context, touchYPosition, isDragging))))
      ],
    );*/
  }
}

class Timeline extends CustomPainter {
  Paint mLinesPaint;
  BuildContext mContext;
  final double timeTextSize = 12;
  final double topSpace = 10;
  static double timeMultiplier = 1.0;
  final double timeSpace = 30 * timeMultiplier;
  final double spaceBtwTimeLine = 8;
  final double leftRightSpace = 15;

  double touchStartXPosition = -1;
  double touchStartYPosition = -1;

  double touchEndXPosition = -1;
  double touchEndYPosition = -1;

  double mTouchYPosition = -1;

  bool isDragging;

  Timeline(BuildContext context, double touchYPosition, bool isDragging) {
    mContext = context;
    mLinesPaint = Paint()
      ..color = Colors.black12
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    mTouchYPosition = touchYPosition;
    this.isDragging = isDragging;
  }

  @override
  void paint(Canvas canvas, Size size) {
//    print("draw canvas " + isDragging.toString());

    final timeTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: timeTextSize,
    );
    final textSample = TextSpan(
      text: '12:00',
      style: timeTextStyle,
    );
    final constraints = BoxConstraints(
      maxWidth: MediaQuery.of(mContext).size.width,
      minHeight: 0.0,
      minWidth: 0.0,
    );

    RenderParagraph renderParagraph = RenderParagraph(
      textSample,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );
    renderParagraph.layout(constraints);
    double timeTextLength =
        renderParagraph.getMinIntrinsicWidth(timeTextSize).ceilToDouble();
    double timeTextHeight =
        renderParagraph.getMinIntrinsicHeight(timeTextSize).ceilToDouble();

    for (int i = 0; i <= 48; i++) {
      double diff = timeSpace * i;
      canvas.drawLine(
          Offset(leftRightSpace + timeTextLength + spaceBtwTimeLine,
              topSpace + diff),
          Offset(MediaQuery.of(mContext).size.width - leftRightSpace,
              topSpace + diff),
          mLinesPaint);
    }

    for (int i = 0; i <= 24; i++) {
      double diff = timeSpace * i * 2;

      final textTime = TextSpan(
        text: (i).toString() + ':00',
        style: timeTextStyle,
      );
      final textPainter = TextPainter(
        text: textTime,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );
      final offset =
          Offset(leftRightSpace, (diff + topSpace) - (timeTextHeight / 2));
      textPainter.paint(canvas, offset);
    }

    final left = leftRightSpace + timeTextLength + spaceBtwTimeLine;
    final top = 2 * timeSpace;
    final right = MediaQuery.of(mContext).size.width - leftRightSpace;
    final bottom = 3.5 * timeSpace;
    final rect = Rect.fromLTRB(left, top + topSpace, right, bottom + topSpace);
    final rrect = RRect.fromRectXY(rect, 4, 4);

    final bookTimePaint1 = Paint()
      ..color = Color.fromRGBO(0, 255, 0, 0.6)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(rrect, bookTimePaint1);

    Paint mTouchLinesPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

//    print("start y axis : " + touchStartYPosition.toString());
    if (touchStartYPosition >= 0) {
      //print("selected pointer " + touchStartYPosition.toString());
      canvas.drawLine(
          Offset(leftRightSpace + timeTextLength + spaceBtwTimeLine,
              touchStartYPosition),
          Offset(MediaQuery.of(mContext).size.width - leftRightSpace,
              touchStartYPosition),
          mTouchLinesPaint);
      if (touchEndYPosition >= 0) {
/*        canvas.drawLine(
            Offset(leftRightSpace + timeTextLength + spaceBtwTimeLine,
                touchEndYPosition),
            Offset(MediaQuery.of(mContext).size.width - leftRightSpace,
                touchEndYPosition),
            mTouchLinesPaint);*/
      }
    }
  }

  @override
  bool hitTest(Offset position) {
    /*   print("hit position" + position.toString());
    print("check condition " +
        position.dx.toString() +
        "  " +
        ((leftRightSpace + 42 + spaceBtwTimeLine)).toString() +
        "  " +
        (MediaQuery.of(mContext).size.width - leftRightSpace).toString());*/
    if (position.dx >= (leftRightSpace + 42 + spaceBtwTimeLine) &&
        position.dx <= (MediaQuery.of(mContext).size.width - leftRightSpace)) {
      //int selectYPosition = position.dy.toInt();
      //touchStartYPosition = position.dy;
//      print("updated start y axis : " + touchStartYPosition.toString());
    }

    return super.hitTest(position);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    Timeline timeLine = (oldDelegate as Timeline);
    /*print("isDragging : " +
        isDragging.toString() +
        " " +
        mTouchYPosition.toString());*/
    if (isDragging) {
      touchStartYPosition = mTouchYPosition + topSpace;
      if (timeLine.touchEndYPosition == -1) {
        touchEndYPosition = mTouchYPosition + timeSpace + topSpace;
      }
    } else {
      touchStartYPosition = timeLine.touchStartYPosition;
    }
    return true;
  }
}
