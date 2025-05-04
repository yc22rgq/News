//
//  NewsService.swift
//  News
//
//  Created by Эдуард Кудянов on 28.04.25.
//

import Foundation

final class NewsService {
    
    private let apiKey = "b153286e41fb4d808d54166d7fb34102" // ⚡ ВСТАВЬ СВОЙ КЛЮЧ ОТСЮДА: https://newsapi.org/
    private let baseURL = "https://newsapi.org/v2/top-headlines"
    
    func fetchTopHeadlines(category: String? = nil, completion: @escaping (Result<[News], NetworkError>) -> Void) {
        
        var urlComponents = URLComponents(string: baseURL)
        var queryItems = [
            URLQueryItem(name: "apiKey", value: apiKey),
            URLQueryItem(name: "country", value: "us")
        ]
        
        if let category = category {
            queryItems.append(URLQueryItem(name: "category", value: category))
        }
        
        urlComponents?.queryItems = queryItems
        
        guard let urlString = urlComponents?.url?.absoluteString else {
            completion(.failure(.invalidURL))
            return
        }
        
        NetworkManager.shared.request(urlString: urlString) { (result: Result<NewsResponseDTO, NetworkError>) in
            switch result {
            case .success(let newsResponse):
                let articles = newsResponse.articles.map { $0.toDomain() }
                completion(.success(articles))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
