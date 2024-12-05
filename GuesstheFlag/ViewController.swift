//
//  ViewController.swift
//  GuesstheFlag
//
//  Created by özge kurnaz on 1.12.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia", "spain","uk","us"]
  
        askQuestion(action:nil)
    }
    
// write a method that shows three random flag imagex on the screen. Buttons have setImage() method that lets us control what picture is shown inside and when sho we can use that with UIImage to display our flag
    func askQuestion(action: UIAlertAction!){
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        
        title = "\(countries[correctAnswer].uppercased()) Score: \(score)"
        questionCount += 1
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        }
        else{
           title = "Wrong"
            score -= 1
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion ))
        
        // animated presentation
        present(ac,animated: true)
        
        if questionCount == 10{
            ac.addAction(UIAlertAction(title: "Finish", style: .cancel, handler: nil))
            score = 0
        }
        
        
    }
    

}

