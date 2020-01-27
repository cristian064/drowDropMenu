//
//  ViewController.swift
//  drowDropMenu
//
//  Created by cristian ayala on 1/25/20.
//  Copyright © 2020 cristian ayala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var nameOfButtonSelected : String = ""
    lazy var button : DropDownBtn = {
        let button = DropDownBtn(type: .custom)
        button.setTitle("Colors", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setupParentView(parentView: self.view)
        button.dropDownView.setupTableViewCell(identifierCell: "CustomTableViewCell", nibName: "CustomTableViewCell")
        button.layer.cornerRadius = 5
        button.dropDownBtnDelegate = self
        button.backgroundColor = .red
        
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
        button.dropDownView.dropDownOptions = [User(name: "cristian", lastName: "ayala"),User(name: "litman", lastName: "ayala"),User(name: "juan", lastName: "ley")]
    }
    
}

extension ViewController : DropDownBtnDelegate{
    func getObjectSelected(element: Any) {
        let element = element as! User
        button.setTitle(element.name, for: .normal)
        print(element)
    }
    
    
}
