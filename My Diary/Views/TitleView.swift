//
//  TitleView.swift
//  My Diary
//
//  Created by Nitin Patil on 20/10/20.
//

import UIKit

class TitleView: UIView {

    let titlefield : UITextField = {
        
        let tf = UITextField.init(frame: .zero)
        tf.placeholder = "Title"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        return tf
    }()

    let imageView : UIImageView = {
        
        let img = UIImageView()
        img.image = UIImage.init(systemName: "plus")
        img.contentMode = .center
        img.backgroundColor = #colorLiteral(red: 0.9922418153, green: 0.9401817535, blue: 0.7990587617, alpha: 1)
        img.tintColor = #colorLiteral(red: 0.5353659864, green: 0.5353659864, blue: 0.5353659864, alpha: 1)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        addSubview(titlefield)
        addSubview(imageView)

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
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            titlefield.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -20),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor)


            
        
        ])
    }
    
    
    
    
}
