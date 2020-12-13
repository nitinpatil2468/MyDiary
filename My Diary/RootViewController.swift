//
//  CustomNavigationController.swift
//  ProteusVision
//
//  Created by Nitin Patil on 31/08/20.
//  Copyright © 2020 Proteus Technologies. All rights reserved.
//

import UIKit

struct buttonData {
    
    var title : String?
    var image :String?
    var action : Selector?
}

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9922418153, green: 0.9401817535, blue: 0.7990587617, alpha: 1)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.5353659864, green: 0.5353659864, blue: 0.5353659864, alpha: 1);
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.5353659864, green: 0.5353659864, blue: 0.5353659864, alpha: 1)]
        
//        self.setRightButton()
        
        
    }
    
    @objc func openMenuDrawer(){
        
       
    }
    
    @objc func openProfilePage(){
         
      
         
     }
   
    @objc func setNavigationBar(){
        
        let leftButton = UIBarButtonItem(image: UIImage.init(named: "plus.png"), style: .plain, target: self, action: #selector(openMenuDrawer))
        navigationItem.leftBarButtonItems = [leftButton]
        
        let rightButton = UIBarButtonItem(image: UIImage.init(named: "plus.png"), style: .plain, target: self, action: #selector(openMenuDrawer))
        navigationItem.rightBarButtonItems = [rightButton]
        
        
        
    }
    
    func setRightButton(array : [buttonData]) {
        
        var buttonsArray = [UIBarButtonItem]()
        for data in array{
            
            let rightButton = UIBarButtonItem(image:UIImage(named: data.image!), style: .plain, target: self, action: data.action!)
            buttonsArray.append(rightButton)

        }
        self.navigationItem.rightBarButtonItems = buttonsArray

    }
    
    func setLeftButton(array : [buttonData]) {
        
        var buttonsArray = [UIBarButtonItem]()
        for data in array{
            
            let button = UIButton(type: .system)
            button.tintColor = #colorLiteral(red: 0.5353659864, green: 0.5353659864, blue: 0.5353659864, alpha: 1)
            button.setImage(UIImage(named: data.image!), for: .normal)
            button.imageView?.contentMode = .center
            button.sizeToFit()
            button.addTarget(self, action: data.action!, for: .touchUpInside)
            let leftButton = UIBarButtonItem(customView: button)
            buttonsArray.append(leftButton)
            
        }
        self.navigationItem.leftBarButtonItems = buttonsArray

        
    }
    
    
    
    func setTitle(title: String?, subTitle: String?) {
        
        if subTitle != "" {
            
            self.navigationItem.titleView = setSubTitle(title: title!, subtitle: subTitle!)
            
        }else{
            
            self.navigationItem.titleView = nil
            self.navigationItem.title = title
            
        }
        
        
        
    }
        
        func setSubTitle(title:String, subtitle:String) -> UIView {

            let titleLabel = UILabel(frame: CGRect(x: 0, y: -2, width: 0, height: 0))

            titleLabel.backgroundColor = UIColor.clear
            titleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            titleLabel.font = UIFont.init(name: "Roboto-Medium", size: 17)
            titleLabel.text = title
            titleLabel.sizeToFit()

            let subtitleLabel = UILabel(frame: CGRect(x:0, y:18, width:0, height:0))
            subtitleLabel.backgroundColor = .clear
            subtitleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            subtitleLabel.font = UIFont.init(name: "Roboto-Medium", size: 12)
            subtitleLabel.text = subtitle
            subtitleLabel.sizeToFit()


            let titleView = UIView(frame: CGRect(x: 0, y: 0, width: max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height: 30))
            titleView.addSubview(titleLabel)
            titleView.addSubview(subtitleLabel)

            let widthDiff = subtitleLabel.frame.size.width - titleLabel.frame.size.width

            if widthDiff < 0 {
                let newX = widthDiff / 2
                subtitleLabel.frame.origin.x = abs(newX)
            } else {
                let newX = widthDiff / 2
                titleLabel.frame.origin.x = newX
            }

            return titleView
        }
    
    
//    func setLeftButton(title: String?, image: String?, action: Selector) {
//        
//        let button = UIButton(type: .system)
//        button.setImage(UIImage(named: "back.png"), for: .normal)
//        button.imageView?.contentMode = .center
//        button.setTitle(title, for: .normal)
//        button.sizeToFit()
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
//        button.addTarget(self, action: action, for: .touchUpInside)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
//        button.addTarget(self, action: action, for: .touchUpInside)
//        
//    }
}
