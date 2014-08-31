library ninja;

import "package:github/browser.dart";
import "dart:html";
import "dart:async";

import "charts.dart";
export "charts.dart";

GitHub github;

final StreamController _ready_controller = new StreamController();

Stream<bool> onReady = _ready_controller.stream;

void init() {
  initGitHub();
  initCharts();
  
  onChartsReady.listen((it) => _ready_controller.add(true));
  
  github = new GitHub(auth: new Authentication.withToken("8f73d048e7d440bca2b578ab37012c057d2fc533"));
}