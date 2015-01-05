//
//  ViewController.swift
//  99RedBallons
//
//  Created by Robb C. Bennett on 1/5/15.
//  Copyright (c) 2015 Visual23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballonImageView: UIImageView!
    @IBOutlet weak var ballonTitleLabel: UILabel!
    
    var ballonsArray:[Ballon] = []
    var imagesArray = ["RedBallon1.jpg", "RedBallon2.jpg", "RedBallon3.jpg", "RedBallon4.jpg"]
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // show default image and text
        self.ballonImageView.image = UIImage(named: "BerlinTVTower.jpg")
        self.ballonTitleLabel.text = "Click Next to get a new ballon"
        
        // build ballons
        buildBallons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildBallons () {
        
        for var i = 0; i < 99; i++ {
            var randomImage = Int(arc4random_uniform(UInt32(4)))
            var myBallon = Ballon()
            myBallon.ballonNumber = i+1
            myBallon.ballonImage = UIImage(named: imagesArray[randomImage])
            self.ballonsArray.append(myBallon)
        }
        println(ballonsArray[2].ballonNumber)
        
    }

    @IBAction func nextBallonButtonPressed(sender: UIBarButtonItem) {
      
        let ballon = self.ballonsArray[currentIndex]
        
        println(ballon.ballonImage)
        
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            self.ballonImageView.image = ballon.ballonImage
            self.ballonTitleLabel.text = "Ballon \(ballon.ballonNumber)"
            }, completion: {
                (finished: Bool) -> () in
        })
        
        currentIndex++
    }
}

