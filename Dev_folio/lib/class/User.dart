// ignore_for_file: file_names

class User {
  User({
    required this.login,
    required this.avatarUrl,
    required this.url,
    required this.htmlUrl,
    required this.type,
    required this.name,
    required this.blog,
    required this.location,
    this.email,
    required this.bio,
    this.twitterUsername,
    required this.publicRepos,
    required this.followers,
    required this.following,
  });

  final String login;
  final String avatarUrl;
  final String url;
  final String htmlUrl;
  final String type;
  final String name;
  final String blog;
  final String location;
  final String? email;
  final String bio;
  final String? twitterUsername;
  final int publicRepos;
  final int followers;
  final int following;

  factory User.fromJson(Map<String, dynamic> json) => User(
        login: json["login"],
        avatarUrl: json["avatar_url"],
        url: json["url"],
        htmlUrl: json["html_url"],
        type: json["type"],
        name: json["name"],
        blog: json["blog"],
        location: json["location"],
        email: json["email"],
        bio: json["bio"],
        twitterUsername: json["twitter_username"],
        publicRepos: json["public_repos"],
        followers: json["followers"],
        following: json["following"],
      );
}
