//
//  LoaderView.swift
//  Practica1-mod7
//
//  Created by Viviana Marcela Cruz Vega on 18/05/22.
//

import Foundation
import Lottie
import UIKit

public class LoaderView: UIView{
    
    
    var segmentedControl = UISegmentedControl()
   
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
   
    
    func commonInit(){
        //name:
        var animationView = AnimationView(name: "99362-animation-no-face")
      /*  if(segmentedControl.selectedSegmentIndex == 0){
            print("\(segmentedControl.selectedSegmentIndex)")
           // animationView = AnimationView(name: "103781-wolverine")
            
        }*/
        
       
        animationView.frame = CGRect(x:0, y:0, width: 400, height: 400)
        animationView.center = self.center
        animationView.animationSpeed = 0.2
        animationView.contentMode = .scaleAspectFill
        self.addSubview(animationView)
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
      
    
    }
    func start(viewName: AnimationView, jsonName: String){
        viewName.isHidden = false
                viewName.animation = Animation.named(jsonName)
                viewName.play { (_) in
                    viewName.isHidden = true
                }
    }
    
    
    
    
}
