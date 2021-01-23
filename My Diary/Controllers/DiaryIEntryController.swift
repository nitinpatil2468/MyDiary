//
//  DiaryIEntryController.swift
//  My Diary
//
//  Created by Nitin Patil on 02/10/20.
//

import UIKit


class DiaryIEntryController: RootViewController{

        var array = [URL]()
        var urlStrings : [String]?
        var imageDirectory:URL!
        var textHeightConstraint: NSLayoutConstraint!
        var cvHeightConstraint: NSLayoutConstraint!
    
        var isLoaded = Bool()
        var savedTitle = String()
        var time = Double()
        var date = Double()
    
        var homeDelegate : HomeControllerDelegate?
    
       var savedDetail:String?{
        didSet{
            txtView.text = savedDetail
            print(txtView.frame.size.height)
        }
    }
    

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
        tv.showsVerticalScrollIndicator = false
        tv.delegate = self
        tv.font = UIFont(name: "GoogleSans-Regular", size: 18)
        tv.contentInset = UIEdgeInsets(top: 0,left: 15,bottom: 0,right: 10);
        tv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return tv

    }()
    
    lazy var subView : SubView = {
        
        let tv = SubView.init(frame: .zero)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return tv

    }()
    
    lazy var titleView :TitleView = {
        
        let tv = TitleView.init(frame: .zero, button: addButton)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return tv
        
    }()
    
    let addButton:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.init(systemName: "plus"), for: .normal)
        btn.imageView?.contentMode = .center
        btn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btn.tintColor = #colorLiteral(red: 0.5353659864, green: 0.5353659864, blue: 0.5353659864, alpha: 1)
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(showEmojiPicker), for: .touchUpInside)
        btn.layer.cornerRadius = 50/2
        return btn
    }()
    
    lazy var saveButton : UIButton = {
        let btn  = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        btn.setImage(UIImage(named: "save.png"), for: .normal)
        btn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        btn.addTarget(self, action: #selector(self.saveEntry), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 30
        return btn
    }()
    
    var moodType:String?{
        didSet{
            let img = moodType?.image()
            addButton.setImage(img, for: .normal)
            addButton.imageView?.contentMode = .scaleAspectFit
        }
    }

    override func viewDidLoad() {
        self.view.backgroundColor = #colorLiteral(red: 0.9922418153, green: 0.9401817535, blue: 0.7990587617, alpha: 1)
        super.viewDidLoad()
        self.setUp()
        // Do any additional setup after loading the view.
    }
    
    func setUp(){
        
        self.view.addSubview(subView)
        self.view.addSubview(titleView)
        self.view.addSubview(collectionView)
        self.view.addSubview(txtView)
        self.view.addSubview(saveButton)
        self.hideKeyboardWhenTappedAround()
        self.setNavigationButtons()
        self.setUpConstraints()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isLoaded{
            UserDefaults.standard.set(time, forKey: "uniqueTime")
            UserDefaults.standard.set(date, forKey: "uniqueDate")
            titleView.titlefield.text = self.savedTitle
            txtView.text = self.savedDetail
            subView.datelbl.date =  Date(timeIntervalSince1970: date/1000)
            subView.timelbl.date =  Date(timeIntervalSince1970: time/1000)
            self.setNavigationButtons()
            adjustTextViewHeight()

        }else{
            UserDefaults.standard.set(nil, forKey: "uniqueTime")
            UserDefaults.standard.set(nil, forKey: "uniqueDate")

        }

    }
    
    @objc func showEmojiPicker(){
        
        let vc = EmojiPicker()
        let nav = UINavigationController(rootViewController: EmojiPicker())
        vc.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
    }
    
    
    
    
    func setNavigationButtons(){
        
        let addPhoto = buttonData.init(title: "Camera", image: "add.png", action: #selector(addImage(sender:)))
//        let menu = buttonData.init(title: "Menu", image: "menu.png", action: #selector(addImage))
        let back = buttonData.init(title: "Back", image: "back.png", action: #selector(dissmiss))
        self.setLeftButton(array: [back])
        
        if array.count > 0{
            let deletePhoto = buttonData.init(title: "Camera", image: "Remove.png", action: #selector(removeImage(sender:)))
            self.setRightButton(array: [addPhoto,deletePhoto])
            collectionView.reloadData()
        }else{
            self.setRightButton(array: [addPhoto])
        }
    }
    
    @objc func saveEntry(){
        
        if let title = titleView.titlefield.text,
            let details = txtView.text
             {
            var diaryEntry = [String:String]()

            let dateStamp = (subView.datelbl.date.timeIntervalSince1970 * 1000).rounded()
            let timeStamp = (subView.timelbl.date.timeIntervalSince1970 * 1000).rounded()
            
            print(" Saving date \(dateStamp)")
            print(" Saving time \(timeStamp)")
            
            for url in array{
                self.urlStrings = []
                self.urlStrings!.append(url.lastPathComponent)
            }

            diaryEntry["title"] = title
            diaryEntry["dateStamp"] = String(dateStamp)
            diaryEntry["timeStamp"] = String(timeStamp)
            diaryEntry["photoUrl"] = urlStrings?.joined(separator: ",")
            diaryEntry["detail"] = details
            diaryEntry["emojiString"] = moodType
            EntryDBHelper.sharedInstance.addNewEntry(object: diaryEntry)

            self.dismiss(animated: true) {
                self.homeDelegate?.reloadTable()
            }
        }
    }
    
    @objc func removeImage(sender:UIBarButtonItem){
        
        for cell in collectionView.visibleCells{
            if let indexPath = collectionView.indexPath(for: cell){
                
                self.collectionView.performBatchUpdates({
                    array.remove(at: indexPath.row)
                    collectionView.deleteItems(at: [indexPath])
                    
                }){_ in
                    if self.array.count == 0{
                        self.setNavigationButtons()
                        self.cvHeightConstraint.constant = 0
                    }
                }
            }
        }
    }



    @objc func addImage(sender:UIBarButtonItem){
        
        let controller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let Camera = UIAlertAction(title: "Camera", style: .default) { (UIAlertAction) in
            let picker = UIImagePickerController.init()
            picker.sourceType = .camera
            picker.allowsEditing = true
            picker.delegate = self
            picker.modalPresentationStyle = .fullScreen
            self.present(picker, animated: true, completion: nil)
        }
        
        let Gallery = UIAlertAction(title: "Gallery", style: .default) { (UIAlertAction) in
            let picker = UIImagePickerController.init()
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            picker.delegate = self
            picker.modalPresentationStyle = .fullScreen
            self.present(picker, animated: true, completion: nil)
        }
        controller.addAction(Camera)
        controller.addAction(Gallery)
        
        let popover = controller.popoverPresentationController
        popover?.sourceView = view
        popover?.sourceRect = CGRect(x: 32, y: 32, width: 0, height: 0)
        popover?.barButtonItem = sender
        
        self.present(controller, animated: true, completion: nil)

    }
    
    @objc func dissmiss(){
        
        self.dismiss(animated: true, completion: nil)
   
    }
    
    
    func setUpConstraints(){
        
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
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
        txtView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20).isActive = true

        self.textHeightConstraint = txtView.heightAnchor.constraint(greaterThanOrEqualToConstant: 200)
        self.textHeightConstraint.isActive = true
        
        saveButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        saveButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 60).isActive = true

    }

}

extension DiaryIEntryController : UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegateFlowLayout,UITextViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if array.count > 0 {
            
            cvHeightConstraint.constant = self.view.frame.height / 5
            
        }
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! imageCell
        cell.data = array[indexPath.row]
        return cell
     }
    
    func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = ImageViewController()
        vc.urlArray = array
        let nav = UINavigationController.init(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let img = info[.originalImage] {
            self.createDirecotry(image: img as! UIImage)
            array.append(self.imageDirectory)
         }
        self.dismiss(animated: true, completion: { [self] in
            
            self.setNavigationButtons()
        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func createDirecotry(image : UIImage){
        
        let tempDirectoryURL = NSURL.fileURL(withPath: NSTemporaryDirectory(), isDirectory: true)
        let  imageName = String(format: "%@%x%@", "Snap",(NSDate().timeIntervalSince1970 * 1000),".png")
        self.imageDirectory = tempDirectoryURL.appendingPathComponent(imageName)
        if let data = image.jpegData(compressionQuality:  0),
            !FileManager.default.fileExists(atPath: self.imageDirectory.path) {
            do {
                // writes the image data to disk
                try data.write(to: self.imageDirectory)
            } catch {
                print("error saving file: ", error)
            }
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        adjustTextViewHeight()
       }
    
    func adjustTextViewHeight(){
        let size = CGSize(width: 250, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let newFrame = NSString(string: txtView.text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], context: nil)
        print(newFrame.height)
        if newFrame.height > 200{
            self.textHeightConstraint.constant = CGFloat(newFrame.height + 5)
            self.view.layoutIfNeeded()
    }
    }

}
