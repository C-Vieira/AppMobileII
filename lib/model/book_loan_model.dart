class BookLoan{
  final String userUid;
  final String bookUid;

  BookLoan(this.userUid, this.bookUid);

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'userUid': userUid,
      'bookUid': bookUid,
    };
  }

  factory BookLoan.fromJson(Map<String, dynamic> json){
    return BookLoan(
      json['userUid'],
      json['bookUid'],
    );
  }
}