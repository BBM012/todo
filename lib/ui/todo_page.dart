import 'package:flutter/material.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/ui/widget/todo_card.dart';

class TodoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodopageState();
  }
}

class _TodopageState extends State<TodoPage> {
  List<Model> todos = [
    Model(
        title: 'Позавтракать',
        desc: 'Я хочу сегодня пораньше встать',
        done: true),
    Model(
        title: 'Идти на работу',
        desc: ' Я хочу сегодня пораньше встать',
        done: true),
    Model(
        title: 'Пообедать',
        desc: 'Я хочу сегодня пораньше уснуть и не опоздать на первую пару ',
        done: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Search',
              hintText: '',
            ),
          ),
          //     Container(

          //       width: 325,
          //       height: 100,
          //  decoration: BoxDecoration(
          //   color: Colors.blueAccent,
          //   borderRadius: BorderRadius.circular(20),
          //  ),
          //     ),
          if (todos.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return TodoCardWidget(
                      model: todos[index],
                      onDelete: () {
                        setState(() {
                          todos.removeAt(index);
                        });
                        //todos.removeAt(index);
                      });
                },
              ),
            ),

          // Container(
          //   width: 325,
          //   height: 90,
          //   decoration: BoxDecoration(
          //     color: Colors.blueAccent,
          //     borderRadius: BorderRadius.circular(20),

          //   ),

          // ),

          //ListView.builder(itemBuilder:)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var title;
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Container(
                    child: Column( mainAxisSize: MainAxisSize.max, children: [
                  Text('Добавить задачу'),
                  TextField(
                    onChanged: (String value) {
                      title = value;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        todos.add(Model(title: title, desc: '', done: false));
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Добавить',
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ]));
              });
        },
        backgroundColor: Color(0xff5566ff),
        child: Icon(Icons.add),
      ),
    );
  }
}
