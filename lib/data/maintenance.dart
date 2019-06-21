
class MaintenanctItem {
   String title;
   String desc;
   bool isExpanded;
   List<PanelContent> content;

  MaintenanctItem(json) {
    title = json['title'];
    desc = json['desc'];
    isExpanded = json['isExpanded'];

    content = [];

    if(json['content'] != null) {
      for (var item in json['content']) {
        content.add(PanelContent(item));
      }
    }
  }
  
}

class PanelContent {
  String name;

  PanelContent(json) {
    name = json['name'];
  }
}