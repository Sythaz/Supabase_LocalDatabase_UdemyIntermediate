// class Note {
//   int? id;
//   String? title;
//   String? desc;

//   Note({this.id, this.title, this.desc});

//   Note.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     desc = json['desc'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['desc'] = this.desc;
//     return data;
//   }

//   static List<Note> toJsonList(List? data) {
//     if(data == null || data.length == 0) {
//       return [];
//     }
//     return data.map((e) => Note.fromJson(e)).toList();
//   }
// }

