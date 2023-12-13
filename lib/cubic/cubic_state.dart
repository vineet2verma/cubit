
class CubicCounterState {
  int count;
  CubicCounterState({required this.count});
}

class CubicListState{
  List<Map<String,dynamic>> mData;
  bool isLoading;
  bool isError;
  String errorMsg;
  CubicListState({
    required this.mData,
    this.isLoading = false,
    this.isError = false,
    this.errorMsg = ''
  });

}