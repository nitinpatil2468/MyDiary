//
//  HomeController.swift
//  My Diary
//
//  Created by Nitin Patil on 24/09/20.
//

import UIKit

class HomeController: RootViewController {
    
    @IBOutlet weak var addButton: UIButton!

    
    lazy var tableView:UITableView = {
        
    let tv = UITableView(frame: .zero)
    tv.translatesAutoresizingMaskIntoConstraints = false
    tv.showsHorizontalScrollIndicator = false
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


    override func viewDidLoad() {
        super.viewDidLoad()
        let rightButton = buttonData.init(title: "Calender", image: "Calender.png", action: #selector(getData))
        self.setRightButton(array: [rightButton])
        self.view.backgroundColor = #colorLiteral(red: 0.9999136329, green: 0.9961318374, blue: 0.894012332, alpha: 1)
        self.view.addSubview(self.tableView)
        self.getData()
        self.view.bringSubviewToFront(self.addButton)
        self.setUpConstraints()

    }
    
    @IBAction func addEntry(_ sender: UIButton) {
        
        let vc = DiaryIEntryController()
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
        let images = instance.getImages()
        
        if !images.contains("") {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TxtImageCell", for: indexPath) as! TxtImageCell
            cell.DetailView.alpha = 0.5
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
        let images = instance.getImages()
        
        if !images.contains("") {
            
            return self.view.frame.height / 5

        }else{
            
            return self.view.frame.height / 10

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DiaryIEntryController()
        let nav = UINavigationController.init(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        let instance = Entries[indexPath.section]
        let images = instance.getImages()
        if !images.contains("") {
            var urlArray = [URL]()
            for img in images{
                
                let url = URL(fileURLWithPath: img)
                urlArray.append(url)
            }
            print(urlArray)
            vc.array = urlArray
        }
        
//        vc.savedDetail = instance.getDetails()
//        vc.savedTitle = instance.getTITLE()
        
        vc.savedTitle = "instance.getDetails()"
        vc.savedDetail = "If the repository is on GitHub and you have any Pull Requests that have been opened, you’ll get these references that are prefixed with refs/pull/. These are basically branches, but since they’re not under refs/heads/ you don’t get them normally when you clone or fetch from the server — the process of fetching ignores them normally.There are two references per Pull Request - the one that ends in /head points to exactly the same commit as the last commit in the Pull Request branch. So if someone opens a Pull Request in our repository and their branch is named bug-fix and it points to commit a5a775, then in our repository we will not have a bug-fix branch (since that’s in their fork), but we will have pull/<pr#>/head that points to a5a775. This means that we can pretty easily pull down every Pull Request branch in one go without having to add a bunch of remotes."
        vc.date = Double(252525222)
        vc.time = Double(222225222)
        
        
//        vc.date = Double(instance.getDate())!
//        vc.time = Double(instance.getTime())!
        vc.isLoaded = true
        self.present(nav, animated: false, completion: nil)

    }
}


