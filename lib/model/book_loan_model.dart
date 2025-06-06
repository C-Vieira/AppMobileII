class BookLoan{
  final String userUid;
  final String bookUid;
  String bookTitle;
  String bookSubtitle;

  BookLoan(this.userUid, this.bookUid, this.bookTitle, this.bookSubtitle);

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'userUid': userUid,
      'bookUid': bookUid,
      'bookTitle': bookTitle,
      'bookSubtitle': bookSubtitle
    };
  }

  factory BookLoan.fromJson(Map<String, dynamic> json){
    return BookLoan(
      json['userUid'],
      json['bookUid'],
      json['bookTitle'],
      json['bookSubtitle'],
    );
  }
}