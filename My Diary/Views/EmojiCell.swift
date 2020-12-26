//
//  EmojiCell.swift
//  My Diary
//
//  Created by Nitin Patil on 26/12/20.
//

import Foundation
import UIKit
import Photos
//
class EmojiCell : UICollectionViewCell {

  
    

    
    let cardImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFit
        return img
    }()
    
 
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        addSubview(cardImage)
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        addSubview(label)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints(){
        
        NSLayoutConstraint.activate([
            
//            label.centerYAnchor.constraint(equalTo: centerYAnchor),
//            label.centerXAnchor.constraint(equalTo: centerXAnchor)
            
            cardImage.heightAnchor.constraint(equalToConstant: 80),
            cardImage.widthAnchor.constraint(equalToConstant: 80),


            
            cardImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            cardImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            cardImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            cardImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
////
        ])
    }
}

