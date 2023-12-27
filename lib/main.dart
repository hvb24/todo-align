import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Todo {
  String text;
  Color textColor;

  Todo({
    required this.text,
    required this.textColor,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  TextEditingController _textEditingController = TextEditingController();
  Color _selectedColor = Colors.black;
  List<Todo> _todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8768E),


      body: Center(
        child: Container(

          height: 500,
          width: 600,
          padding: EdgeInsets.all(20),


          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 7,
                offset: Offset(0, 3), // changes the position of the shadow
              ),
            ],

            borderRadius: BorderRadius.circular(15),


            color: Colors.white,
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Task Remain',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 15),),

                  ],
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: _todos.length,
                  itemBuilder: (context, index) {
                    Todo todo = _todos[index];
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(

                        children: [
                          Checkbox(value: false, onChanged: (val){}),
                    SizedBox(width: 100),
                    Container(
                      width: 200,

                      child: Text(todo.text, style: TextStyle(color: todo.textColor),),
                    ),
                          SizedBox(width: 100),

                          ElevatedButton(onPressed: (){}, child: Text('Delete',style: TextStyle(color: Colors.black),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),)
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          hintText: 'Enter your todo...',
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    DropdownButton<Color>(
                      value: _selectedColor,
                      onChanged: (Color? value) {
                        setState(() {
                          _selectedColor = value!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          value: Colors.black,
                          child: Text('Black'),
                        ),
                        DropdownMenuItem(
                          value: Colors.red,
                          child: Text('Red'),
                        ),
                        DropdownMenuItem(
                          value: Colors.blue,
                          child: Text('Blue'),
                        ),
                        DropdownMenuItem(
                          value: Colors.orange,
                          child: Text('orange'),
                        ),DropdownMenuItem(
                          value: Colors.pinkAccent,
                          child: Text('PinkAccent'),
                        ),DropdownMenuItem(
                          value: Colors.yellow,
                          child: Text('Yellow'),
                        ),
                        // Add more color options as needed
                      ],
                    ),
                    SizedBox(width: 8.0),
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                      onPressed: () {
                        _addTodo();
                      },
                      child: Text('Add',style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addTodo() {
    if (_textEditingController.text.isNotEmpty) {
      Todo newTodo = Todo(
        text: _textEditingController.text,
        textColor: _selectedColor,
      );

      setState(() {
        _todos.add(newTodo);
        _textEditingController.clear();
      });
    }
  }
}
