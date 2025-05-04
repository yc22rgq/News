//
//  NewsListViewModel.swift
//  News
//
//  Created by Эдуард Кудянов on 28.04.25.
//

import Foundation

final class NewsListViewModel {
    
    // MARK: - Properties
    
    private let repository: NewsRepository
    private(set) var news: [News] = []
    
    var onNewsUpdate: (() -> Void)?
    var onLoadingStateChange: ((Bool) -> Void)?
    var onError: ((String) -> Void)?
    
    // MARK: - Init
    
    init(repository: NewsRepository = NewsRepositoryImpl()) {
        self.repository = repository
    }
    
    // MARK: - Public Methods
    
    func fetchNews(category: String? = nil, completion: @escaping () -> Void) {
        onLoadingStateChange?(true)
        
        repository.getTopHeadlines(category: category) { [weak self] result in
            DispatchQueue.main.async {
                self?.onLoadingStateChange?(false)
                
                switch result {
                case .success(let newsList):
                    self?.news = newsList
                    self?.onNewsUpdate?()
                case .failure(let error):
                    self?.onError?(self?.mapError(error) ?? "Unknown error")
                }
                completion()
            }
        }
    }
    
    func fetchNews(for category: NewsCategory) {
        onLoadingStateChange?(true)
        
        repository.getTopHeadlines(category: category.apiValue) { [weak self] result in
            DispatchQueue.main.async {
                self?.onLoadingStateChange?(false)
                
                switch result {
                case .success(let news):
                    self?.news = news
                    self?.onNewsUpdate?()
                case .failure(let error):
                    self?.onError?(self?.mapError(error) ?? "Unknown error")
                }
            }
        }
    }
    
    func getNews(at index: Int) -> News? {
        guard index >= 0 && index < news.count else { return nil }
        return news[index]
    }
    
    // MARK: - Private Methods
    
    private func mapError(_ error: NetworkError) -> String {
        switch error {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid server response"
        case .decodingError:
            return "Failed to decode data"
        case .unknown:
            return "Unknown network error"
        }
    }
}
