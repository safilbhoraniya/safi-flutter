class Perform {
  int? id;
  String name;
  String desc;
  String date;
  String time;
  int priority;
  bool isCompleted;

  Perform({
    this.id,
    required this.name,
    required this.desc,
    required this.date,
    required this.time,
    required this.priority,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'date': date,
      'time': time,
      'priority': priority,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  factory Perform.fromMap(Map<String, dynamic> map) {
    return Perform(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      date: map['date'],
      time: map['time'],
      priority: map['priority'],
      isCompleted: map['isCompleted'] == 1,
    );
  }
}