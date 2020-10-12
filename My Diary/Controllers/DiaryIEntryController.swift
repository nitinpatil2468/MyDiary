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
        cv.backgroundColor = .red
//        cv.isPagingEnabled = true
//        cv.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return cv
    }()
    
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
        
        self.setRightButton(title: "Camera", image: "", action:#selector(addImage) )
        self.view.addSubview(collectionView)
//        let subView = TextEntryView.init(frame: CGRect.zero)
//        view.addSubview(collecttionView)
        self.setUpConstraints()

    }
    
    @objc func addImage(){
        
        let picker = UIImagePickerController.init()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
        
        
        
        
        
    }
    
    
    func setUpConstraints(){
            
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
              collectionView.heightAnchor.constraint(equalToConstant: 300).isActive = true

        
            
//            subView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            subView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            subView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            subView.heightAnchor.constraint(equalToConstant: 620),
            
//        subView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        subView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true


            
            
    }

}

extension DiaryIEntryController : UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegateFlowLayout{
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(array)
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
    
    
    
    
    
    
    
    
    
    
    
    
    
}
