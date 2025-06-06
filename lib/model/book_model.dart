class Book{
  String uid = '';
  String title;
  String subtitle;
  String descripton;
  int borrowTime;
  String category;
  String registerDate;

  Book(this.title, this.subtitle, this.descripton, this.borrowTime, this.category, this.registerDate);

  void setId(uid){
    this.uid = uid;
  }

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      //'uid': uid,
      'title': title,
      'subtitle': subtitle,
      'description': descripton,
      'borrowTime': borrowTime,
      'category': category,
      'registerDate': registerDate,
    };
  }

  factory Book.fromJson(Map<String, dynamic> json){
    return Book(
      //json['uid'],
      json['title'],
      json['subtitle'],
      json['description'],
      json['borrowTime'],
      json['category'],
      json['registerDate'],
    );
  }
}