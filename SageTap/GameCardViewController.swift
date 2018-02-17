//
//  GameCardViewController.swift
//  SageTap
//  Copyright © 2018 Sage Tap LLC. All rights reserved.
//

import UIKit
import MediaPlayer


class GameCardViewController: UIViewController {

    
    //MPMoviePlayerViewController * _player;
    

    
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var question: UILabel!
    var options = [UIButton]()
    
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Initialize variables
        
        self.options.append(option1)
        self.options.append(option2)
        self.options.append(option3)
        self.options.append(option4)
        
        self.getQuestion();
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

    /*
    @IBAction func playBtnTapped(_ sender: Any) {
        //play button code
        NSURL = [NSURL (fileURLWithPath: ""<#T##String#>"")]
        _player =
    }*/
    
    func getQuestion()
    {
        print("in function")
    }
    
}
