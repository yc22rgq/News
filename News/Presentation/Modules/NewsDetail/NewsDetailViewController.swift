//
//  NewsDetailViewController.swift
//  News
//
//  Created by Эдуард Кудянов on 28.04.25.
//

import UIKit
import SafariServices

final class NewsDetailViewController: UIViewController {
    
    private let viewModel: NewsDetailViewModel
    private let scrollView = UIScrollView()
    private let contentStackView = UIStackView()
    
    init(viewModel: NewsDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItems = []
        view.backgroundColor = .systemBackground
        setupScrollView()
        setupContent()
        setupBookmarkButton()
        setupSafariButton()
    }
    
    private func setupSafariButton() {
        let button = UIBarButtonItem(
            image: UIImage(systemName: "safari"),
            style: .plain,
            target: self,
            action: #selector(openInSafari)
        )
        navigationItem.rightBarButtonItems?.append(button)
    }
    
    private func setupBookmarkButton() {
        let button = UIBarButtonItem(
            image: viewModel.isBookmarked ? UIImage(systemName: "bookmark.fill") : UIImage(systemName: "bookmark"),
            style: .plain,
            target: self,
            action: #selector(bookmarkButtonTapped)
        )
        navigationItem.rightBarButtonItems?.append(button)
    }
    
    private func updateBookmarkIcon() {
        navigationItem.rightBarButtonItem?.image = viewModel.isBookmarked
            ? UIImage(systemName: "bookmark.fill")
            : UIImage(systemName: "bookmark")
    }
    
    @objc private func bookmarkButtonTapped() {
        viewModel.toggleBookmark()
        updateBookmarkIcon()
    }
    
    @objc private func openInSafari() {
        let urlString = viewModel.news.url
        guard let url = URL(string: urlString) else { return }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }

    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        contentStackView.axis = .vertical
        contentStackView.spacing = 16
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
    }

    private func setupContent() {
        // Image
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.loadImage(from: viewModel.news.urlToImage)
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        
        let titleLabel = UILabel()
        titleLabel.text = viewModel.news.title
        titleLabel.font = .boldSystemFont(ofSize: 22)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .label
        
        let authorLabel = UILabel()
        authorLabel.text = "Author: \(viewModel.news.author ?? "Unknown")"
        authorLabel.font = .italicSystemFont(ofSize: 16)
        authorLabel.textColor = .secondaryLabel
        
        let dateLabel = UILabel()
        dateLabel.text = "Published: \(formattedDate)"
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = .secondaryLabel
        
        let contentLabel = UILabel()
        contentLabel.text = viewModel.news.content ?? ""
        contentLabel.font = .systemFont(ofSize: 16)
        contentLabel.numberOfLines = 0
        
        let safariButton = UIButton(type: .system)
//        safariButton.setTitle("Открыть в Safari", for: .normal)
//        safariButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
//        safariButton.setTitleColor(.systemBlue, for: .normal)
//        safariButton.addTarget(self, action: #selector(openInSafari), for: .touchUpInside)

        contentStackView.addArrangedSubview(imageView)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(authorLabel)
        contentStackView.addArrangedSubview(dateLabel)
        contentStackView.addArrangedSubview(contentLabel)
        contentStackView.addArrangedSubview(safariButton)
    }
    
    var formattedDate: String {
        let date = viewModel.news.publishedAt
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
