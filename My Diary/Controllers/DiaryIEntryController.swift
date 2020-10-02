//
//  DiaryIEntryController.swift
//  My Diary
//
//  Created by Nitin Patil on 02/10/20.
//

import UIKit

class DiaryIEntryController: RootViewController{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    }
    
  
//        lazy var collectionView:UICollectionView = {
//        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
//        layout.scrollDirection = .horizontal
//        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        cv.showsHorizontalScrollIndicator = false
//        cv.setCollectionViewLayout(layout, animated: false)
//        cv.delegate = self
//        cv.dataSource = self
//        cv.register(EntryViewCell.self, forCellWithReuseIdentifier: "CardCollectionViewCell")
//        cv.backgroundColor = .clear
//        cv.isPagingEnabled = true
//        cv.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
//        return cv
//    }()
    
    lazy var subView : UIView = {
        
        let tv = TextEntryView.init(frame: CGRect.zero)
        tv.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return tv

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        self.setUp()

        // Do any additional setup after loading the view.
    }
    
    func setUp(){
        
//        self.view.addSubview(collectionView)
//        let subView = TextEntryView.init(frame: CGRect.zero)
        view.addSubview(subView)
        self.setUpConstraints()

        
        
        
    }
    
    
    func setUpConstraints(){
            
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.heightAnchor.constraint(equalToConstant: 620),
            
//            subView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            subView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            subView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            subView.heightAnchor.constraint(equalToConstant: 620),
            
        subView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        subView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true


            
            
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
