import "dart:html";
import "package:github/browser.dart";
import "../lib/ninja.dart";

void main() {
  onReady.listen(load);
  
  init();
}

void load([_]) {
  var table = new DataTable();
  
  table.addColumn("string", "Language");
  table.addColumn("number", "Bytes");
  
  var e = querySelector("#chart");
  
  var repo = new RepositorySlug("dart-lang", "bleeding_edge");
  
  querySelector("#repo").appendText(repo.fullName);
  
  github.languages(repo).then((breakdown) {
    table.addRows(breakdown.toList());
    
    print("Creating Chart Wrapper");
    var c = new ChartWrapper("PieChart");
    
    print("Creating Chart Editor");
    var editor = new ChartEditor();
    
    print("Setting Data Table");
    
    c.setDataTable(table);
    c.setContainerId("chart");
    
    c.draw();
    
    querySelector("#open-editor").onClick.listen((event) {
      editor.open(c);
    });
    
    document.onResize.listen((e) {
      c.draw();
    });
    
    editor.ok(([_]) {
      c = editor.getChartWrapper();
      c.draw();
    });
  });
}
