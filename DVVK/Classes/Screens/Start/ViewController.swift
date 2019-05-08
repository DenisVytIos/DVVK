//
//  ViewController.swift
//  DVVK
//
//  Created by Denis on 5/3/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var singInButton: UIButton!
    @IBOutlet weak var singUpButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        Decorator.decorate(self)
        addTargets() 
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func addTargets() {
        singUpButton.addTarget(self, action: #selector(singUpButtonClicked), for: .touchUpInside)
        singInButton.addTarget(self, action: #selector(singInButtonClicked), for: .touchUpInside)
    }
    
    @objc private func singInButtonClicked() {
        
    }
    @objc private func singUpButtonClicked() {
        StartRouter.shared.goToRegisterScreen(from: self)
    }

}

extension ViewController {
    fileprivate class Decorator {
        static let buttonCornerRadius: CGFloat = 8
        private init() {}
        
        static func decorate (_ vc: ViewController) {
            vc.singInButton.layer.cornerRadius = buttonCornerRadius
            vc.singInButton.layer.borderColor  = #colorLiteral(red: 0.7450980392, green: 0.7450980392, blue: 0.7450980392, alpha: 1)
        }
    }
}
