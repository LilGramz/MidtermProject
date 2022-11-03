//
//  candyModel.swift
//  Midterm Project
//
//  Created by Justyce Graham on 11/1/22.
// This is the guideline refferring tot hte first table on main menu

import Foundation

class candyModel {
    // Step 1 - declate a static variable to instantiate the Class
    
    static let shared = candyModel()
    
    var candyChoices:[Candy] = []
    
    // Step 2 - make the constructor private
    
    private init () {
        candyChoices.append(Candy(candyID: "1", Candy_Name: "Chocolate"))
        candyChoices.append(Candy(candyID: "2", Candy_Name: "Chocolate Covered"))
        candyChoices.append(Candy(candyID: "3", Candy_Name: "Merchandice"))
        candyChoices.append(Candy(candyID: "4", Candy_Name: "Taffy & Licorice"))
            
            
            }
    
    func findCandy (withID id: String) -> Candy? {
        var candy: Candy?
        if let index = candyChoices.firstIndex(where: {$0.candyID == id}) {
            candy = candyChoices [index]
        }
        
        return candy
    }
}

