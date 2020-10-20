//
//  DiaryIEntryController.swift
//  My Diary
//
//  Created by Nitin Patil on 02/10/20.
//

import UIKit

class DiaryIEntryController: RootViewController{

        var array = [URL]()
        var imageDirectory:URL!
        var textHeightConstraint: NSLayoutConstraint!
        var cvHeightConstraint: NSLayoutConstraint!



  
        lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.setCollectionViewLayout(layout, animated: false)
        cv.delegate = self
        cv.dataSource = self
        cv.register(imageCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        cv.isPagingEnabled = true
//        cv.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return cv
    }()
    
    lazy var txtView:UITextView = {
        
        let tv = UITextView.init(frame: .zero)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tv.isScrollEnabled = true
        tv.delegate = self
        tv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return tv

    }()
    
    lazy var subView : UIView = {
        
        let tv = SubView.init(frame: .zero)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return tv

    }()
    
    lazy var titleView :UIView = {
        
        let tv = TitleView.init(frame: .zero)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return tv
        
    }()

    override func viewDidLoad() {
        self.view.backgroundColor = #colorLiteral(red: 0.9922418153, green: 0.9401817535, blue: 0.7990587617, alpha: 1)
        super.viewDidLoad()
        self.setUp()

        // Do any additional setup after loading the view.
    }
    
    func setUp(){
        
        let addPhoto = buttonData.init(title: "Camera", image: "add.png", action: #selector(addImage))
        let menu = buttonData.init(title: "Menu", image: "menu.png", action: #selector(addImage))
        let back = buttonData.init(title: "Back", image: "back.png", action: #selector(dissmiss))
        self.setLeftButton(array: [back])
        self.setRightButton(array: [menu,addPhoto])
        self.view.addSubview(subView)
        self.view.addSubview(titleView)
        self.view.addSubview(collectionView)
        self.view.addSubview(txtView)


        self.setUpConstraints()

    }
    
    @objc func addImage(){
        
        let picker = UIImagePickerController.init()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
   
    }
    
    @objc func dissmiss(){
        
        self.dismiss(animated: true, completion: nil)
   
    }
    
    
    func setUpConstraints(){
            
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.cvHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 0)
        self.cvHeightConstraint.isActive = true

        subView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        subView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        subView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20).isActive = true
        subView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        titleView.topAnchor.constraint(equalTo: subView.bottomAnchor, constant: 0).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
                txtView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
                txtView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
                txtView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 0).isActive = true
                self.textHeightConstraint = txtView.heightAnchor.constraint(equalToConstant: 200)
                self.textHeightConstraint.isActive = true
        
               
        

        
            
//            subView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            subView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            subView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            subView.heightAnchor.constraint(equalToConstant: 620),
            
//        subView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        subView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true


            
            
    }

}

extension DiaryIEntryController : UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegateFlowLayout,UITextViewDelegate{
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if array.count > 0 {
            
            cvHeightConstraint.constant = 300
            
        }
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! imageCell
        cell.data = array[indexPath.row]
//        cell.cardView.transform = .identity
        return cell
     }
    
    func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
       }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let img = info[.originalImage] {
            
            self.createDirecotry(image: img as! UIImage)
            array.append(self.imageDirectory)
            print(array)
 
         }
        self.dismiss(animated: true, completion: { [self] in
            
            self.collectionView.reloadData()

        })

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func createDirecotry(image : UIImage){
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let folderDirectory = documentsDirectory.appendingPathComponent("visionSense")
        let success = FileManager.default.fileExists(atPath: folderDirectory.path) as Bool
        if success == false {
            do {
                try! FileManager.default.createDirectory(atPath: folderDirectory.path, withIntermediateDirectories: true, attributes: nil)
            }
        }
        
        let  imageName = String(format: "%@%x%@", "AIimage_",Int.random(in: 1..<5000),".png")
        self.imageDirectory = folderDirectory.appendingPathComponent(imageName)
        if let data = image.jpegData(compressionQuality:  0),
            !FileManager.default.fileExists(atPath: imageDirectory.path) {
            do {
                // writes the image data to disk
                try data.write(to: imageDirectory)
                
            } catch {
                print("error saving file: ", error)
            }
        }
    }
    
    
    
    func textViewDidChange(_ textView: UITextView) {
           self.adjustTextViewHeight()
       }

       func adjustTextViewHeight() {
        
        let cvHeight = collectionView.frame.height
        let tvHeight = textHeightConstraint.constant
        let viewHeight = self.view.frame.height
        print(cvHeight + tvHeight + 70)
        
        
        if cvHeight + tvHeight + 70 < viewHeight {
            
            print(cvHeight)
            print(tvHeight)
            print(viewHeight)
            print(CGFloat.greatestFiniteMagnitude + tvHeight)

            let fixedWidth = txtView.frame.size.width
            let newSize = txtView.sizeThatFits(CGSize(width: fixedWidth, height: 100 + tvHeight))
            print(newSize)

            self.textHeightConstraint.constant = newSize.height
            self.view.layoutIfNeeded()
            
        }
       }
}
