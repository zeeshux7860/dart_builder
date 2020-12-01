class Test {
  Menu menu;

  Test({this.menu});

  Test.fromJson(Map<String, dynamic> json) {
    menu = json['menu'] != null ? new Menu.fromJson(json['menu']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.menu != null) {
      data['menu'] = this.menu.toJson();
    }
    return data;
  }
}

class Menu {
  String id;
  String value;
  Popup popup;

  Menu({this.id, this.value, this.popup});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    popup = json['popup'] != null ? new Popup.fromJson(json['popup']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    if (this.popup != null) {
      data['popup'] = this.popup.toJson();
    }
    return data;
  }
}

class Popup {
  List<Menuitem> menuitem;

  Popup({this.menuitem});

  Popup.fromJson(Map<String, dynamic> json) {
    if (json['menuitem'] != null) {
      menuitem = new List<Menuitem>();
      json['menuitem'].forEach((v) {
        menuitem.add(new Menuitem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.menuitem != null) {
      data['menuitem'] = this.menuitem.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menuitem {
  String value;
  String onclick;

  Menuitem({this.value, this.onclick});

  Menuitem.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    onclick = json['onclick'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['onclick'] = this.onclick;
    return data;
  }
}
