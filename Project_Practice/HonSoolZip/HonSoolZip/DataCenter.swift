//
//  DataCenter.swift
//  HonSoolZip
//
//  Created by joe on 2017. 7. 17..
//  Copyright © 2017년 joe. All rights reserved.
//

import Foundation


class DataCenter {
    
    static let standard:DataCenter = DataCenter.init()
    private var rawArray:[RecipeItem]!
    
    var recipeList:[RecipeItem] {
        get {
            return rawArray
        }
    }
    
    private init(){
        loadFromBundle()
    }
    
    //번들만 불러와서 뿌리면 될듯
    private func loadFromBundle(){
        let bundlePath = Bundle.main.path(forResource: "HSRecipeList", ofType: "plist")
        if let nsArray = NSArray(contentsOfFile: bundlePath!) as? [[String : Any]] {
            self.rawArray = nsArray.map { (item:[String:Any]) -> RecipeItem in
                return RecipeItem.init(item)
            }
        }
    }
    
    func selectAlchol(_ rawValue:String) -> String{
        switch rawValue {
        case "0":
            return "beer"
        case "1":
            return "soju"
        case "2":
            return "wine"
        default :
            return "beer"
        }
    }
    
}

struct RecipeItem {
    
    let recipeID:Int
    let name:String
    let time:Int
    let cost:Int
    let drink:Drink
    let ingrediants:String
    let detail:String
    let shortDescription:String
    
    
    init (_ dictionary:[String:Any]) {
        self.recipeID = dictionary["recipeID"] as! Int
        self.name = dictionary["name"] as! String
        self.time = dictionary["time"] as! Int
        self.cost = dictionary["cost"] as! Int
        self.drink = Drink.init(rawValue: dictionary["drink"] as! String)!
        self.ingrediants = dictionary["ingrediants"] as! String
        self.detail = dictionary["detail"] as! String
        self.shortDescription = dictionary["shortDescription"] as! String
    }
}
enum Drink:String {
    
    case beer = "0"
    case soju = "1"
    case wine = "2"
    
}
