import 'package:flutter/material.dart';
import 'dart:async';

class ScrollingText extends StatefulWidget {
  @override
  _ScrollingTextState createState() => _ScrollingTextState();
}

class _ScrollingTextState extends State<ScrollingText> {
  ScrollController _scrollController = ScrollController();
  Timer? _timer;
  double _scrollSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _startScrolling();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startScrolling() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 5000),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 10),
            child: Text(
              'Utilize o cupom DROP para receber 15% de desconto!',
              style: TextStyle(color: Colors.yellowAccent),
            ),
          ),
        ],
      ),
    );
  }
}
