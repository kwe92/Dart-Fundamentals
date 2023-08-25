class TaskModel {
  final String id;
  final String taskName;
  final String taskDetails;
  final String createdDate;
  const TaskModel({
    required this.id,
    required this.taskName,
    required this.taskDetails,
    required this.createdDate,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "taskName": taskName,
        "taskDetails": taskDetails,
        "createdDate": createdDate,
      };

  TaskModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        taskName = json['taskName'],
        taskDetails = json['taskDetails'],
        createdDate = json['createdDate'];
}
