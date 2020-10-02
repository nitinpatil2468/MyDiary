//
//  ViewController.swift
//  ViewsProgrammatically
//
//  Created by Douglas Galante on 3/16/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

// let frame = self.view.frame
//let layout = UICollectionViewFlowLayout()

//frame: frame, collectionViewLayout: layout


class ViewController: RootViewController {

    var addBtn: UIButton = {
    let btn = UIButton()
    btn.backgroundColor = #colorLiteral(red: 0.7444462865, green: 0.09182948204, blue: 0.3330006729, alpha: 1)
    btn.setImage(UIImage.init(named: "plus.png"), for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
}()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        self.view.addSubview(self.addBtn)
        self.addBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.addBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.addBtn.heightAnchor.constraint(equalToConstant: 70).isActive = true
        self.addBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.addBtn.layer.cornerRadius = self.addBtn.frame.height/2.0

    }
    
    
    
    
}





