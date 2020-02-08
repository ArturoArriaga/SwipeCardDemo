//
//  Top and Bottom Panel.swift
//  SwipeCardDemo
//
//  Created by Art Arriaga on 2/7/20.
//  Copyright © 2020 ArturoArriaga.IO. All rights reserved.
//

import UIKit

class TopPanelStackView : UIStackView {
    
    let refreshButton = UIButton(title: "Refresh")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // configure stackView
        self.heightAnchor.constraint(equalToConstant: 80).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.distribution = .equalCentering
        self.isLayoutMarginsRelativeArrangement = true
        self.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        

        // Add Refresh button.
        // Insert more views into the forEach loop if desired.
        refreshButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        [refreshButton, UIView()].forEach { (v) in
            addArrangedSubview(v)
        }
        
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

