//
//  ViewController.swift
//  PineappleOrNah
//
//  Created by Kasey Schlaudt on 4/24/18.
//  Copyright © 2018 Kasey Schlaudt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var randomImageView: UIImageView!
    @IBOutlet weak var nahButton: UIButton!
    @IBOutlet weak var pineappleButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var gameOverLabel: UILabel!
    
    private var randomImages = [#imageLiteral(resourceName: "Pineapple1"),#imageLiteral(resourceName: "Pineapple2"),#imageLiteral(resourceName: "Pineapple3"),#imageLiteral(resourceName: "Pineapple4"),#imageLiteral(resourceName: "Random1"),#imageLiteral(resourceName: "Random2"),#imageLiteral(resourceName: "Random3"),#imageLiteral(resourceName: "Random4")]
    private var isGameOver = false
    private var currentImageIndex = -1

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        selectRandomImage()
    }
    
    func selectRandomImage() {
        var randomNumber = Int(arc4random_uniform(UInt32(self.randomImages.count)))
        
        while randomNumber == currentImageIndex {
            randomNumber = Int(arc4random_uniform(UInt32(self.randomImages.count)))
        }

        currentImageIndex = randomNumber

        if currentImageIndex < 4 {
            randomImageView.accessibilityIdentifier = "pineappleImage"
        } else {
            randomImageView.accessibilityIdentifier = "nahImage"
        }
        
        randomImageView.image = randomImages[randomNumber]
    }
    
    func gameOver() {
        isGameOver = true
        gameOverLabel.isHidden = false
        resetButton.isHidden = false
        pineappleButton.isHidden = true
        nahButton.isHidden = true
    }
    
    @IBAction func resetGame(_ sender: Any) {
        isGameOver = false
        gameOverLabel.isHidden = true
        resetButton.isHidden = true
        pineappleButton.isHidden = false
        nahButton.isHidden = false
        
        selectRandomImage()
    }

    @IBAction func nahButtonPressed(_ sender: Any) {
        guard randomImageView.accessibilityIdentifier == "nahImage" else {
            gameOver()
            return
        }
        
        selectRandomImage()
    }
    
    @IBAction func pineapplePressed(_ sender: Any) {
        guard randomImageView.accessibilityIdentifier == "pineappleImage" else {
            gameOver()
            return
        }
        
        selectRandomImage()
    }
}

