//
//  EmojiPicker.swift
//  My Diary
//
//  Created by Nitin Patil on 26/12/20.
//

import Foundation
import UIKit




class EmojiPicker: RootViewController {

    var Cancel: UIButton = {
    let btn = UIButton()
    btn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    btn.setTitle("Cancel", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.addTarget(self, action: #selector(dissmiss), for: .touchUpInside)
    return btn
}()
    
    var Ok: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btn.setTitle("Ok", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(selectMood), for: .touchUpInside)
        return btn
    }()
    
    lazy var collectionView:UICollectionView = {
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    layout.scrollDirection = .horizontal
    let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    cv.translatesAutoresizingMaskIntoConstraints = false
    cv.showsHorizontalScrollIndicator = false
    cv.setCollectionViewLayout(layout, animated: false)
    cv.delegate = self
    cv.dataSource = self
    cv.register(EmojiCell.self, forCellWithReuseIdentifier: "emojicell")
    cv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    return cv
}()
    
    var emojiList: [[String]] = []
    let sectionTitle: [String] = ["Emoticons"]
    var mood = String()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        fetchEmojis()
        configureUI()
        
    }
    
    func configureUI(){
        view.addSubview(collectionView)
        view.addSubview(Ok)
        view.addSubview(Cancel)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        navigationItem.title = "Mood"
        self.navigationController?.navigationBar.titleTextAttributes =  [NSAttributedString.Key.font:UIFont(name: "GoogleSans-Bold", size: 20)!]
        setConstraints()
    }
    
    func setConstraints(){
        
        Cancel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        Cancel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        Cancel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        Cancel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        Ok.rightAnchor.constraint(equalTo: Cancel.leftAnchor, constant: -10).isActive = true
        Ok.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        Ok.heightAnchor.constraint(equalToConstant: 50).isActive = true
        Ok.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        collectionView.bottomAnchor.constraint(equalTo: Cancel.topAnchor, constant: -30).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true

    }
    
    func fetchEmojis(){

        let emojiRanges = [
            0x1F601...0x1F64F
        ]

        for range in emojiRanges {
            var array: [String] = []
            for i in range {
                if let unicodeScalar = UnicodeScalar(i){
                    array.append(String(describing: unicodeScalar))
                }
            }

            emojiList.append(array)
        }
    }
    
    @objc func dissmiss(){
 
        self.dismiss(animated: true,completion: nil)
}
    
    @objc func selectMood(){
        
        if mood != ""{
            if let nav = self.presentingViewController as? UINavigationController{
                let arr = nav.viewControllers
                if let vc = arr.last  as? DiaryIEntryController{
                    print(mood)
                    vc.moodType = mood
                }
            }
        }
        self.dismiss(animated: true,completion: nil)
}
}

extension EmojiPicker:UICollectionViewDelegate,UICollectionViewDataSource,UINavigationControllerDelegate,UICollectionViewDelegateFlowLayout {
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emojicell", for: indexPath) as! EmojiCell
        cell.cardImage.image = emojiList[indexPath.section][indexPath.item].image()
        return cell
    }
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojiList[section].count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return emojiList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let str = emojiList[indexPath.section][indexPath.item]
        mood = str
    }

}

