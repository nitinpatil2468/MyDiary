//
//  SubView.swift
//  My Diary
//
//  Created by Nitin Patil on 19/10/20.
//

import UIKit

class SubView: UIView {

    lazy var datelbl : UIDatePicker = {

        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        datePicker.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        datePicker.setDate(Date(), animated: false)
        datePicker.addTarget(self, action: #selector(self.datePickerChanged(sender:)), for:.valueChanged)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    
    }()
    
    lazy var timelbl : UIDatePicker = {

        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        timePicker.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        timePicker.setDate(Date(), animated: false)
        timePicker.addTarget(self, action: #selector(self.datePickerChanged(sender:)), for:.valueChanged)
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        return timePicker
    
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        addSubview(datelbl)
        addSubview(timelbl)


        setUpConstraints()
    }
    
    @IBAction func datePickerChanged(sender: UIDatePicker) {

       print("print \(sender.date)")

      
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
    

    
  
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
