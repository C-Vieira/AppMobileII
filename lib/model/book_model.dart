class Book{
  String uid = '';
  String title;
  String subtitle;
  String descripton;
  int borrowTime;

  /*Book({
    required this.uid,
    required this.title,
    required this.subtitle,
    required this.borrowTime,
    this.descripton = 'Sem descrição...',
  });*/

  Book(this.title, this.subtitle, this.descripton, this.borrowTime);

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
    };
  }

  factory Book.fromJson(Map<String, dynamic> json){
    return Book(
      //json['uid'],
      json['title'],
      json['subtitle'],
      json['description'],
      json['borrowTime'],
    );
  }
}