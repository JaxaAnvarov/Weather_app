import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final String? title;
  final String? slug;
  final String? url;
  final int? crawlRate;

  const Source({this.title, this.slug, this.url, this.crawlRate});

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        title: json['title'] as String?,
        slug: json['slug'] as String?,
        url: json['url'] as String?,
        crawlRate: json['crawl_rate'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'slug': slug,
        'url': url,
        'crawl_rate': crawlRate,
      };

  @override
  List<Object?> get props => [title, slug, url, crawlRate];
}
