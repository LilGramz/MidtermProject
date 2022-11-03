//
//  CandyDetailViewController.swift
//  Midterm Project
//
//  Created by Justyce Graham on 11/2/22.
//

import UIKit

class CandyDetailViewController: UIViewController {
    
    @IBOutlet weak var CandyImg: UIImageView!
    
    @IBOutlet weak var CandyName: UILabel!
    
    let candymodel = candyModel.shared

    var detailCandyID: String?
    //
    var selectedCandy: Candy?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
         selectedCandy = candymodel.findCandy(withID: detailCandyID!)
        self.title = selectedCandy?.Candy_Name
        
        

        let candypic = UIImage(named: selectedCandy!.candyID)
           CandyImg.image = candypic
        
        
        
    }
}
