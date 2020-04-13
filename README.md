# flutter_navigations_bar

A new Flutter package for navigations bar.

## Getting Started

![Alt Text](https://media.giphy.com/media/YQ56Lqk8iDXSUX2PYv/giphy.gif)





# Bouncing Circle navigation bar

### properties : 

1.  final double navbarHeight;
2.  final Color navBarColor;
3.  final List<CustomIcon> circleIcons;
4.  final List<CustomIcon> navBarIcons;
5.  final Color navBarUnselectedIconsColor;
6.  final Color navBarSelectedIconsColor;
7.  final Color circleIconsColor;
8.  final Duration duration;
9.  final List<Color> circleLayersColors;
10.  final double margin;
11.  final BorderRadius borderRadius;

### Example : 

```dart
 return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: CircleNavigationBar(
              circleIcons: [
                CustomIcon(icon: Icon(Icons.call), onPressed: () {}),
                CustomIcon(icon: Icon(Icons.message), onPressed: () {}),
                CustomIcon(icon: Icon(Icons.accessible), onPressed: () {}),
              ],
              navBarIcons: [
                CustomIcon(icon: Icon(Icons.home), onPressed: () {}),
                CustomIcon(
                    icon: Icon(Icons.supervised_user_circle), onPressed: () {}),
                CustomIcon(icon: Icon(Icons.settings), onPressed: () {}),
                CustomIcon(icon: Icon(Icons.exit_to_app), onPressed: () {}),
              ],
              margin: 16.0,
              borderRadius: BorderRadius.circular(16),
            ),
          )
        ],
      ),
    );
```

### 
