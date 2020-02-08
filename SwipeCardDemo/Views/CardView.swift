//
//  CardView.swift
//  SwipeCardDemo
//
//  Created by Art Arriaga on 2/7/20.
//  Copyright © 2020 ArturoArriaga.IO. All rights reserved.
//

import UIKit

class CardView : UIView {
    
     let imageView = UIImageView(image: UIImage(named: "teslaTruck")!)
    let label = UILabel(text: "Tesla Truck", font: UIFont.boldSystemFont(ofSize: 30), numberOfLines: 1)
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
        setupGestureRecognizer()
    }
    
    fileprivate func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
        self.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.clipsToBounds = true
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        
        
    }
    
    fileprivate func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    fileprivate func setupGestureRecognizer() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        self.addGestureRecognizer(panGesture)
    }
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            handleChange(gesture)
            
        case .ended:
            handleEnd(gesture)
        default:
            ()
        }
    }
    // threshold for determining Cardview removal
    fileprivate let threshold: CGFloat = 80
    
    fileprivate func handleChange(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: nil)
        let degrees: CGFloat = translation.x / 20
        let angle = degrees * .pi / 180
        let rotationalTransform = CGAffineTransform(rotationAngle: angle)
        
        self.transform = rotationalTransform.translatedBy(x: translation.x, y: translation.y)
    }
    
    
    fileprivate func handleEnd(_ gesture: UIPanGestureRecognizer) {
        let translationDirection: CGFloat = gesture.translation(in: nil).x > 0 ? 1 : -1
        let shouldDismiss = abs(gesture.translation(in: nil).x) > threshold
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            if shouldDismiss {
                let transformoffSCreen = self.transform.translatedBy(x: 1000 * translationDirection, y: 0)
                self.transform = transformoffSCreen
            } else {
                self.transform = .identity
            }
            
        }, completion: { (_) in
            self.transform = .identity
            if shouldDismiss {
                self.removeFromSuperview()
            }
        })
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
