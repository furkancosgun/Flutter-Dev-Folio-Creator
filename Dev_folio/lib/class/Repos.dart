class Repos {
  Repos({
    required this.name,
    required this.htmlUrl,
    required this.description,
    required this.stargazersCount,
    required this.watchersCount,
    required this.language,
    required this.forksCount,
  });

  final String? name;
  final String? htmlUrl;
  final String? description;
  final int? stargazersCount;
  final int? watchersCount;
  final String? language;
  final int? forksCount;

  factory Repos.fromJson(Map<String, dynamic> json) => Repos(
      name: json["name"] as String?,
      htmlUrl: json["html_url"] as String?,
      description: json["description"] as String?,
      stargazersCount: json["stargazers_count"] as int?,
      watchersCount: json["watchers_count"] as int?,
      language: json["language"] as String?,
      forksCount: json["forks_count"] as int?);
}
