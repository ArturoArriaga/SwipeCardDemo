//
//  Extensions.swift
//  SwipeCardDemo
//
//  Created by Art Arriaga on 2/7/20.
//  Copyright © 2020 ArturoArriaga.IO. All rights reserved.
//


import UIKit

extension UIButton {
    convenience init (title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        self.backgroundColor = .white
        
    }
}

extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
    
}
