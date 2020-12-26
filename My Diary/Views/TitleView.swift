//
//  TitleView.swift
//  My Diary
//
//  Created by Nitin Patil on 20/10/20.
//

import UIKit

class TitleView: UIView {

    var titlefield : UITextField = {
        
        let tf = UITextField.init(frame: .zero)
        tf.placeholder = "Title"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.font = UIFont(name: "GoogleSans-Bold", size: 20)
        return tf
    }()
    
    var addButton : UIButton?

    
     init(frame: CGRect,button:UIButton) {
        
        super.init(frame: frame)
        addSubview(titlefield)
        addButton = button
        addSubview(addButton!)

        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
       
            titlefield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titlefield.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titlefield.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            addButton!.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addButton!.heightAnchor.constraint(equalToConstant: 50),
            addButton!.widthAnchor.constraint(equalToConstant: 50),
            titlefield.trailingAnchor.constraint(equalTo: addButton!.leadingAnchor, constant: -20),
            addButton!.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    
    
    
}
