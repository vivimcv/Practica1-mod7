//
//  DataManager.swift
//  Gaga
//
//  Created by Viviana Marcela Cruz Vega on 20/05/22.
//

import Foundation

struct Item{
    let pict: String
    let title: String
}

class DataManager: NSObject{
    static let instance = DataManager()
    
    override private init(){
        super.init()
    }
    let baseURL = "http://janzelaznog.com/DDAM/iOS/gaga"
   // var info = [[String : String]]()
    var info = [Item]()
    
    func getInfo(){
        if let url = URL(string: baseURL + "/info.json"){
            do{
                let bytes = try Data(contentsOf: url)
              //  let tmp = try JSONSerialization.jsonObject(with: bytes, options: .allowFragments)
              //  self.info = tmp as! [[String:String]]
                self.info = try JSONDecoder().decode([Item].self,from: bytes)
                print(self.info)
            }
            catch{
                print("ocurrio un error")
                
            }
        }
    }
}
