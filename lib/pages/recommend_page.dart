import 'package:flutter/material.dart';

class RecommendPage extends StatelessWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("RecommendPage build");
    return const Center(
      child: Text(
        "推荐",
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}

