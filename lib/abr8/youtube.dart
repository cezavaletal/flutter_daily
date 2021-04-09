import 'package:daily_flutter/abr8/yanimator.dart';
import 'package:flutter/material.dart';

class YoutubeScreen extends StatefulWidget {
  @override
  _YoutubeScreenState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late YoutubeScreenAnimator animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );

    animation = YoutubeScreenAnimator(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.controller,
      builder: (context, child) => Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(
              height: 64,
            ),
            Row(
              children: [
                Opacity(
                    opacity: animation.profileOpacity.value,
                    child: Container(
                      color: Colors.amber,
                      width: 100,
                      height: 100,
                      child: Center(
                        child: Text(
                          'Profile',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    )),
                SizedBox(
                  width: 24,
                ),
                Column(
                  children: [
                    Transform(
                      transform: Matrix4.translationValues(
                          animation.infoX.value, 0.0, 0.0),
                      child: Opacity(
                        opacity: animation.infoOpacity.value,
                        child: Container(
                          color: Colors.cyanAccent,
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text(
                              'Info',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          animation.buttonPop.value, 0.0, 0.0),
                      child: Container(
                        color: Colors.cyanAccent,
                        width: 100,
                        height: 100,
                        child: Center(
                          child: Text(
                            'BUTTON',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Opacity(
                            opacity: animation.placeHolderOpacity.value,
                            child: Container(
                              color: Colors.purpleAccent,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        )))
          ],
        ),
      ),
    );
  }
}
