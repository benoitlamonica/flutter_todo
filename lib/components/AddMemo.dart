import 'package:flutter/material.dart';
import 'package:flutter_todo/models/ToDo.dart';

class AddMemo extends StatefulWidget {
  AddMemo({Key key, this.actualise}) : super(key: key);
  final Function actualise;
  @override
  _AddMemoState createState() => _AddMemoState();
}

class _AddMemoState extends State<AddMemo> {
  String userStateMemo;

  void setUserMemo(String userMemo) {
    setState(() {
      userStateMemo = userMemo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Entrez le memo que vous voulez rajouter :"),
                TextField(
                  onChanged: (String value) {
                    print("Valeur input : $value");
                    setUserMemo(value);
                  },
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () async {
                int i = await ToDo.instance
                    .insert({ToDo.columnContent: userStateMemo});
                print("Numéro insert : $i");
                widget.actualise(userStateMemo);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      tooltip: 'Increment',
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.add),
    );
  }
}
