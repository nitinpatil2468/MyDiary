////
////  EntryView.swift
////  My Diary
////
////  Created by Nitin Patil on 02/10/20.
////
//
import UIKit
import Photos
//
class imageCell : UICollectionViewCell {

    var data:URL?{
        didSet{
            manageData()
        }
    }
    
//        var data:String?{
//            didSet{
//                manageData()
//            }
//        }
    

    
    let cardImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
//        img.layer.cornerRadius = 20
        return img
    }()
    
    
//    let label:UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.clipsToBounds = true
////        img.contentMode = .scaleAspectFit
//        label.layer.cornerRadius = 20
//        return label
//    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        addSubview(cardImage)
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

            
            cardImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            cardImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            cardImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            cardImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
//
        ])
    }
    
    func manageData(){
        guard let data = data else {return}
//        overlayView.backgroundColor = data.overlayBackground
        cardImage.image =
        self.getImage(url: data)
//        brandName.text = data.brandName
//        setUpAttributeText(data.rating, data.category, data.priceTrend)
//        label.text = data
        
    }
    
    func getImage(url:URL)->UIImage{
        
        var img = UIImage()
        let fileURL = url
        if let imageData = NSData(contentsOf: fileURL) {
            img = UIImage(data: imageData as Data)! // Here you can attach image to UIImageView
        }
       return img
    }

}
