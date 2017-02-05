//
//  AnimationViewController.swift
//  SudarshanKriya
//
//  Created by Aditya Garg on 2/5/17.
//  Copyright © 2017 Archetapp. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var images = [UIImage]()
        
        for i in 0 ... 413 {
            var number = ""
            if(i<10){
                 number = "00" + String(i)
            }
            else if(i<100){
                 number = "0" + String(i)
            }
            else{
                number = String(i)
            }
            
            let string = "35secondemo/35secondemo." + number + ".png"
            print(string)
            images.append(UIImage(named: string)!)
        }
        imageView.animationImages = images
        //imageView.animationRepeatCount = 1
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
