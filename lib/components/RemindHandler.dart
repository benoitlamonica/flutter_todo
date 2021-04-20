import 'package:flutter/material.dart';
import 'package:flutter_todo/components/Remind.dart';

class RemindHandler extends StatelessWidget {
  const RemindHandler({Key key, this.reminders, this.callBack})
      : super(key: key);
  final List<Map<String, dynamic>> reminders;
  final Function callBack;
  @override
  Widget build(BuildContext context) {
    void callBackFunction(id) {
      callBack(id);
    }

    return Container(
      child: Flexible(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: reminders.length,
          itemBuilder: (BuildContext context, int i) {
            return Remind(
              id: reminders[i]['id'],
              done: reminders[i]['is_done'] == 1 ? true : false,
              text: reminders[i]['content'],
              callBack: callBackFunction,
            );
          },
        ),
      ),
    );
  }
}
