//
//  DropDownView.swift
//  drowDropMenu
//
//  Created by cristian ayala on 1/25/20.
//  Copyright © 2020 cristian ayala. All rights reserved.
//

import UIKit




protocol DropDownProtocol : AnyObject{
    func dropDownBtnPressed(element : Any)
}

class DropDownView: UIView , UITableViewDelegate , UITableViewDataSource {

    var identifierCell : String = ""
    weak var dropDownProtocol : DropDownProtocol?
    var dropDownOptions = [Any]()
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
     func setupTableViewCell(identifierCell : String , nibName : String){
        self.identifierCell = identifierCell
        let nibCell = UINib(nibName: nibName, bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: self.identifierCell)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath)
        guard let cellProtocol = cell as? ConfigureCellProtocol else {
            return UITableViewCell()
        }
        cellProtocol.configureCell(data: dropDownOptions[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dropDownProtocol?.dropDownBtnPressed(element: dropDownOptions[indexPath.row])

        
    }
    
}
