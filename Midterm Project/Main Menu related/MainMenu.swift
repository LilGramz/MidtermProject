//
//  MainMenu.swift
//  Midterm Project
//
//  Created by Justyce Graham on 11/1/22.
// This is for the first table displaying the four types of candy

import UIKit

class MainMenu: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var CandyPickerTable: UITableView!
    
    let candymodel = candyModel.shared
    
    var candychoices: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CandyPickerTable.delegate = self
        CandyPickerTable.dataSource = self

       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          let numberOfRows = candymodel.candyChoices.count
               return numberOfRows
           
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "typesOfCandy", for: indexPath) as! CustomCell_TVCell
               
           
           let FourOptions = candymodel.candyChoices[indexPath.row]
           
           cell.CandyName.text = FourOptions.Candy_Name
           let candypic = UIImage(named: FourOptions.candyID)
           cell.CandyImg?.image = candypic
           
           
              return cell
       }
}
