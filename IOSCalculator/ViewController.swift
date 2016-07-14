//
//  ViewController.swift
//  IOSCalculator
//
//  Created by spykins on 13/06/2016.
//  Copyright © 2016 Andela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func touchDigit(sender: UIButton) {
        if let check = sender.currentTitle {
            print(check)
        
        }
    }

}

