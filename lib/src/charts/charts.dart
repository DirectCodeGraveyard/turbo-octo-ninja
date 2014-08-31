part of ninja.charts;

class ChartSelectedItem {
  
  final js.JsObject _item;
  
  ChartSelectedItem(this._item);
  
  int get row  => _item['row'];
  int get column => _item['column'];
}

class Chart {
  js.JsObject _chart;

  Chart(String name, Element e) : _chart = createChartObject(name, [new js.JsObject.fromBrowserObject(e)]);

  void draw(DataTable table, ChartOptions options) {
    var opts = new js.JsObject.jsify(options.map);
    _chart.callMethod("draw", [table._table, opts]);
  }

  void addEventListener(String name, EventListener listener) {
    js.context['google']['visualization']['events'].callMethod("addEventListener", [_chart, name, new js.JsFunction.withThis((a, e) => listener(e))]);
  }
  
  List<ChartSelectedItem> getSelected() {
    return _chart.callMethod("getSelected").map((it) {
      return new ChartSelectedItem(it);
    }).toList();
  }
}

class ChartOptions {
  final Map map;

  ChartOptions([Map m]) : map = m == null ? {} : m;

  dynamic operator [](String name) => map[name];
  operator []=(String name, dynamic value) => map[name] = value;
}

class PieChart extends Chart {
  PieChart(Element e) : super("PieChart", e);
}

class BarChart extends Chart {
  BarChart(Element e) : super("BarChart", e);
}

class OrgChart extends Chart {
  OrgChart(Element e) : super("OrgChart", e);
}