class UserModel {
  final String? firstName;
  final String? lastName;
  final String? mobileNumber;

  UserModel({
    required this.firstName,
    required this.mobileNumber,
    required this.lastName,
  });
  factory UserModel.fromMap(Map<String, dynamic> Map) {
    return UserModel(
      firstName: Map['firstName'] as String?,
      lastName: Map['lastName'] as String?,
      mobileNumber: Map['mobileNumber'] as String?,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'userName': firstName,
      'mobileNumber': mobileNumber,
      'lastName': lastName,
    };
  }
}
