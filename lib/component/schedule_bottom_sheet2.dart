import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_0513/component/custom_text_field.dart';
import 'package:study_0513/const/colors.dart';
import 'package:study_0513/model/schedule_model.dart';
import 'package:study_0513/provider/schedule_provider.dart';

class ScheduleBottomSheet2 extends StatefulWidget {
  final DateTime selectedDate;

  const ScheduleBottomSheet2({
    super.key,
    required this.selectedDate,
  });

  @override
  State<ScheduleBottomSheet2> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet2> {
  final GlobalKey<FormState> formKey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Form(
      key: formKey,
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height / 2 + bottomInset,
          color: Colors.white,
          child: Padding(
            padding:
                EdgeInsets.only(left: 8, right: 8, top: 8, bottom: bottomInset),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: '시작 시간',
                        isTime: true,
                        onSaved: (newValue) {
                          startTime = int.parse(newValue!);
                        },
                        validator: timeValidator,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: CustomTextField(
                        label: '종료 시간',
                        isTime: true,
                        onSaved: (newValue) {
                          endTime = int.parse(newValue!);
                        },
                        validator: timeValidator,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: CustomTextField(
                    label: '내용',
                    isTime: false,
                    onSaved: (newValue) {
                      content = newValue;
                    },
                    validator: contentValidator,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => onSavePressed(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PRIMARY_COLOR,
                    ),
                    child: const Text('저장'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSavePressed(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      context.read<ScheduleProvider>().createSchedule(
            schedule: ScheduleModel(
              id: 'new_model',
              content: content!,
              date: widget.selectedDate,
              startTime: startTime!,
              endTime: endTime!,
            ),
          );

      if (!mounted) return;
      Navigator.pop(context);
    }
  }

  String? timeValidator(String? val) {
    if (val == null) {
      return '값을 입력해주세요';
    }
    int? number;

    try {
      number = int.parse(val);
    } catch (error) {
      print('error : $error');
      return '숫자를 입력해주세요';
    }

    if (number < 0 || number > 24) {
      return '0시부터 24시 사이를 입력해주세요';
    }

    if (number < 0 || number > 24) {
      return '0시부터 24시 사이를 입력해주세요';
    }

    return null;
  }

  String? contentValidator(String? val) {
    if (val == null || val.isEmpty) {
      return '값을 입력해주세요';
    }
    return null;
  }
}
