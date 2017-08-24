//
//  FinishViewController.swift
//  SudarshanKriya
//
//  Created by Aditya Garg on 3/25/17.
//
//

import UIKit

class FinishViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var goButton: UIButton!
    
    let transition = CircularTransition()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goButton.layer.cornerRadius = goButton.frame.width/2
//        let lightBlue = UIColor(red: 19/255, green: 149/255, blue: 186/255, alpha: 1)
//        goButton.backgroundColor = lightBlue
    }
    
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        //get rid of the connection in storyboard
        //deleting this causes app to crash
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! MenuViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = goButton.center
        transition.circleColor = goButton.backgroundColor!
        return transition
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = goButton.center
        transition.circleColor = goButton.backgroundColor!
        return transition
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
