class UrlStatDTO{
  final String id;
  final double isIndexing;
  final String base64String;

  UrlStatDTO({required this.id, required this.isIndexing, required this.base64String});

  factory UrlStatDTO.fromJson(Map<String, dynamic> json){
    return UrlStatDTO(id: json['url'], isIndexing: json['inIndexing'], base64String: json['image']);
  }
}