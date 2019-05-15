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
        Decorator.decorate(self)
        addLabel()
        addPlusView()
    }
    private func addLabel() {
        label.text                                      = "Photo"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font                                      = UIFont.systemFont(ofSize: 12)
        label.textAlignment                             = .center
        label.textColor                                 = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
        addSubview(label)
        
        let constraints = NSLayoutConstraint.contraints(withNewVisualFormat: "H:|[label]|,V:[label]-16-|", dict: ["label": label])
        addConstraints(constraints)
    }
    
    private func addPlusView(){
    plusView.translatesAutoresizingMaskIntoConstraints = false
        plusView.contentMode = .scaleAspectFit
        plusView.tintColor = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
        plusView.image = #imageLiteral(resourceName: "add.png")
        addSubview(plusView)
        
        let constraints = NSLayoutConstraint.contraints(withNewVisualFormat: "H:|[plusView]|,V:|-(>=0)-[plusView(\(frame.height * 0.3))][label]", dict: ["label": label, "plusView": plusView])
        addConstraints(constraints)
//        plusView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25).isActive = true
//        plusView.widthAnchor.constraint(equalTo: plusView.heightAnchor).isActive = true
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
