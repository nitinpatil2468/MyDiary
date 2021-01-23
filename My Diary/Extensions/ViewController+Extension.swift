//
//  ViewController+Extension.swift
//  My Diary
//
//  Created by Nitin Patil on 26/12/20.
//

import Foundation
import  UIKit


var vSpinner : UIView?
var vLoader : UIImageView?

extension UIViewController {
    
    var topViewController:UIViewController{
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController  {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController as UIViewController
        }
        return UIViewController()
        
    }
    
     func hideKeyboardWhenTappedAround(){
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
     }
    
    @objc func dismissKeyboard(){
        
        view.endEditing(true)
    }
    
    func popupAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    
}


