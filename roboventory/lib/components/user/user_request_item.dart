class RequestItem {
  final _userName;
  final _componentName;
  final _quantity;
  //image
  final _dateTime;

  RequestItem(this._userName, this._componentName, this._quantity, this._dateTime);

  get dateTime => _dateTime;

  get quantity => _quantity;

  get componentName => _componentName;

  get userName => _userName;
}
