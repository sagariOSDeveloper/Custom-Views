//
//  Transition.swift
//  Custom Views
//
//  Created by Sagar Baloch on 04/08/2020.
//  Copyright © 2020 Sagar Baloch. All rights reserved.
//

import Foundation
import UIKit

class customButton: UIView{
    
    static func addButton(controllerView: UIView? = nil,title: String){
        guard let mainView:UIView = UIApplication.shared.keyWindow ?? controllerView else {return}
        let bt = UIButton()
        bt.layer.cornerRadius = 20
        bt.setTitle(title, for: .normal)
        bt.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        bt.titleLabel?.font = .boldSystemFont(ofSize: 18)
        bt.layer.borderWidth = 3
        bt.layer.borderColor = UIColor.red.cgColor
        mainView.addSubview(bt)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        bt.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        bt.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bt.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
