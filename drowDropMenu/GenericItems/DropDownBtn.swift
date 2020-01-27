//
//  DropDownBtn.swift
//  drowDropMenu
//
//  Created by cristian ayala on 1/25/20.
//  Copyright © 2020 cristian ayala. All rights reserved.
//

import UIKit


protocol DropDownBtnDelegate : AnyObject{
    func getObjectSelected(element : Any)
}


class DropDownBtn : UIButton {
    
    
    weak var dropDownBtnDelegate : DropDownBtnDelegate?
    weak var parentView : UIView?
    var height = NSLayoutConstraint()
    var isOpen = false
    lazy var dropDownView : DropDownView = {
        let dropDownView = DropDownView()
        dropDownView.translatesAutoresizingMaskIntoConstraints = false
        dropDownView.layer.borderColor = UIColor.lightGray.cgColor
        dropDownView.layer.borderWidth = 1
        return dropDownView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dropDownView.dropDownProtocol  = self 
    }
    
    
    
    
    override func didMoveToSuperview() {
        guard let superViewOfButton = self.parentView else  {
            return
        }
        superViewOfButton.addSubview(dropDownView)
        superViewOfButton.bringSubviewToFront(dropDownView)
        NSLayoutConstraint.activate([
            dropDownView.topAnchor.constraint(equalTo: self.bottomAnchor,constant: -2),
            dropDownView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dropDownView.widthAnchor.constraint(equalTo: self.widthAnchor),

        ])
        height = dropDownView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen {
            dismissDropDownMenu()
        }
        else{
            openDropDownMenu()
        }
    }
    func setupParentView(parentView : UIView){
        self.parentView = parentView
    }
    
    private func dismissDropDownMenu(){
        NSLayoutConstraint.activate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        isOpen = !isOpen
        UIView.animate(withDuration: 0.5, delay: 0.0,usingSpringWithDamping: 0.5,initialSpringVelocity: 0.5  ,options: .curveEaseInOut, animations: {
            self.dropDownView.center.y -= self.dropDownView.frame.height / 2
            self.dropDownView.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    private func openDropDownMenu(){
        isOpen = !isOpen
        NSLayoutConstraint.activate([self.height])
        
        if self.dropDownView.tableView.contentSize.height > 150{
        self.height.constant = 150
        } else {
            self.height.constant = self.dropDownView.tableView.contentSize.height
        }
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0.0,usingSpringWithDamping: 0.5,initialSpringVelocity: 0.5  ,options: .curveEaseInOut, animations: {
            self.dropDownView.center.y += self.dropDownView.frame.height / 2
            self.dropDownView.layoutIfNeeded()
            
        }, completion: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

extension DropDownBtn : DropDownProtocol{
    func dropDownBtnPressed(element: Any) {
        dismissDropDownMenu()
        dropDownBtnDelegate?.getObjectSelected(element: element)
    }
    
    
}
