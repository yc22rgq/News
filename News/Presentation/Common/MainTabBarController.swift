//
//  MainTabBarController.swift
//  News
//
//  Created by Эдуард Кудянов on 28.04.25.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
    }
    
    private func setupTabs() {
        let newsListVC = UINavigationController(rootViewController: NewsListViewController())
        newsListVC.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), tag: 0)
        
        let bookmarksVC = UINavigationController(rootViewController: BookmarksViewController())
        bookmarksVC.tabBarItem = UITabBarItem(title: "Bookmarks", image: UIImage(systemName: "bookmark"), tag: 1)
        
        viewControllers = [newsListVC, bookmarksVC]
    }
}
