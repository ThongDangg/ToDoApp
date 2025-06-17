import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/addTodo.dart';
import 'package:todoapp/widgets/todoList.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  //share pref la luu vao o cung cua dt, du lieu luu vao o cung thi van con do
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> todoList = [];

  void addTodo({required String todoText}) {
    if (todoList.contains(todoText)) {
      //Cach su dung alert
      showDialog(
        context: context,
        builder: (context) {
          //showdialog
          return AlertDialog(
            title: Text("Already exists"),
            content: Text("This to do data is already exist"),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text("Close"),
              ),
            ],
          );
        },
      );

      return;
    }

    setState(() {
      // todoList.add(todoText);
      //hoac
      todoList.add(todoText);
      updateLocalData(); // sau khi state add thi cap nhat du lieu
    });

    Navigator.pop(context); //sau khi nhap du lieu thi close pop up
  }

  void updateLocalData() async {
    //tao luu tru data cho viec cap nhat du lieu
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      'todoList',
      todoList,
    ); //await danh` cho ham` bat dong` bo.,
  }

  void removeData(int indx) async {
    //tao luu tru data cho viec cap nhat du lieu
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      todoList.removeAt(indx);
    });
    await prefs.setStringList(
      'todoList',
      todoList,
    ); //await danh` cho ham` bat dong` bo.,
  }

  void loadData() async {
    //giu lai tat ca du lieu da dc update sau khi reload lai app
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    todoList = (prefs.getStringList("todoList") ?? []).toList();
    setState(() {});
  }

  @override
  void initState() {
    //Khi load data buộc phải có initState
    super.initState();

    loadData(); //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Text("Drawer data"),
      ), //thg drawer nay co san trong scaffold
      appBar: AppBar(
        centerTitle: true,
        title: Text("Todo App"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    //lấy con text của BuildContext, cái này để tạo cái page nhướn lên khi bấm vào dấu +
                    return Padding(
                      padding: MediaQuery.of(
                        context,
                      ).viewInsets, // bang cach boc container = padding va them dong nay our bottom sheet will automatically have the padding according to the height of this keyboard.
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 300,
                        child: AddTodo(addTodo: addTodo),
                      ),
                    );
                  },
                );
              },
              child: Icon(Icons.add),
            ), //muon bien' thg icon la interactive element duoc thi boc no lai bang widget co ten la gesturedetector
          ),
        ],
      ),
      body: TodoList(todoList: todoList, removeData: removeData),
    );
  }
}
