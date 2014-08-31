part of ninja.charts;

class ChartWrapper {
  final js.JsObject _w;


  ChartWrapper(String chartType) : _w = createChartObject("ChartWrapper") {
    setChartType(chartType);
  }

  ChartWrapper.existing(this._w);

  void draw() => _w.callMethod("draw");

  DataTable getDataTable() => new DataTable.existing(_w.callMethod("getDataTable"));
  void setDataTable(DataTable table) => _w.callMethod("setDataTable", [table._table]);
  
  String getContainerId() => _w.callMethod("getContainerId");
  void setContainerId(String value) => _w.callMethod("setContainerId", [value]);
  
  String getChartType() => _w.callMethod("getChartType");
  void setChartType(String value) => _w.callMethod("setChartType", [value]);
}

class ChartEditor {
  js.JsObject _e;

  ChartEditor() : _e = createChartObject("ChartEditor");

  void open(ChartWrapper w) {
    _e.callMethod("openDialog", [w._w]);
  }

  void close() {
    _e.callMethod("closeDialog");
  }

  ChartWrapper getChartWrapper() => new ChartWrapper.existing(_e.callMethod("getChartWrapper"));

  void ok(void handler([_])) {
    js.context['google']['visualization']['events'].callMethod("addListener", [_e, "ok", new js.JsFunction.withThis((self, event) {
        handler();
    })]);
  }
}
