//
//  MainTabBarViewController.swift
//  Learning
//
//  Created by Anna Johnson on 10/8/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        let vc3 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: AccountViewController())
        let vc1 = UINavigationController(rootViewController: ChapterCardViewController())


        
        vc3.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "person")
        vc1.tabBarItem.image = UIImage(systemName: "person")

        
        vc3.title = "Home"
        vc2.title = "Account"
        vc1.title = "Test"

        
        tabBar.tintColor = .white
        tabBar.backgroundColor = .secondarySystemFill
        tabBar.unselectedItemTintColor = .systemGray
        
        setViewControllers([vc1, vc2, vc3], animated: true)
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
