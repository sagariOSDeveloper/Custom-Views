//
//  Loading View.swift
//  Custom Views
//
//  Created by Sagar Baloch on 04/08/2020.
//  Copyright © 2020 Sagar Baloch. All rights reserved.
//

import Foundation
import UIKit



// This is an Loading View
//You can show it by using showLoading() method.
//Hide it by using hideLoading() method.

class LoadingView: UIView {
    
    static var loadingView: LoadingView?
    
   static func showLoading(controllerView: UIView? = nil){
        guard let mainView:UIView = UIApplication.shared.keyWindow ?? controllerView else {return}
        
        loadingView = LoadingView()
        
        guard let loadingView = loadingView else{ return }
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(loadingView)
        loadingView.leftAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
        loadingView.rightAnchor.constraint(equalTo: mainView.rightAnchor).isActive = true
        loadingView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        print("showLoading called")
    }
    
    
   fileprivate lazy var loadingSpinner: UIActivityIndicatorView = {
    var activityIndicator  = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    fileprivate lazy var background:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .red
        v.alpha = 0.6
        return v
    }()
    
    fileprivate lazy var progress:UIProgressView = {
    var prog = UIProgressView()
    prog.progress = 0.5
    prog.progressTintColor = .white
    prog.translatesAutoresizingMaskIntoConstraints = false
    return prog
    }()
    
    fileprivate func setupViews(){
        self.addSubview(background)
        background.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        background.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        background.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.addSubview(loadingSpinner)
        loadingSpinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loadingSpinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        loadingSpinner.startAnimating()
        self.addSubview(progress)
        progress.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 20).isActive = true
        progress.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -20).isActive = true
        progress.topAnchor.constraint(equalTo: loadingSpinner.bottomAnchor,constant: 20).isActive = true
    }
    
    static func hideLoading(){
         loadingView?.removeFromSuperview()
    }
    //When you're inflating with code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    //When you're inflating with storyboard/xib
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()

    }

}
