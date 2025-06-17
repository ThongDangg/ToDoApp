import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  List<String> todoList;
  void Function(int index) removeData;
  TodoList({super.key, required this.todoList, required this.removeData});

  void onItemClicked({required BuildContext context, required int index}) {
    //với stateless bạn không thể dùng trực tiếp context ngoài hàm build() hoặc callback vì context chỉ tồn tại trong build() và các hàm callback như onTap.
    //nên phải truyền buildcontext context vào hàm để nó nhận context là 1 tham số

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
              removeData(
                index,
              ); // when update or remove thi` update local data function will get called and our to do list will be saved in this to do list key.
              Navigator.pop(
                context,
              ); //phan popup se tu dong dong' khi ket thuc su kien onpressed
            },
            child: Text("Mark as done!"),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return (todoList.isEmpty)
        ? Center(child: Text("No items on your todo list"))
        : ListView.builder(
            //? : là if else đó
            //can phai nho tat ca khi thao tac voi listview
            itemCount: todoList.length,
            
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  direction: DismissDirection.startToEnd,
                  key: UniqueKey(),
                  
                  background: Container(color: Colors.green , child: Row(
                    children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.check),
                    )
                  ],),),

                //swipe để xóa
                onDismissed: (direction) {//truyền tham số vô như callback function
                  removeData(index); 
                },
        
                child: ListTile(
                  //no giong thg Inkwell co' ontap
                  onTap: () {
                    onItemClicked(context: context, index: index);
                  },
                  title: Text(todoList[index]),

                  // trailing: Icon(Icons.arrow_back), // placed at the right side.
                  // leading: Icon(Icons.arrow_back), //placed in front of this title using leading
                ),
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
