import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  List<String> todoList;
  void Function(int index) removeData;
  TodoList({super.key, required this.todoList, required this.removeData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //can phai nho tat ca khi thao tac voi listview
      itemCount: todoList.length,

      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          //no giong thg Inkwell co' ontap
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                //inside of this on tap I want to open up a bottom sheet
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),

                  child: ElevatedButton(
                    //day la remove 1 index list nao do
                    onPressed: () {
                      removeData(index); // when update or remove thi` update local data function will get called and our to do list will be saved in this to do list key.
                      Navigator.pop(
                        context,
                      ); //phan popup se tu dong dong' khi ket thuc su kien onpressed
                    },
                    child: Text("Mark as done!"),
                  ),
                );
              },
            );
          },
          title: Text(todoList[index]),

          // trailing: Icon(Icons.arrow_back), // placed at the right side.
          // leading: Icon(Icons.arrow_back), //placed in front of this title using leading
        ); //automatically manage spacing and padding for the list contents.
      },
    );
  }
}

// class TodoListBuilder extends StatefulWidget {
//   List<String> todoList;
//   void Function() updateLocalData;

//   TodoListBuilder({
//     super.key,
//     required this.todoList,
//     required this.updateLocalData,
//   });

//   @override
//   State<TodoListBuilder> createState() => _TodoListBuilderState();
// }

// class _TodoListBuilderState extends State<TodoListBuilder> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       //can phai nho tat ca khi thao tac voi listview
//       itemCount: widget.todoList.length,

//       itemBuilder: (BuildContext context, int index) {
//         return ListTile(
//           //no giong thg Inkwell co' ontap
//           onTap: () {
//             showModalBottomSheet(
//               context: context,
//               builder: (context) {
//                 //inside of this on tap I want to open up a bottom sheet
//                 return Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.all(20),

//                   child: ElevatedButton(
//                     //day la remove 1 index list nao do
//                     onPressed: () {
//                       setState(() {
//                         widget.todoList.removeAt(index);
//                       });
//                       widget
//                           .updateLocalData(); // when update or remove thi` update local data function will get called and our to do list will be saved in this to do list key.
//                       Navigator.pop(
//                         context,
//                       ); //phan popup se tu dong dong' khi ket thuc su kien onpressed
//                     },
//                     child: Text("Mark as done!"),
//                   ),
//                 );
//               },
//             );
//           },
//           title: Text(widget.todoList[index]),

//           // trailing: Icon(Icons.arrow_back), // placed at the right side.
//           // leading: Icon(Icons.arrow_back), //placed in front of this title using leading
//         ); //automatically manage spacing and padding for the list contents.
//       },
//     );
//   }
// }
