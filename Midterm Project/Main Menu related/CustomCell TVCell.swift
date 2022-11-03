//
//  CustomCell TVCell.swift
//  Midterm Project
//
//  Created by Justyce Graham on 11/1/22.
// This is the guideline for a cell on the main menu page

import UIKit

class CustomCell_TVCell: UITableViewCell {
    
    
   
    
    @IBOutlet weak var CandyCell: UIView!
    @IBOutlet weak var CandyName: UILabel!
    @IBOutlet weak var CandyImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
