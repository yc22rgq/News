//
//  NewsDTO.swift
//  News
//
//  Created by Эдуард Кудянов on 28.04.25.
//

import Foundation

struct NewsResponseDTO: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleDTO]
}

struct ArticleDTO: Codable {
    let source: SourceDTO
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct SourceDTO: Codable {
    let id: String?
    let name: String
}

extension ArticleDTO {
    func toDomain() -> News {
        return News(
            title: title,
            description: description ?? "",
            content: content,
            author: author,
            publishedAt: ISO8601DateFormatter().date(from: publishedAt) ?? Date(),
            url: url,
            urlToImage: urlToImage,
            sourceName: source.name
        )
    }
}
