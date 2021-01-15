class ToolBox {
  int getTurn(int count) {
    int dif = DateTime.now().difference(DateTime(1970, 0, 0)).inDays;
    return dif % count;
  }
}
