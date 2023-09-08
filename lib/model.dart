// ignore_for_file: prefer_collection_literals, unnecessary_new

class EmployerModel {
  // String? id;
  String? employeeName;
  num? employeeSalary;
  num? employeeAge;
  String? profileImage;

  EmployerModel(
      {
      // this.id,
      this.employeeName,
      required this.employeeSalary,
      required this.employeeAge,
      this.profileImage});

  EmployerModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    employeeName = json['employee_name'];
    employeeSalary = json['employee_salary'];
    employeeAge = json['employee_age'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
    data['employee_name'] = employeeName;
    data['employee_salary'] = employeeSalary;
    data['employee_age'] = employeeAge;
    data['profile_image'] = profileImage;
    return data;
  }
}
