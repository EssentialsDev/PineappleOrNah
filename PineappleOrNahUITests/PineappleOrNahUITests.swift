//
//  PineappleOrNahUITests.swift
//  PineappleOrNahUITests
//
//  Created by Kasey Schlaudt on 4/24/18.
//  Copyright © 2018 Kasey Schlaudt. All rights reserved.
//

import XCTest

class PineappleOrNahUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    var nahButton: XCUIElement {
        return app.buttons["Nah"]
    }
    
    var pineappleButton: XCUIElement {
        return app.buttons["Pineapple"]
    }
    
    var nahImageView: XCUIElement {
        return app.otherElements.containing(.image, identifier:"nahImage").element
    }
    
    var pineappleImageView: XCUIElement {
        return app.otherElements.containing(.image, identifier:"pineappleImage").element
    }
    
    var resetButton: XCUIElement {
        return app.buttons["Restart"]
    }
    
    var gameOverLabel: XCUIElement {
        return app.staticTexts["Game Over"]
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["isUITesting"]
        app.launch()
    }

    func testGameActuallyWorks() {
        for _ in 0...20 {
            if pineappleImageView.exists {
                pineappleButton.tap()
            } else {
                nahButton.tap()
            }
            
            assert(gameOverLabel.exists == false, "Games buttons are not working properly")
        }
    }
    
    func testGameOver() {
        for _ in 0...20 {
            if pineappleImageView.exists {
                nahButton.tap()
            } else {
                pineappleButton.tap()
            }
            
            assert(gameOverLabel.exists == true)
            resetButton.tap()
        }
    }
}
