class TodoModel {
  final int id;
  final String content;
  final String dueDate; 

  TodoModel({this.id, this.content, this.dueDate});

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
    id: json['id'],
    content: json['content'],
    dueDate: json['due_date']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'content': content,
    'due_date': dueDate
  };
}