import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whoseturn/model/item.dart';
import 'package:flutter_whoseturn/util/toolbox.dart';

class ItemList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ItemListState();
}

class ItemListState extends State {
  ToolBox toolbox = ToolBox();
  List<Item> _items;

  @override
  Widget build(BuildContext context) {
    if (_items == null) this._items = getData();

    return Scaffold(
      body: todoListItems(),
      floatingActionButton: FloatingActionButton(
          onPressed: () =>
              debugPrint("pressed!"), //navigateToDetail(Todo('', 3, '')),
          // onPressed: () => helper.deleteTodo(870),
          // onPressed: () {
          //   DateTime today = DateTime.now();
          //   this
          //       .todos
          //       .add(Todo("Golang 2", 1, today.toString(), "Finish Class"));
          //   this
          //       .todos
          //       .add(Todo("Flutter 2", 2, today.toString(), "Finish Class"));
          // },
          tooltip: "Add new Todo",
          child: new Icon(Icons.add)),
    );
  }

  List<Item> getData() {
    List<Item> data = List<Item>();
    data.add(Item(0, "David", "David's Turn"));
    data.add(Item(1, "Lillian", "Lillian's Turn"));
    return data;
  }

  ListView todoListItems() {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: getColor(position),
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(this._items[position].id.toString()),
            ),
            title: Text(this._items[position].title),
            subtitle: Text(this._items[position].description),
            onTap: () {
              debugPrint("Tapped on " + this._items[position].id.toString());
              // navigateToDetail(this.todos[position]);
            },
          ),
        );
      },
    );
  }

  Color getColor(int position) {
    int turn = toolbox.getTurn(_items.length);
    // debugPrint(turn.toString() + " ?= " + position.toString());
    return turn == position ? Colors.white : Colors.lightBlue;
  }
}
