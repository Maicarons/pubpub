import 'package:flutter/material.dart';

/// 加载动画组件
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text(
            '加载中...',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
