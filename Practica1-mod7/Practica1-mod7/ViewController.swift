//
//  ViewController.swift
//  Practica1-mod7
//
//  Created by Viviana Marcela Cruz Vega on 18/05/22.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    var segmentedControl = UISegmentedControl()
    private var animationView: AnimationView?
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //agregando un objeto segmentedControl
        
        
        segmentedControl = UISegmentedControl(items: ["Anim1","Anim2","Anim3"])
        segmentedControl.insertSegment(withTitle: "Anim4", at: 3, animated: true)
        segmentedControl.frame = CGRect(x: 10, y: 40, width: self.view.bounds.width-20, height: 30)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged), for: .valueChanged)
       // segmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
        self.view.addSubview(segmentedControl)
        
        
        
        

       /* let fish = LoaderView()
        fish.frame.size = CGSize(width: 400, height: 400)
        fish.center = self.view.center
        view.addSubview(fish)
        */
        
        
        //view.backgroundColor = .cyan
        
        /*
        if let unView = self.view.viewWithTag(666){
            unView.removeFromSuperview()
        }
       let otroAnim = LoaderView()
        otroAnim.tag = 777
        self.view.addSubview(otroAnim)*/
        
        
    
       
        
        
    }
    @objc private func segmentedValueChanged(segmentedControl: UISegmentedControl){
       
       /*switch (segmentedControl.selectedSegmentIndex){
       case 00: print("Selected segmented Index is : \(segmentedControl.selectedSegmentIndex)")
           break
       default:
           break
       }*/
       if segmentedControl.selectedSegmentIndex == 0{
           print("segmented 0 is selected")
           var json = "99362-animation-no-face"
           commonInit(jsonName: json)
       /*  let anim =  animationView = .init(name: "103781-wolverine")
           animationView!.frame = view.bounds
             
             // 3. Set animation content mode
             
             animationView!.contentMode = .scaleAspectFit
             
             // 4. Set animation loop mode
             
        //     animationView!.loopMode = .loop
             
             // 5. Adjust animation speed
             
             animationView!.animationSpeed = 0.5
             
             view.addSubview(animationView!)
             
             // 6. Play animation
             
             animationView!.play()
           
          // fish.frame.size = CGSize(width: 400, height: 400)
         //  fish.center = self.view.center
          // view.addSubview(fish)
           */
    
           
           
      
       }else if segmentedControl.selectedSegmentIndex == 1{
          
           print("segmented 1 is selected")
           
         var json = "103781-wolverine"
         commonInit(jsonName: json)
           let  otroAnim = self.view.viewWithTag(666)
           
          
       }else if segmentedControl.selectedSegmentIndex == 2{
          
           print("segmented 2 is selected")
           var json = "101299-sad-emotion"
           commonInit(jsonName: json)
           
       }else if segmentedControl.selectedSegmentIndex == 3{
           print("segmented 3 is selected")
           var json = "103573-error"
           commonInit(jsonName: json)
       }else{
           print("other")
       }
       
        
        
   }
    
    func commonInit(jsonName: String){
        if let unView = self.view.viewWithTag(666){
            unView.removeFromSuperview()}
        
        var animationView = AnimationView(name: jsonName)
      /*  if(segmentedControl.selectedSegmentIndex == 0){
            print("\(segmentedControl.selectedSegmentIndex)")
           // animationView = AnimationView(name: "103781-wolverine")
            
        }*/
        
       
        animationView.frame = CGRect(x:0, y:0, width: 400, height: 400)
        animationView.center = self.view.center
        animationView.animationSpeed = 0.2
        animationView.contentMode = .scaleAspectFill
        view.addSubview(animationView)
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        
    
    }



}

