class UserRespone {
  int _id;
  String _name;
  String _email;
  String _gender;
  String _status;

  UserRespone(this._id, this._name, this._email, this._gender, this._status);

  @override
  String toString() {
    return 'UserRespone{_id: $_id, _name: $_name, _email: $_email, _gender: $_gender, _status: $_status}';
  }

  int get id => _id;

  factory UserRespone.fromJson(Map<String, dynamic> json) {
    return UserRespone(json['id'], json['name'], json['email'], json['gender'],
        json['status']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'status': status,
    };
  }

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  set name(String value) {
    _name = value;
  }
}
