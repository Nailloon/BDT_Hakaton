class UrlStatDTO{
  final String id;
  final double isIndexing;

  UrlStatDTO({required this.id, required this.isIndexing});

  factory UrlStatDTO.fromJson(String key, double value){
    final url = key;
    final isIndexing = value;

    return UrlStatDTO(
      id: url,
      isIndexing: isIndexing.toDouble(),
    );
  }
}