//
//  ImageViewController.swift
//  My Diary
//
//  Created by Nitin Patil on 13/12/20.
//

import UIKit

class ImageViewController: RootViewController {
    
    lazy var collectionView:UICollectionView = {
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    layout.scrollDirection = .horizontal
    let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    cv.translatesAutoresizingMaskIntoConstraints = false
    cv.showsHorizontalScrollIndicator = true
    cv.setCollectionViewLayout(layout, animated: false)
    cv.delegate = self
    cv.dataSource = self
    cv.register(imageCell.self, forCellWithReuseIdentifier: "cell")
    cv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    return cv
}()
    
    var urlArray : [URL]?

    override func viewDidLoad() {
        super.viewDidLoad()

        let back = buttonData.init(title: "Back", image: "back.png", action: #selector(dissmiss))
        self.setLeftButton(array: [back])
        self.view.addSubview(collectionView)
        self.setUpConstraints()

    }
    
    func setUpConstraints(){
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
    }
    



@objc func dissmiss(){
    
    self.dismiss(animated: true, completion: nil)

}

}

extension ImageViewController : UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegateFlowLayout,UITextViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urlArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! imageCell
        if let url = urlArray?[indexPath.row]{
            let data = try?Data(contentsOf: url)
            cell.cardImage.image = UIImage.init(data: data!)
        }
      
        return cell
     }
    
    func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
       }
}
