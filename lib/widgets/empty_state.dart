import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.description,
  });
  final String description;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/lotties/empty_state.json",
            height: MediaQuery.sizeOf(context).width * 0.7,
          ),
          const SizedBox(height: 25),
          Text(
            description,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
