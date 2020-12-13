//
//  HomeController.swift
//  My Diary
//
//  Created by Nitin Patil on 24/09/20.
//

import UIKit

class HomeController: RootViewController {
    
    lazy var tableView:UITableView = {
        
    let tv = UITableView(frame: .zero)
    tv.translatesAutoresizingMaskIntoConstraints = false
    tv.showsHorizontalScrollIndicator = false
    tv.delegate = self
    tv.dataSource = self
    tv.register(UINib(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "textCell")
    tv.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    return tv
        
}()
    
    var cvHeightConstraint: NSLayoutConstraint!

    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let rightButton = buttonData.init(title: "Calender", image: "Calender.png", action: #selector(doSomething))
        self.setRightButton(array: [rightButton])
        self.view.addSubview(self.tableView)
        self.setUpConstraints()

        // Do any additional setup after loading the view.
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
        cvHeightConstraint = tableView.heightAnchor.constraint(equalToConstant: 70)
        cvHeightConstraint.isActive = true
        
    }
    
    @objc func doSomething(){
        
        print("doSomething")
        
    }

}

extension HomeController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath) as! TextCell
        cell.DetailView.alpha = 0.3
        cell.titleLbl.text = "Title"
        cell.discLbl.text = "hi it is working"
        cell.imgView.image = (UIImage.init(named: "plus.png"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        cvHeightConstraint.constant = self.view.frame.height / 5
        return self.view.frame.height / 5
        
    }
    
    
    
    
    
    
    
    
}


