part of ninja.charts;

StreamController _ready_controller = new StreamController();

Stream onChartsReady = _ready_controller.stream;


js.JsObject createChartObject(String name, [List<dynamic> args = const []]) {
  return new js.JsObject(js.context['google']['visualization'][name], args);
}

void initCharts() {
  js.context['Ninja_Charts_Ready'] = new js.JsFunction.withThis((js.JsObject self, js.JsObject event) {
    print("Charts API Ready");
    _ready_controller.add(true);
  });
}
