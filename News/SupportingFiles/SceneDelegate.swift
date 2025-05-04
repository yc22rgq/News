//
//  SceneDelegate.swift
//  News
//
//  Created by Эдуард Кудянов on 28.04.25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = MainTabBarController()
        window.makeKeyAndVisible()
        
        self.window = window
    }
}

extension UIImageView {
    func loadImage(from urlString: String?) {
        guard
            let urlString = urlString,
            let url = URL(string: urlString)
        else {
            self.image = UIImage(systemName: "photo")
            return
        }

        self.image = UIImage(systemName: "photo") // Placeholder
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
