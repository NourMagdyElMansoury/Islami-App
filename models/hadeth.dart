class Hadeth {
  final String title;
  final String content;

  Hadeth({required this.title, required this.content});

  /// Factory to create from raw text file
  factory Hadeth.fromFileContent(String content) {
    final lines = content.trim().split('\n');
    final title = lines.isNotEmpty ? lines.first : "Untitled Hadith";
    return Hadeth(
      title: title,
      content: content,
    );
  }
}
