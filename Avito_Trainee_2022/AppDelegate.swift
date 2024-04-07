//
//  AppDelegate.swift
//  Avito_Trainee_2022
//
//  Created by Евгений колесников on 06.04.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window =  UIWindow(frame: UIScreen.main.bounds)
         window?.rootViewController = ViewController(nibName: nil, bundle: nil)
         window?.makeKeyAndVisible()
        
        return true
    }

}

