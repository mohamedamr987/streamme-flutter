import 'package:flutter/material.dart';
import 'package:streamme/widgets/general_text.dart';

class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const EmptyStateWidget({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,),
        Container(
          width: 84,
          height: 84,
          decoration: const BoxDecoration(
            color: Color(0xFFEFEDF7),
            shape: BoxShape.circle,
          ),
          child: Image.asset("assets/images/empty_trophy.png", height: 40, width: 40,),
        ),
        const SizedBox(height: 20,),
        GeneralText(text: title, size: 16, fontWeight: FontWeight.w600, textAlign: TextAlign.center,),
        const SizedBox(height: 10,),
        GeneralText(text: subtitle, size: 12, color: const Color(0xFF8F8E91), textAlign: TextAlign.center,),
      ],
    );
  }
}
