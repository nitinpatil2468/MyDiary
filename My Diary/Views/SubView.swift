//
//  SubView.swift
//  My Diary
//
//  Created by Nitin Patil on 19/10/20.
//

import UIKit

class SubView: UIView {

    let timelbl : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .white
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        let result = formatter.string(from: date)
        lbl.text = result
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(setDate(_:)))
         lbl.isUserInteractionEnabled = true
        lbl.addGestureRecognizer(labelTap)
        return lbl
    
    }()
    
    let datelbl : UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .white
        let date = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        let result = formatter.string(from: date)
        lbl.text = result
        return lbl
    
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        addSubview(datelbl)
        addSubview(timelbl)


        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
       
            timelbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            timelbl.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            timelbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            datelbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            datelbl.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            datelbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        
        ])
    }
    
    @objc func setDate(_ sender: UITapGestureRecognizer) {
            print("labelTapped")
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
