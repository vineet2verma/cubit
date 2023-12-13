import 'dart:async';
import 'dart:math';

import 'package:cubic_state_mgmt2_list_of_map/cubic/cubic_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountereCubit extends Cubit<CubicCounterState> {
  CountereCubit() : super(CubicCounterState(count: 0));

  void increment() {
    emit(CubicCounterState(count: state.count + 1));
  }

  void decrement() {
    emit(CubicCounterState(count: state.count - 1));
  }
}

//  List of Map with Cubit

class ListCubit extends Cubit<CubicListState> {
  ListCubit() : super(CubicListState(mData: []));

  // Events
  // add Note
  void addNote(Map<String, dynamic> newNote) {
    emit(CubicListState(mData: state.mData, isLoading: true));
    var random = Random().nextInt(100);
    print("random no ${random} and ${state.isLoading}");
    Timer(Duration(seconds: 3), () {
        if (random % 5 == 0) {
          emit(CubicListState(mData: state.mData, isLoading: false, isError: true, errorMsg: "Data Not Added"));
          print("chk 1  ${state.isLoading}");
        } else {
          var currData = state.mData;
          currData.add(newNote);
          emit(CubicListState(mData: currData, isLoading: false, isError: false));
          print("chk 2  ${state.isLoading}");
        }
      },
    );
  }

  // Update Event
  void updateNote(Map<String, dynamic> updateNote, int index) async {
    var currData = await state.mData;
    currData[index] = updateNote;
    emit(CubicListState(mData: currData));
  }

  // Delete Event
  void deleteNote(int index) async {
    var currData = await state.mData;
    currData.removeAt(index);
    emit(CubicListState(mData: currData));
  }

// Read Event

}
