//
//  ViewController.swift
//  Custom Views
//
//  Created by Sagar Baloch on 04/08/2020.
//  Copyright © 2020 Sagar Baloch. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()        
//        customButton.addButton(controllerView: self.view, title: "New Button 23")
        AlertBox.shared.textHead = "Accessing Internal Storage"
        AlertBox.shared.subText = "Application needs to access internal storage to gain folder names"
        AlertBox.shared.button1Text = "Skip This"
        AlertBox.shared.button2Text = "Don't Skip"
        AlertBox.shared.showAlertBox(controllerView: self.view)
        DispatchQueue.main.asyncAfter(deadline: .now()+3){
        AlertBox.shared.removeAlertBox()
        }
    }
}

