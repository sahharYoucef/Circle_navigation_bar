import './painter.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CircleNavigationBar extends StatefulWidget {
  final double navbarHeight;
  final Color navBarColor;
  final List<CustomIcon> circleIcons;
  final List<CustomIcon> navBarIcons;
  final Color navBarUnselectedIconsColor;
  final Color navBarSelectedIconsColor;
  final Color circleIconsColor;
  final Duration duration;
  final List<Color> circleLayersColors;
  final double margin;
  final BorderRadius borderRadius;

  const CircleNavigationBar(
      {Key key,
      this.navbarHeight = 80,
      @required this.circleIcons,
      @required this.navBarIcons,
      this.navBarUnselectedIconsColor = const Color(0xff9d9fa1),
      this.navBarSelectedIconsColor = const Color(0xff000000),
      this.circleIconsColor = const Color(0xff9d9fa1),
      this.duration = const Duration(milliseconds: 500),
      this.circleLayersColors = const <Color>[
        Colors.red,
        Colors.blue,
        Colors.white,
      ],
      this.margin = 16.0,
      this.borderRadius,
      this.navBarColor = Colors.white})
      : super(key: key);
  @override
  _CircleNavigationBarState createState() => _CircleNavigationBarState();
}

class _CircleNavigationBarState extends State<CircleNavigationBar>
    with TickerProviderStateMixin {
  AnimationController _rotationController;
  Animation<double> _animation;
  double height = 185;
  double navBarHeight = 80;
  int selected = 0;

  @override
  void initState() {
    _rotationController =
        AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _rotationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.decelerate));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        height: height,
        width: constraints.maxWidth,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              bottom: widget.navbarHeight - 90,
              child: AnimatedBuilder(
                animation: _rotationController,
                builder: (context, child) => IgnorePointer(
                  ignoring: _rotationController.value == 0.0,
                  child: CustomPaint(
                    size: Size(180, 180),
                    painter: CirclesPainter(_animation,
                        colors: widget.circleLayersColors),
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
                animation: _rotationController,
                builder: (context, child) => Positioned(
                      bottom: widget.navbarHeight - 90,
                      child: IgnorePointer(
                        ignoring: _rotationController.value == 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          height: 180,
                          width: 180,
                          child: Stack(
                            children: <Widget>[
                              Align(
                                  alignment: Alignment(
                                    ((75) / 90) *
                                        cos((pi *
                                                2 /
                                                6 *
                                                (6 + 3 * _animation.value)) +
                                            pi / 6),
                                    ((75) / 90) *
                                        sin((pi *
                                                2 /
                                                6 *
                                                (6 + 3 * _animation.value)) +
                                            pi / 6),
                                  ),
                                  child: IconButton(
                                      icon: widget.circleIcons[0].icon,
                                      color: widget.circleIconsColor,
                                      onPressed:
                                          widget.circleIcons[0].onPressed)),
                              Align(
                                  alignment: Alignment(
                                    ((75) / 90) *
                                        cos((pi *
                                                2 /
                                                6 *
                                                (1 + 3 * _animation.value)) +
                                            pi / 6),
                                    ((75) / 90) *
                                        sin((pi *
                                                2 /
                                                6 *
                                                (1 + 3 * _animation.value)) +
                                            pi / 6),
                                  ),
                                  child: IconButton(
                                      icon: widget.circleIcons[1].icon,
                                      color: widget.circleIconsColor,
                                      onPressed:
                                          widget.circleIcons[1].onPressed)),
                              Align(
                                  alignment: Alignment(
                                    ((75) / 90) *
                                        cos((pi *
                                                2 /
                                                6 *
                                                (2 + 3 * _animation.value)) +
                                            pi / 6),
                                    ((75) / 90) *
                                        sin((pi *
                                                2 /
                                                6 *
                                                (2 + 3 * _animation.value)) +
                                            pi / 6),
                                  ),
                                  child: IconButton(
                                      icon: widget.circleIcons[2].icon,
                                      color: widget.circleIconsColor,
                                      onPressed:
                                          widget.circleIcons[2].onPressed)),
                            ],
                          ),
                        ),
                      ),
                    )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: navBarHeight,
                margin: EdgeInsets.symmetric(horizontal: widget.margin),
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                    color: widget.navBarColor,
                    borderRadius: widget.borderRadius,
                    boxShadow: [
                      BoxShadow(color: Colors.black38, blurRadius: 10)
                    ]),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ...List.generate(widget.navBarIcons.length, (index) {
                      if (index ==
                          (widget.navBarIcons.length - 1).floor() / 2) {
                        return SizedBox(
                          width: 30,
                        );
                      } else {
                        return IconButton(
                          icon: widget.navBarIcons[index].icon,
                          onPressed: () {
                            setState(() {
                              selected = index;
                            });
                            widget.navBarIcons[index].onPressed();
                          },
                          color: selected == index
                              ? widget.navBarSelectedIconsColor
                              : widget.navBarUnselectedIconsColor,
                        );
                      }
                    })
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: navBarHeight - 30,
              child: GestureDetector(
                onTap: () {
                  if (_rotationController.status == AnimationStatus.completed) {
                    _rotationController.reverse();
                  } else if (_rotationController.status ==
                      AnimationStatus.dismissed) {
                    _rotationController.forward();
                  }
                },
                child: AddButton(
                  animationController: _rotationController,
                  animation: _animation,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddButton extends StatefulWidget {
  final AnimationController animationController;
  final Animation animation;

  const AddButton({Key key, this.animationController, this.animation})
      : super(key: key);
  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: widget.animationController,
        builder: (context, child) => Transform.rotate(
          angle: 3.14 / 2 * 3 * widget.animation.value,
          child: CustomPaint(
            painter: HexagonePainter(),
            size: Size(60, 60),
            child: Container(
              height: 60,
              width: 60,
              child: AnimatedSwitcher(
                duration: widget.animationController.duration,
                child: widget.animationController.value > 0.5
                    ? Icon(
                        Icons.close,
                        size: 50,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.add,
                        size: 50,
                        color: Colors.white,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomIcon {
  Widget icon;
  Function onPressed;

  CustomIcon({@required this.icon, @required this.onPressed});
}
