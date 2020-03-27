//
//  ViewController.swift
//  BusinessCrime
//
//  Created by Tim Jarratt on 26/03/2020.
//  Copyright © 2020 General Linear Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var submitButton: OppressiveButton!

    private var tapCount = 0

    @IBAction func didTapSubmit(_ sender: UIButton) {
        switch tapCount {
        case 0:
            animateTowardsJoy()

        case 1:
            animateTowardsConfusion()

        case 2:
            animateTowardsMeow()

        default:
            print("Nothing left to see here. Go home folks")
        }

        tapCount += 1
    }

    func animateTowardsJoy() {
        let animation = UIViewPropertyAnimator(duration: 5, curve: .easeInOut) { [backgroundView, submitButton] in
            submitButton?.layer.cornerRadius = 40
            submitButton?.backgroundColor = UIColor(red: 0.6, green: 0.3, blue: 0.6, alpha: 1)
            backgroundView?.backgroundColor = self.UIColorFromHex(rgbValue: 0x0075c3)
        }

        animation.addCompletion { [submitButton, label] (_) in
            submitButton?.titleLabel?.text = "Submit ?"
        }

        animation.startAnimation()
    }

    func animateTowardsConfusion() {
        label?.text = "oh"
        submitButton.titleLabel?.text = "..."
    }

    func animateTowardsMeow() {
        submitButton.titleLabel?.text = "meow"
        label.text = "Oh it is definitely Friday."
    }

    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0

        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}

