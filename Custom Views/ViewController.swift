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
        AlertBox.shared.enableAlertBox(controllerView: self.view)
        AlertBox.shared.addButton(title: "Allow") {
            self.present(customButton(), animated: true, completion: nil)
            print("Permission Granted")
            AlertBox.shared.removeAlertBox()
            AlertBox.shared = nil
        }
        AlertBox.shared.addLabel(text: "Permission Needed...!", fontSize: .large)
        AlertBox.shared.addLabel(text: "This app need permission to access your contacts", fontSize: .medium)
        AlertBox.shared.addButton(title: "Don't Allow") {
            print("Permission Not Granted")
        }
    }
}

