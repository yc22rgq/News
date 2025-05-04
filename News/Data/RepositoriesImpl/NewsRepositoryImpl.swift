//
//  NewsRepositoryImpl.swift
//  News
//
//  Created by Эдуард Кудянов on 28.04.25.
//

import Foundation

final class NewsRepositoryImpl: NewsRepository {
    
    private let service: NewsService
    
    init(service: NewsService = NewsService()) {
        self.service = service
    }
    
    func getTopHeadlines(category: String?, completion: @escaping (Result<[News], NetworkError>) -> Void) {
        service.fetchTopHeadlines(category: category, completion: completion)
    }
}
