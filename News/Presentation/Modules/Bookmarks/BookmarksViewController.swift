//
//  BookmarksViewController.swift
//  News
//
//  Created by Эдуард Кудянов on 28.04.25.
//

import UIKit

final class BookmarksViewController: UIViewController {
    
    private let tableView = UITableView()
    private let viewModel = BookmarksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBindings()
        viewModel.fetchBookmarks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchBookmarks()
    }
    
    private func setupUI() {
        title = "Bookmarks"
        view.backgroundColor = .systemBackground
        
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupBindings() {
        viewModel.onBookmarksUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension BookmarksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.bookmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell,
              let newsItem = viewModel.getBookmark(at: indexPath.row) else {
            return UITableViewCell()
        }
        
        cell.configure(with: newsItem)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension BookmarksViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let newsItem = viewModel.getBookmark(at: indexPath.row) else { return }
        let detailVC = NewsDetailViewController(viewModel: NewsDetailViewModel(news: newsItem))
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
