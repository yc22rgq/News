//
//  NewsTableViewCell.swift
//  News
//
//  Created by Эдуард Кудянов on 28.04.25.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    static let identifier = "NewsTableViewCell"
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let sourceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .label
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 3
        descriptionLabel.textColor = .secondaryLabel
        
        sourceLabel.font = UIFont.systemFont(ofSize: 12)
        sourceLabel.textColor = .secondaryLabel
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, sourceLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with news: News) {
        titleLabel.text = news.title
        descriptionLabel.text = news.description
        sourceLabel.text = "Source: \(news.sourceName)"
    }
}
