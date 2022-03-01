class UserCreate {
  String name, email, gender, status;

  UserCreate(this.name, this.email, this.gender, this.status);

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'gender': gender, 'status': status};
  }

  @override
  String toString() {
    return 'UserCreate{name: $name, email: $email, gender: $gender, status: $status}';
  }
}
