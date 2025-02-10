// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo/model/todo_model.dart';

class TodoCardWidget extends StatefulWidget {
  Model model;
  Function() onDelete;
  TodoCardWidget({Key? key, required this.model, required this.onDelete})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TodoCardWidget();
  }
}

class _TodoCardWidget extends State<TodoCardWidget> {
  @override
  Widget build(BuildContext context) {
    // showDialog(context: context, builder: (context){
    //    return Dialog(child: InkWell(onTap: widget.onDelete,),);
    //  });
    return Container(
      alignment: Alignment(0.5, 1.0),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(9),
      // width: 90,
      // height: 325,
      decoration: BoxDecoration(
        color: Color(0xff5566ff),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(widget.model.title)),
              Checkbox(
                value: widget.model.done,
                onChanged: (v) {
                  setState(() {
                    widget.model.done = v!;
                  });
                },
              ),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                              child: Container(
                            // width: 70,
                            // height: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('ВНИМАНИЕ!', style: TextStyle(fontWeight: FontWeight.w600),),
                                Text('Вы действительно хотите удалить?'),
                                Row( 
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [ 
                                    InkWell( onTap: () {
                                      Navigator.pop(context);
                                    },
                                      child: Container(

                                        alignment: Alignment.center,
                                        child: Text('Отменить',style: TextStyle(fontWeight: FontWeight.w400),),
                                        width: 119,
                                        height: 35,
                                        decoration: BoxDecoration (border: Border.all( color: Colors.red),
                                        
                                         borderRadius: BorderRadius.circular(10)),
                                        
                                      ),
                                    ),
                                    InkWell( onTap: () {
                                      Navigator.pop(context);
                                      widget.onDelete();

                                    },
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text('Удалить',style: TextStyle(fontSize: 14),),
                                        width: 119,
                                        height: 35,
                                        decoration: BoxDecoration(
                                         border: Border.all(color: Colors.green),
                                          
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ));
                        });
                  },
                  icon: Icon(Icons.delete, color: Colors.white,)),
                  
              Icon(Icons.edit,color: Colors.white,),
              
            ],
          ),
          Text(widget.model.desc),
        ],
      ),
    );
  }
}
