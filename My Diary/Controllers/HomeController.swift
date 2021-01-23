//
//  HomeController.swift
//  My Diary
//
//  Created by Nitin Patil on 24/09/20.
//

import UIKit

protocol HomeControllerDelegate {
    func reloadTable()
}

class HomeController: RootViewController {
    
    @IBOutlet weak var addButton: UIButton!

    
    lazy var tableView:UITableView = {
        
    let tv = UITableView(frame: .zero)
    tv.translatesAutoresizingMaskIntoConstraints = false
    tv.showsVerticalScrollIndicator = false
    tv.delegate = self
    tv.dataSource = self
    tv.register(UINib(nibName: "TxtImageCell", bundle: nil), forCellReuseIdentifier: "TxtImageCell")
     tv.register(UINib(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "TextCell")
    tv.backgroundColor = #colorLiteral(red: 0.9999136329, green: 0.9961318374, blue: 0.894012332, alpha: 1)
    tv.tableFooterView = UIView()
        return tv
        
}()
    
    var cvHeightConstraint: NSLayoutConstraint!
    var Entries = [EntryItem]()
    

    
    var emojiList: [[String]] = []
    let sectionTitle: [String] = ["Emoticons"]
    
     func layoutSubviews() {
        fetchEmojis()
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


    override func viewDidLoad() {
        super.viewDidLoad()
        let rightButton = buttonData.init(title: "Calender", image: "Calender.png", action: #selector(showAlert))
        self.setRightButton(array: [rightButton])
        self.navigationItem.title = "My Diary"
        self.view.backgroundColor = #colorLiteral(red: 0.9999136329, green: 0.9961318374, blue: 0.894012332, alpha: 1)
        self.view.addSubview(self.tableView)
        self.getData()
        self.view.bringSubviewToFront(self.addButton)
        self.setUpConstraints()
    }
    
    @IBAction func addEntry(_ sender: UIButton) {
        
        let vc = DiaryIEntryController()
        vc.homeDelegate = self
        let nav = UINavigationController.init(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false, completion: nil)
 
    }
    
    func setUpConstraints(){
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
    }
    
    @objc func getData(){
        let instance = EntryItem()
        instance.setModel()
        Entries = instance.getEntries()!
        print(Entries.count)
        tableView.reloadData()
    }
    
    @objc func showAlert(){
        self.popupAlert(title: "Alert", message: "This functionality not implemented yet", actionTitles: ["Ok"], actions: [nil])
    }
}

extension HomeController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Entries.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10; // space b/w cells
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.isUserInteractionEnabled = false
        header.backgroundColor = UIColor.clear
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let instance = Entries[indexPath.section]
        if instance.getImages() != nil{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TxtImageCell", for: indexPath) as! TxtImageCell
            cell.DetailView.alpha = 0.8
            cell.data = instance
            return cell
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
            cell.data = instance
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let instance = Entries[indexPath.section]
        if instance.getImages() != nil{

            return self.view.frame.height / 3

        }else{
            
            return self.view.frame.height / 6

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DiaryIEntryController()
        let instance = Entries[indexPath.section]
        if let images = instance.getImages(){
            var urlArray = [URL]()
            for img in images{
                let tempDirectoryURL = NSURL.fileURL(withPath: NSTemporaryDirectory(), isDirectory: true)
                let imageDirectory = tempDirectoryURL.appendingPathComponent(img)
                urlArray.append(imageDirectory)
            }
            print(urlArray)
            vc.array = urlArray
        }
        
        if let moodType = instance.getMood(){
            vc.moodType = moodType
        }
        
        vc.savedDetail = instance.getDetails()
        vc.savedTitle = instance.getTITLE()!
        vc.date = Double(instance.getDate()!)!
        vc.time = Double(instance.getTime()!)!
        vc.isLoaded = true
        vc.homeDelegate = self
        let nav = UINavigationController.init(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false, completion: nil)

    }
}

extension HomeController:UICollectionViewDelegate,UICollectionViewDataSource,UINavigationControllerDelegate,UICollectionViewDelegateFlowLayout {
    
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

}

extension HomeController:HomeControllerDelegate {
    func reloadTable() {
        self.getData()
    }
}


