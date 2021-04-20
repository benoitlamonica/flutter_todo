import 'package:flutter/material.dart';
import 'package:flutter_todo/models/ToDo.dart';

class Remind extends StatelessWidget {
  const Remind({Key key, this.id, this.text, this.done, this.callBack})
      : super(key: key);
  final int id;
  final String text;
  final bool done;
  final Function callBack;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 4,
        bottom: 4,
      ),
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: done ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    child: Text(
                      done ? "Fait" : "A faire",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                if (done) {
                  print(ToDo.instance.delete(id));
                } else {
                  print(ToDo.instance
                      .update({ToDo.columnId: id, ToDo.columnDone: 1}));
                }
                callBack(id);
              },
              child: done ? Text('Delete') : Text("Done"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
