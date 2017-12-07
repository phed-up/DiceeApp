//
//  ViewController.swift
//  DiceeApp
//
//  Created by skwong on 10/9/17.
//  Copyright © 2017 skwong. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var randomDiceIndex1 : Int!
    var randomDiceIndex2 : Int!
    
    let diceArray: [UIImage] = [#imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")]
    
    func randomDice()
    {
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        diceLeft.image = diceArray[randomDiceIndex1]
        diceRight.image = diceArray[randomDiceIndex2]
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        randomDice()
        playSound(soundFileName: "rollDice")
        
    }

    
    @IBOutlet weak var diceLeft: UIImageView!
    
    @IBOutlet weak var diceRight: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        randomDice()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollBtnPressed(_ sender: Any)
    {
        randomDice()
        playSound(soundFileName: "rollDice")
    }
    
    func playSound(soundFileName: String)
    {
        if let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
            
        {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            // Play
            AudioServicesPlaySystemSound(mySound);
        }
    }
    
}

