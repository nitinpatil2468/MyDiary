//
//  TxtImageCell.swift
//  My Diary
//
//  Created by Nitin Patil on 13/12/20.
//

import UIKit

class TxtImageCell: UITableViewCell {
    
    
    @IBOutlet weak var DetailView: UIView!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var monthLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var discLbl: UILabel!
    
    var data:EntryItem?{
        didSet{
            manageData()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func manageData(){
        
        guard let data = data else {return}
        titleLbl.text = data.getTITLE()
        discLbl.text = data.getDetails()
        setImage((data.getImages()?.first)!)

        self.setDay()
        self.setMonth()
        self.setDate()

    }
    
    func setImage(_ urlString:String){
        print(urlString)
        let tempDirectoryURL = NSURL.fileURL(withPath: NSTemporaryDirectory(), isDirectory: true)
        let imageDirectory = tempDirectoryURL.appendingPathComponent(urlString)
            print(imageDirectory)
            do{
                let imageData = try Data(contentsOf: imageDirectory)
                let img = UIImage(data: imageData )
                imgView.image = img
            }catch{
                print(error.localizedDescription)
            }
    }
    

    
    func setDay(){
        
        if let timeStamp = Double((data?.DateStamp)!){
            
            print(" Loding time \(timeStamp)")
            
            let date = NSDate(timeIntervalSince1970: timeStamp/1000)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EE"
            print(dateFormatter.string(from: date as Date)) // 20 Mar 2018, 23:41:40
            dayLbl.text = dateFormatter.string(from: date as Date)
        }
    }
    
    func setMonth(){
        
        if let timeStamp = Double((data?.DateStamp)!){
            
            print(" Loding date \(timeStamp)")

            let date = NSDate(timeIntervalSince1970: timeStamp/1000)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM"
            print(dateFormatter.string(from: date as Date)) // 20 Mar 2018, 23:41:40
            monthLbl.text = dateFormatter.string(from: date as Date)
        }
    }
    
    func setDate(){
        
        if let timeStamp = Double((data?.DateStamp)!){
            let date = NSDate(timeIntervalSince1970: timeStamp/1000)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd"
            print(dateFormatter.string(from: date as Date)) // 20 Mar 2018, 23:41:40
            dateLbl.text = dateFormatter.string(from: date as Date)
        }
    }
    
}
