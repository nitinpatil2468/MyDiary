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
    

    let cardImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
//        img.layer.cornerRadius = 20
        return img
    }()

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

            cardImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            cardImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            cardImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            cardImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
//
        ])
    }
    
    func manageData(){
        guard let data = data else {return}
        cardImage.image =
        self.getImage(url: data)
    }
    
    func getImage(url:URL)->UIImage{
        
        var img = UIImage()
        print(url)
        if let imageData = NSData(contentsOf: url) {
            img = UIImage(data: imageData as Data)! // Here you can attach image to UIImageView
        }
       return img
    }

}
