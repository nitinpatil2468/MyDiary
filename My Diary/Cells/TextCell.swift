//
//  TextCell.swift
//  My Diary
//
//  Created by Nitin Patil on 13/12/20.
//

import UIKit

class TextCell: UITableViewCell {
    
    
    @IBOutlet weak var DetailView: UIView!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var monthLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var discLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
