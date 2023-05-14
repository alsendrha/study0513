// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:study_0513/component/schedule_bottom_sheet2.dart';
// import 'package:study_0513/component/schedule_card.dart';
// import 'package:study_0513/component/today_banner.dart';
// import 'package:study_0513/const/colors.dart';
// import 'package:study_0513/component/main_calendar.dart';
// import 'package:study_0513/provider/schedule_provider.dart';

// class HomeScreen2 extends StatelessWidget {
//   const HomeScreen2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final provider = context.watch<ScheduleProvider>();
//     final selectedDate = provider.selectedDate;
//     final schedules = provider.cache[selectedDate] ?? [];
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: PRIMARY_COLOR,
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             isDismissible: true,
//             builder: (_) => ScheduleBottomSheet2(
//               selectedDate: selectedDate,
//             ),
//             isScrollControlled: true,
//           );
//         },
//         child: const Icon(
//           Icons.add,
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             MainCalender(
//               selectedDate: selectedDate,
//               onDaySelected: (selectedDate, focusedDate) =>
//                   onDaySelected(selectedDate, focusedDate, context),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             TodayBanner(
//               selectedDate: selectedDate,
//               count: schedules.length,
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: schedules.length,
//                 itemBuilder: (context, index) {
//                   final schedule = schedules[index];

//                   return Dismissible(
//                     key: ObjectKey(schedule.id),
//                     direction: DismissDirection.startToEnd,
//                     onDismissed: (direction) {
//                       provider.deleteSchedule(
//                           date: selectedDate, id: schedule.id);
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                         bottom: 8,
//                         left: 8,
//                         right: 8,
//                       ),
//                       child: ScheduleCard(
//                         startTime: schedule.startTime,
//                         endTime: schedule.endTime,
//                         content: schedule.content,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void onDaySelected(
//       DateTime selectedDate, DateTime focusedDate, BuildContext context) {
//     try {
//       final provider = context.read<ScheduleProvider>();
//       provider.changeSelectedDate(
//         date: selectedDate,
//       );
//       provider.getSchedules(date: selectedDate);
//     } catch (error) {
//       print('error : $error');
//     }
//   }
// }
