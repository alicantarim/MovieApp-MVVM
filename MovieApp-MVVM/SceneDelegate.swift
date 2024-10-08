//
//  SceneDelegate.swift
//  MovieApp-MVVM
//
//  Created by Alican TARIM on 17.09.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Programatik Calisacagimiz icin HomeScreen i root a bagliyoruz.
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = HomeScreen()
        window?.makeKeyAndVisible()
    }
}

