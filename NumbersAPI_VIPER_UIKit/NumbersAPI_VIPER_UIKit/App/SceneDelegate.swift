//
//  SceneDelegate.swift
//  NumbersAPI_VIPER_UIKit
//
//  Created by 김민준 on 7/17/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = NumbersViewController()
        window?.makeKeyAndVisible()
    }
}

