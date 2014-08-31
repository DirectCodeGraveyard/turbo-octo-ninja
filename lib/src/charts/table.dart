part of ninja.charts;

class DataTable {
  final js.JsObject _table;
  
  DataTable() : _table = createChartObject("DataTable");
  
  DataTable.from(List<List<dynamic>> input) : _table = createChartObject("DataTable") {
    addRows(input);
  }
  
  DataTable.existing(js.JsObject t) : _table = t;
  
  void addColumn(String type, String name) => _table.callMethod("addColumn", [type, name]);
  
  void addRows(List<List<dynamic>> rows) {
    var m = rows.map((it) {
      return new js.JsArray.from(it);
    }).toList();
    _table.callMethod("addRows", [new js.JsArray.from(m)]);
  }
  
  dynamic getValue(int row, int column) {
    return _table.callMethod("getValue", [row, column]);
  }
}