//
//  ViewController+Extension.swift
//  ProteusVision
//
//  Created by Nitin Patil on 04/05/20.
//  Copyright © 2020 Proteus Technologies. All rights reserved.
//

import Foundation
import  UIKit
//import SwiftGifOrigin
//import Elephant


var vSpinner : UIView?
var vLoader : UIImageView?

//extension UIViewController {
//
//    func showSpinner(onView : UIView) {
//
//        let spinnerView = UIView.init(frame: onView.bounds)
//        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
//        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
//        ai.startAnimating()
//        ai.center = spinnerView.center
//
//        DispatchQueue.main.async {
//            spinnerView.addSubview(ai)
//            onView.addSubview(spinnerView)
//        }
//
//        vSpinner = spinnerView
//    }
//
//    func removeSpinner() {
//        DispatchQueue.main.async {
//            vSpinner?.removeFromSuperview()
//            vSpinner = nil
//        }
//    }
//
//    func hideKeyboardTappedArround(){
//        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dissmissKeyboard))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//    }
//
//    @objc func dissmissKeyboard(){
//        view.endEditing(true)
//    }
//
//
//    func showLoader(onView : UIView,height : CGFloat ,width : CGFloat ){
//
//        let svgView = UIImageView()
//        svgView.image = UIImage.gif(name: "Ellipsis")
//
//        DispatchQueue.main.async {
//
//            onView.addSubview(svgView)
//            svgView.translatesAutoresizingMaskIntoConstraints = false
//
//            svgView.centerXAnchor.constraint(equalTo: onView.centerXAnchor).isActive = true
//            svgView.centerYAnchor.constraint(equalTo: onView.centerYAnchor).isActive = true
//            svgView.widthAnchor.constraint(equalToConstant: width).isActive = true
//            svgView.heightAnchor.constraint(equalToConstant: height).isActive = true
//        }
//
//        vLoader = svgView
//
//    }
//
//    func removeLoader(){
//
//        DispatchQueue.main.async {
//            vLoader?.removeFromSuperview()
//            vLoader = nil
//        }
//
//    }
//
//    func jsonParsor(dictionary : [String : String]) -> NSString {
//        let theJSONData = try? JSONSerialization.data(
//            withJSONObject:  dictionary,
//            options: JSONSerialization.WritingOptions(rawValue: 0))
//        let theJSONText = NSString(data: theJSONData!, encoding: String.Encoding.utf8.rawValue)
//        return theJSONText ?? ""
//    }
//}

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
    
    
}


