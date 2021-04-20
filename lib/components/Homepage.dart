import 'package:flutter/material.dart';
import 'package:flutter_todo/components/AddMemo.dart';
import 'package:flutter_todo/components/Remind.dart';
import 'package:flutter_todo/components/RemindHandler.dart';
import 'package:flutter_todo/models/ToDo.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var newTodos;
  int remindChanged;

  Future<List> getReminders() async {
    final reminders = await ToDo.instance.queryAll();
    // List<Widget> retArr = [];
    // reminders.forEach((element) {
    //   int id = element['id'];
    //   var isDone = element['is_done'] == 0 ? false : true;
    //   retArr.add(Remind(id: id, text: element['content'], done: isDone));
    // });
    // var test = retArr;
    // print(test);
    return reminders;
  }

  void actualiseTodos(newContent) {
    setState(() {
      newTodos = newContent;
    });
  }

  void actualiseRemind(id) {
    setState(() {
      remindChanged = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Vos reminders :",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Voici les différents reminders",
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
            ),
            FutureBuilder(
                future: getReminders(),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  switch (snapshot.connectionState) {
                    case (ConnectionState.waiting):
                      return Text("Waiting");
                    default:
                      if (snapshot.hasError)
                        return Text("Error : ${snapshot.error}");
                      else
                        return RemindHandler(
                          reminders: snapshot.data,
                          callBack: actualiseRemind,
                        );
                  }
                })
          ],
        ),
      ),
      floatingActionButton: AddMemo(
        actualise: actualiseTodos,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
