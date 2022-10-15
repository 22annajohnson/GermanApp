//
//  HomeViewController.swift
//  Learning
//
//  Created by Anna Johnson on 10/8/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        button.backgroundColor = UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.setTitle("Start Flight", for: .normal)
        
        let constraints = [
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(constraints)
        button.addTarget(self, action: #selector(self.buttonAnimation(sender:)), for: .touchUpInside)
        
    }
    
    @objc fileprivate func buttonAnimation(sender:UIButton) {
        print("Hello World")
        animateView(sender)
    }
    
    fileprivate func animateView(_ viewToAnimate:UIView) {
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) { (_) in
            print("animation complete")
        }
        UIView.animate(withDuration: 0.15, delay: 0.25, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
        }) { (_) in
            print("animation complete")
        }
    }


}
