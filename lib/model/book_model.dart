class Book{
  final String title;
  final String subtitle;
  final String descripton;

  Book({
    required this.title,
    required this.subtitle,
    this.descripton = 'Sem descrição...',
  });
}