class PostModel {
  int? id;
  late String title;
  late String desc;
  String? createdTime;
  PostModel({this.id, required this.title,  this.createdTime, required this.desc});

  PostModel.fromJson(Map<String, dynamic> json){
    id = json["id"];
    title = json["title"];
    desc = json["desc"];
    createdTime = json["createdTime"];
  }

  Map<String, dynamic> toJson(){
    return {
      "id":id,
      "title":title,
      "desc":desc,
      "createdTime":createdTime,
    };
  }


}