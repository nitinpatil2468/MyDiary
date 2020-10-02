////
////  EntryView.swift
////  My Diary
////
////  Created by Nitin Patil on 02/10/20.
////
//
import UIKit
//
class imageCell : UICollectionViewCell {

//    var data:CellData?{
//        didSet{
//            manageData()
//        }
//    }
    

    
    let cardImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFit
        img.layer.cornerRadius = 20
        return img
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        addSubview(cardImage)
        setUpConstraints()
    }
    
    func setUpConstraints(){
        
        NSLayoutConstraint.activate([
            
            cardImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            cardImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            cardImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            cardImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            
        ])
    }
    
    func manageData(){
//        guard let data = data else {return}
//        overlayView.backgroundColor = data.overlayBackground
//        cardImage.image = UIImage(named:data.image)
//        brandName.text = data.brandName
//        setUpAttributeText(data.rating, data.category, data.priceTrend)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
