import 'dart:async';

import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  void Function({required String todoText}) addTodo;
  AddTodo({super.key, required this.addTodo});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController todoText =
      TextEditingController(); // lấy giá trị người dùng nhập vào
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Add to do:"),
        TextField(
          autofocus: true, //nhay vao text field luon ngay khi bottomsheet nhay ra
          controller: todoText,

          decoration: InputDecoration(
            hintText: "Write your todo here",
            contentPadding: EdgeInsets.all(5),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (todoText.text.isNotEmpty) {
              widget.addTodo(todoText: todoText.text);
            } else {}
            todoText.text =
                ''; //whenever we are working with a stateful widget we cannot directly access the property of this class
          },
          child: Text("Add"),
        ),
      ],
    );
  }
}
