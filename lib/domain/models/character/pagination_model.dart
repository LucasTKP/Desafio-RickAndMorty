class PaginationModel {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  PaginationModel({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }
}
