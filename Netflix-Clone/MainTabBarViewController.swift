//
//  ViewController.swift
//  Netflix-Clone
//
//  Created by Ferid Suleymanzade on 27.10.24.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Arka plan rengini sarı olarak ayarlayın
        view.backgroundColor = .systemYellow
        
        
        // Ana görünüm denetleyicileri oluştur
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: UpComingViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        
        
        // Tab bar öğeleri için simgeleri ayarla
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        
        // Tab bar öğeleri için başlıkları ayarla
        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Top Search"
        vc4.title = "Downloads"
        
        
        // Tab bar öğeleri için başlıkları ayarla(DarkMode = Beyaz)
        tabBar.tintColor = .label
        
        // Tab bar denetleyicisini ayarla (Siralarini)
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }


}

