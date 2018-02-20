//
//  GameCardViewController.swift
//  SageTap
//  Copyright © 2018 Sage Tap LLC. All rights reserved.
//

import UIKit
import MediaPlayer
import Firebase
import WebKit

class GameCardViewController: UIViewController {

    
    @IBAction func `return`(_ sender: Any) {
        moveToLoggedInWindow()
    }
    

    //Outlets
    @IBOutlet weak var timerOutlet: UILabel!
    @IBOutlet weak var questionOutlet: UILabel!
    @IBOutlet weak var option1Outlet: UIButton!
    @IBOutlet weak var option2Outlet: UIButton!
    @IBOutlet weak var option3Outlet: UIButton!
    @IBOutlet weak var option4Outlet: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    //Class vars
    var options = [UIButton]()
    var activeCardIndex = ""
    var activeCard:GameCard = GameCard()
    var game_on = false
    
    
    var countdownTimer: Timer!
    var totalTime = 900
    
    
    
    
    //firebase ref
    var ref: DatabaseReference!
    
    //VIDEO ****
    
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://youtu.be/mYmD-EDJcXo")
        let request = URLRequest(url: url!)
        
        webview.load(request)
    
        //VIDEO ****

        
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
        
        //TIMER ***
        timerLabel.text = ""
        
    }
    
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        timerLabel.text = "\(timeFormatted(totalTime))"
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
        }
    }
    
    func endTimer() {
        countdownTimer.invalidate()
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    @IBAction func startTimerPressed(_ sender: UIButton) {
        timerLabel.text = "totalTime"
        startTimer()
    }
        //TIMER ***
    
}



