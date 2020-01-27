//
//  ViewController.swift
//  drowDropMenu
//
//  Created by cristian ayala on 1/25/20.
//  Copyright © 2020 cristian ayala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var button : DropDownBtn = {
        let button = DropDownBtn(type: .custom)
        button.setTitle("Colors", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(handleTapped), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        
        
    }

    private func setupView(){
        self.view.addSubview(button)
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        button.dropDownView.dropDownOptions = ["1","2","3","4","5","6"]
    }
//    @objc func handleTapped (){
//        print("hola")
//    }
    
}

