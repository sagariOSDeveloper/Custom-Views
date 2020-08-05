//
//  AlertBox.swift
//  Custom Views
//
//  Created by Sagar Baloch on 05/08/2020.
//  Copyright © 2020 Sagar Baloch. All rights reserved.
//

import Foundation
import UIKit

class AlertBox {
    static var shared = AlertBox()
    private init(){}
    var textHead:String = "Title Head"
    var subText:String = "Title"
    var button1Text:String = "Allow"
    var button2Text:String = "Don't Allow"
    fileprivate var stackView = UIStackView()
    
    func showAlertBox(controllerView: UIView? = nil){
    guard let mainView:UIView = UIApplication.shared.keyWindow ?? controllerView else {return}
    setStackView(controllerView: mainView)
    addSubViews()
    }
    
//    Setting up Stack View
    
    fileprivate func setStackView(controllerView: UIView?){
        controllerView?.addSubview(stackView)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.backgroundColor = .blue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: controllerView!.centerYAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: controllerView!.leftAnchor,constant: 20).isActive = true
        stackView.rightAnchor.constraint(equalTo: controllerView!.rightAnchor,constant: -20).isActive = true
    }
    
//    Adding Sub Views
    fileprivate func addSubViews(){
        stackView.addArrangedSubview(labelHead)
        stackView.addArrangedSubview(labelTitle)
        stackView.addArrangedSubview(bt)
        bt.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stackView.addArrangedSubview(bt2)
    }
    
//    Buttons
    
    fileprivate lazy var bt: UIButton = {
        return returnButton(title: button1Text)
    }()
    
    fileprivate lazy var bt2: UIButton = {
        return returnButton(title: button2Text)
    }()
    
//    Label
    
    fileprivate lazy var labelHead:UILabel = {
        return returnLabel(font: .boldSystemFont(ofSize: 18), text: textHead)
    }()
    
    fileprivate lazy var labelTitle:UILabel = {
        return returnLabel(font: .systemFont(ofSize: 14), text: subText)
    }()
    
//    func removeAlertBox(controllerView: UIView? = nil){
//        guard let mainView:UIView = UIApplication.shared.keyWindow ?? controllerView else {return}
//        stackView.removeFromSuperview()
//    }
    func removeAlertBox(){
        stackView.removeFromSuperview()
    }
    func returnButton(title:String)->UIButton{
        let bt = UIButton()
        bt.layer.cornerRadius = 20
        bt.setTitle(title, for: .normal)
        bt.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        bt.titleLabel?.font = .boldSystemFont(ofSize: 18)
        bt.layer.borderWidth = 3
        bt.layer.borderColor = UIColor.red.cgColor
        return bt
    }
    func returnLabel(font: UIFont, text:String)->UILabel{
        let labl = UILabel()
               labl.text = text
               labl.textAlignment = .center
               labl.numberOfLines = 0
               labl.font = font
               return labl
    }
}
