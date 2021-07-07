//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
let eggTimes = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
var player: AVAudioPlayer!
var cookingTime = 0
var timer = Timer()

func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
            
}


class ViewController: UIViewController {
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var cookingTimeView: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        var seconds = 0
        timer.invalidate()
        progressView.progress = 0.0
        
        let hardness = sender.currentTitle!
        
        if hardness == "Soft"{
            cookingTime = eggTimes["Soft"]! * 60
            
        }
        else if hardness == "Medium"{
            cookingTime = eggTimes["Medium"]! * 60
            
        }
        else{
            cookingTime = eggTimes["Hard"]! * 60
        }
        
        let totalTime = cookingTime
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
                seconds += 1
                
                progressView.progress = Float(seconds) / Float(cookingTime)
            
            if(totalTime == seconds){
              timer.invalidate()
              playSound()
                self.cookingTimeView.text = "Done!"
            }
                         }
                
    }
                    

    }
    

