//
//  GameCardViewController.swift
//  SageTap
//  Copyright © 2018 Sage Tap LLC. All rights reserved.
//

import UIKit
import MediaPlayer
import Firebase

class GameCardViewController: UIViewController {

    
    //MPMoviePlayerViewController * _player;
    

    //Outlets
    @IBOutlet weak var timerOutlet: UILabel!
    @IBOutlet weak var questionOutlet: UILabel!
    @IBOutlet weak var option1Outlet: UIButton!
    @IBOutlet weak var option2Outlet: UIButton!
    @IBOutlet weak var option3Outlet: UIButton!
    @IBOutlet weak var option4Outlet: UIButton!
    
    
    //Class vars
    var options = [UIButton]()
    var activeCardIndex = ""
    var activeCard:GameCard = GameCard()
    var game_on = false
    
    //firebase ref
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Initialize variables
        self.options.append(UIButton())
        self.options.append(option1Outlet)
        self.options.append(option2Outlet)
        self.options.append(option3Outlet)
        self.options.append(option4Outlet)
        self.ref = Database.database().reference()
        
        self.getQuestion()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getQuestion()
    {
    
        self.ref.child("activeCard").observe(DataEventType.value, with: { (snapshot) in
            
            //print snapshot.toString()
            self.activeCardIndex = snapshot.value as! String
            
            self.ref.child("cards").child(self.activeCardIndex).observeSingleEvent(of: .value, with: { (card_snap) in
                let dataChange = card_snap.value as? [String:AnyObject]
                self.activeCard = GameCard()
                self.activeCard.initWithDict(aDict: dataChange!)
                self.startGame()
                
            })
            
        })
    }
    
    func startGame() {
        self.questionOutlet.text = self.activeCard.question
        
        for index in 1...4 {
            self.options[index].setTitle(self.activeCard.options[index] as? String, for: .normal)
        }
        
        
    
    }

    
}
