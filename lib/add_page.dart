import 'package:cubic_state_mgmt2_list_of_map/cubic/cubic_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NextPage extends StatelessWidget {

  bool isUpdate = false;
  int myindex;
  String title;
  String desc;

  NextPage({
    this.isUpdate = false,
    this.myindex = 0,
    this.title = "",
    this.desc = "",
  });

  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    titleController.text = title;
    descController.text = desc;

    return Scaffold(
      appBar: AppBar(
        title: Text(isUpdate ? "UPDATE NOTE PAGE":"ADD NOTE PAGE" ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: descController,
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)),
                )
            ),
          ),
          ElevatedButton(
              onPressed: () {
                var mytitle = titleController.text.toString();
                var mydesc = descController.text.toString();

                print("Chk 0");

                if (mytitle.isNotEmpty && mydesc.isNotEmpty) {
                  print("Chk 1");
                  if (isUpdate == false) {
                    print("Chk 2 update  ${isUpdate} ");
                    BlocProvider.of<ListCubit>(context).addNote({
                      "title" : mytitle,
                      "desc" : mydesc
                    });
                  }
                  else
                  {
                    print("Chk 3 update ${isUpdate} ");
                    BlocProvider.of<ListCubit>(context).updateNote(
                        {
                          "title": mytitle,
                          "desc": mydesc,
                        },
                        myindex
                    );
                  };

                };
                Navigator.pop(context);
                print("Update ${isUpdate}  title ${mytitle} desc ${mydesc}");
              },
              child: Text(isUpdate ? "Update" : "Add")),

        ],
      ),
    );
  }
}
