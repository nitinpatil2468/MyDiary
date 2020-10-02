//
//  MainViewController.swift
//  My Diary
//
//  Created by Nitin Patil on 21/09/20.
//

import UIKit

class MainViewController: UIViewController {
    
        let addBtn: UIButton = {
        let frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        let btn = UIButton.init(frame: frame)
        btn.backgroundColor = #colorLiteral(red: 0.7444462865, green: 0.09182948204, blue: 0.3330006729, alpha: 1)
        btn.setImage(UIImage.init(named: "plus.png"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(AddEntry), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(addBtn)
        addBtn.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 20).isActive = true
        addBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 30).isActive = true



    }
    
    @objc func AddEntry(){
        
    }
   

}
