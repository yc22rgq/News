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
