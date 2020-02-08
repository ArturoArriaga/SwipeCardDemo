//
//  ContentView.swift
//  SwipeCardDemo
//
//  Created by Art Arriaga on 2/7/20.
//  Copyright © 2020 ArturoArriaga.IO. All rights reserved.
//
import UIKit

class RootViewController: UIViewController {
    
    let topPanel = TopPanelStackView()
    let centerView = UIView()
    
    // Insert more cards here
    let originalCards = [
        Card(title: "Tesla Truck", imageName: "teslaTruck", color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)),
        Card(title: "Tesla in red", imageName: "teslaRed", color: #colorLiteral(red: 0.8996149898, green: 0.2200287282, blue: 0.2751584947, alpha: 1)),
        Card(title: "Tesla in white", imageName: "teslaWhite", color: #colorLiteral(red: 0.1354812832, green: 0.1375340299, blue: 0.1375340299, alpha: 1)),
        Card(title: "Tesla in blue", imageName: "teslaBlue", color: #colorLiteral(red: 0.1642622054, green: 0.104092218, blue: 0.5670284629, alpha: 1)),
        Card(title: "Tesla in Gray", imageName: "teslaGray", color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
    ]
    
    var presentedCards = [Card]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.topPanel.refreshButton.addTarget(self, action: #selector(handleReset), for: .touchUpInside)
        centerView.backgroundColor = #colorLiteral(red: 0.9530013204, green: 0.9494226575, blue: 0.9284337759, alpha: 1)
        //Confirm Array is empty.
        print(presentedCards)
        setupLayout()
        setupCards()
        
    }
    
    @objc fileprivate func handleReset() {
        presentedCards.removeAll()
        //Confirm Array is empty
        print(presentedCards)
        // Add Cards back to array.
        setupCards()

    }
    
    fileprivate func setupCards() {
        //load cards into the presentedCards array.
        originalCards.forEach { (card) in
            presentedCards.append(card)
            print(presentedCards)
        }
        
        presentedCards.forEach { (card) in
            let cardView = CardView(frame: .zero)
            cardView.imageView.image = UIImage(named: card.imageName)
            cardView.label.text = "\(card.title)"
            cardView.backgroundColor = card.color
            centerView.addSubview(cardView)
            NSLayoutConstraint.activate([
                cardView.centerXAnchor.constraint(equalTo: centerView.centerXAnchor),
                cardView.centerYAnchor.constraint(equalTo: centerView.centerYAnchor),
                cardView.heightAnchor.constraint(equalToConstant: 300),
                cardView.widthAnchor.constraint(equalToConstant: 300)
            ])
        }
    }
    
    // Insert more views to this stackView if desired. 
    fileprivate func setupLayout() {
        let overallStackView = UIStackView(arrangedSubviews: [topPanel, centerView])
        overallStackView.axis = .vertical
        
        self.view.addSubview(overallStackView)
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            overallStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            overallStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overallStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            overallStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        overallStackView.bringSubviewToFront(centerView)
    }
}





