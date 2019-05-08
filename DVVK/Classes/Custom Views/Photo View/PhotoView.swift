//
//  PhotoView.swift
//  DVVK
//
//  Created by Denis on 5/4/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

final class PhotoView: UIView {
    
    private let stackView = UIStackView()

    private let plusView = UIImageView()
    private let label = UILabel()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        addStackView()
        addPlusView()
        addLabel()
    }
    private func addLabel() {
        label.text = "Photo"
        label.font = UIFont.systemFont(ofSize: 9)
        label.textColor = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
        stackView.addArrangedSubview(label)
    }
    
    private func addPlusView(){
//        plusView.translatesAutoresizingMaskIntoConstraints = false
        plusView.contentMode = .scaleAspectFit
        plusView.tintColor = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
        plusView.image = #imageLiteral(resourceName: "add.png")
       
        stackView.addArrangedSubview(plusView)
//        plusView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25).isActive = true
//        plusView.widthAnchor.constraint(equalTo: plusView.heightAnchor).isActive = true
    }
    private func addStackView(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.axis = .vertical
        addSubview(stackView)
        
        let constraints = NSLayoutConstraint.contraints(withNewVisualFormat: "H:|[stackView]|,V:|[stackView]|", dict: ["stackView" : stackView])
        addConstraints(constraints)
        
         //With the help of Anchor
//        stackView.topAnchor.constraint(equalTo: topAnchor).isActive           = true
//        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive     = true
//        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive   = true
//        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        Decorator.layoutSubviews(self)
    }
    
 

}
extension PhotoView {
    fileprivate final class Decorator {
        static func decorate(_ view: PhotoView) {
            view.layer.borderColor = #colorLiteral(red: 0.7450980392, green: 0.7450980392, blue: 0.7450980392, alpha: 1)
            view.layer.borderWidth = 1
        }
        static func layoutSubviews(_ view: PhotoView) {
            view.round()
        }
    }
}
