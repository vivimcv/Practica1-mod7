//
//  PicViewController.swift
//  Gaga
//
//  Created by Viviana Marcela Cruz Vega on 20/05/22.
//

import UIKit

class PicViewController: UIViewController {
    
    var item: Item?
    var imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.frame = self.view.frame.insetBy(dx: 20, dy: 20)
        self.view.addSubview(imageView)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let Litem = self.item else {return}
        
        if let url = URL(string: DataManager.instance.baseURL + "/" + Litem.pict){
            do{
                let bytes = try Data(contentsOf: url)
                let images = UIImageView
                
                
            }catch{
                
            }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
