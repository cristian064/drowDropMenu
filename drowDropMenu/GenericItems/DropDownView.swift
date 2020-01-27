//
//  DropDownView.swift
//  drowDropMenu
//
//  Created by cristian ayala on 1/25/20.
//  Copyright © 2020 cristian ayala. All rights reserved.
//

import UIKit




protocol DropDownProtocol : AnyObject{
    func dropDownBtnPressed(string : String)
}

class DropDownView : UIView , UITableViewDelegate , UITableViewDataSource {

    weak var dropDownProtocol : DropDownProtocol?
    var dropDownOptions = [String]()
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
        
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dropDownProtocol?.dropDownBtnPressed(string: dropDownOptions[indexPath.row])
        print(dropDownOptions[indexPath.row])
    }
    
}
