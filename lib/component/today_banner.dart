import 'package:flutter/material.dart';
import 'package:study_0513/const/colors.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDate;
  final int count;

  const TodayBanner({
    super.key,
    required this.selectedDate,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
    return Container(
      color: PRIMARY_COLOR,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedDate.year}년 ${selectedDate.month.toString().padLeft(2, '0')}월 ${selectedDate.day.toString().padLeft(2, '0')}일',
              style: textStyle,
            ),
            Text(
              '$count개',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
