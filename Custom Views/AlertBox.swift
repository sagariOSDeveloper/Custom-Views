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
    
    static var shared:AlertBox! = AlertBox()
    private init(){}
    fileprivate var stackView = UIStackView()
    
    func enableAlertBox(controllerView: UIView? = nil){
        guard let mainView:UIView = UIApplication.shared.keyWindow ?? controllerView else {return}
        mainView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        addStackBackground()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: mainView.leftAnchor,constant: 20).isActive = true
        stackView.rightAnchor.constraint(equalTo: mainView.rightAnchor,constant: -20).isActive = true
    }
    
    //    Setting up Stack View
    
    fileprivate func setStackView(controllerView: UIView?){
        controllerView?.addSubview(stackView)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        addStackBackground()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: controllerView!.centerYAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: controllerView!.leftAnchor,constant: 20).isActive = true
        stackView.rightAnchor.constraint(equalTo: controllerView!.rightAnchor,constant: -20).isActive = true
    }
    
    func addLabel(text:String , fontSize: fontSize){
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.textColor = .white
        //        label.backgroundColor = .red
        //        label.layer.cornerRadius = 20
        //        label.layer.masksToBounds = true
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: CGFloat(fontSize.rawValue))
        stackView.addArrangedSubview(label)
    }
    
    func addButton(title:String, completion:@escaping()-> Void){
        let bt = Button()
        bt.layer.cornerRadius = 20
        bt.setTitle(title, for: .normal)
        bt.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        bt.titleLabel?.font = .boldSystemFont(ofSize: 18)
        bt.layer.borderWidth = 3
        bt.layer.borderColor = UIColor.red.cgColor
        bt.action = {
            completion()
        }
        stackView.addArrangedSubview(bt)
        bt.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    fileprivate func addStackBackground(){
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.gray
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.layer.cornerRadius = 20
        stackView.insertSubview(backgroundView, at: 0)
        backgroundView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
    }
    
    func removeAlertBox(){
        stackView.removeFromSuperview()
    }
}

enum fontSize:Int{
    case small = 14
    case medium = 16
    case large = 20
}

class Button: UIButton {
    var action:(()->Void)?
    
    override init(frame: CGRect) {
        super .init(frame:frame)
        print("Button Initialized")
        self.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    @objc func buttonPressed() {
        action?()
    }
    required init?(coder: NSCoder) {
        super .init(coder:coder)
        print("Button Initialized")
        
    }
    deinit {
        print("Button deinitialized")
    }
}
