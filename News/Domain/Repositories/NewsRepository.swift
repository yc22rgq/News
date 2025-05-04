//
//  NewsRepository.swift
//  News
//
//  Created by Эдуард Кудянов on 28.04.25.
//

import Foundation

protocol NewsRepository {
    func getTopHeadlines(category: String?, completion: @escaping (Result<[News], NetworkError>) -> Void)
}

final class NewsListUseCase {
    private let repository: NewsRepository

    init(repository: NewsRepository) {
        self.repository = repository
    }

    func execute(category: String, completion: @escaping (Result<[News], NetworkError>) -> Void) {
        repository.getTopHeadlines(category: category, completion: completion)
    }
}
