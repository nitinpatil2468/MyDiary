//
//  TextEntryView.swift
//  My Diary
//
//  Created by Nitin Patil on 02/10/20.
//

import UIKit

class TextEntryView: UIView {

    
     var cardView:UIView = {
         let v = UIView()
         v.translatesAutoresizingMaskIntoConstraints = false
         v.backgroundColor = .white
//         v.setCardShadow()
         v.layer.cornerRadius = 20
         return v
     }()
     
     let TopBar:UIView = {
         let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
         v.translatesAutoresizingMaskIntoConstraints = false
         return v
     }()
     
   
     let dateLabel:UILabel = {
         let l = UILabel()
         l.text = "10 - 15 min"
        l.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
         l.translatesAutoresizingMaskIntoConstraints = false
         return l
     }()
     
     let timeLabel:UILabel = {
         let l = UILabel()
         l.translatesAutoresizingMaskIntoConstraints = false
         l.textColor = .black
        l.backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
         l.text = "10 - 15 min"
         l.font = UIFont.systemFont(ofSize: 17, weight: .regular)
         return l
     }()
     
     override init(frame: CGRect) {
         super.init(frame:frame)
//        TopBar.addSubview(dateLabel)
//         TopBar.addSubview(timeLabel)
//         cardView.addSubview(TopBar)
         addSubview(cardView)
         setUpConstraints()
     }
     
     func setUpConstraints(){
         NSLayoutConstraint.activate([
        
                     cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                     cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
                     cardView.topAnchor.constraint(equalTo: topAnchor, constant: 020),
                     cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20)
             
//             cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//             cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//             cardView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//             cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
//
//             TopBar.topAnchor.constraint(equalTo: cardView.topAnchor , constant: 0),
//             TopBar.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 0),
//             TopBar.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 0),
//             TopBar.heightAnchor.constraint(equalToConstant: 100),
//
//             dateLabel.leadingAnchor.constraint(equalTo: TopBar.leadingAnchor, constant: 10),
//             dateLabel.topAnchor.constraint(equalTo: TopBar.topAnchor , constant: 10),
//             dateLabel.bottomAnchor.constraint(equalTo: TopBar.bottomAnchor, constant: 10),
//
//             timeLabel.trailingAnchor.constraint(equalTo: TopBar.trailingAnchor, constant: 10),
//             timeLabel.topAnchor.constraint(equalTo: TopBar.topAnchor , constant: 10),
//             timeLabel.bottomAnchor.constraint(equalTo: TopBar.bottomAnchor, constant: 10),
         ])
     }
     
     
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
     

}
