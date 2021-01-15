class Item {
  int _id;
  String _title;
  String _description;

  Item(this._id, this._title, this._description);
  Item.withId(this._title, this._description);
  int get id => _id;
  String get title => _title;
  String get description => _description;

  set title(String nwTitle) {
    if (nwTitle.length < 256) _title = nwTitle;
  }

  set description(String nwdescription) {
    if (description.length < 256) _description = nwdescription;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    if (_id != null) map["id"] = _id;
    return map;
  }

  Item.fromObject(dynamic obj) {
    this._id = obj["id"];
    this._title = obj["title"];
    this._description = obj["description"];
  }
}
