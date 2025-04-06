class Book{
  String title;
  String subtitle;
  String descripton;
  int borrowTime;

  Book({
    required this.title,
    required this.subtitle,
    required this.borrowTime,
    this.descripton = 'Sem descrição...',
  });
}