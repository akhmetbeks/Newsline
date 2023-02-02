import 'package:flutter/material.dart';
import 'package:newsline/constants.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.pageColor,
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.textColor,
          ),
        ),
      ),
    );
  }
}
