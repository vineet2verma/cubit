import 'package:cubic_state_mgmt2_list_of_map/add_page.dart';
import 'package:cubic_state_mgmt2_list_of_map/cubic/cubic_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubic/cubic_class.dart';

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Cubic List of Map"),
        centerTitle: true,
      ),

      body: BlocBuilder<ListCubit,CubicListState>(
        builder: (context, state) {
          var listofcubit = state.mData;
          if(state.isLoading){
            return Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("Loading Data"),
              ],
            ));
          }
          else {
            return ListView.builder(
              itemCount: listofcubit.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text("${listofcubit[index]['title']}"),
                    subtitle: Text("${listofcubit[index]['desc']}"),
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) {
                            return
                              NextPage(
                                isUpdate: true,
                                myindex: index,
                                title: '${listofcubit[index]["title"]}',
                                desc: '${listofcubit[index]["desc"]}',
                              );
                          },
                        ),
                      );
                    },
                    trailing: IconButton(
                      onPressed: () {
                        print("Delete Pressed");
                        BlocProvider.of<ListCubit>(context).deleteNote(index);
                      },
                      icon: Icon(Icons.delete,color: Colors.red,),
                    ),
                );
              },
            );
          }
          return Container(child: Center(child: Text("Data Base was Empty")),);



        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NextPage(),
              )
          )
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}