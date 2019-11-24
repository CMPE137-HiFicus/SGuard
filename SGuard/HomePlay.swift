//
//  HomePlay.swift
//  SGuard
//
//  Created by Sang To on 11/24/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit
import AVFoundation

class HomePlay: UIViewController {
    
    var audio1: AVAudioPlayer!
    var audio2: AVAudioPlayer!
    var count = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // sound  
        let sound1 = Bundle.main.path(forResource: "S1.mp3", ofType:nil)
        let sound2 = Bundle.main.path(forResource: "S2.mp3", ofType:nil)
        
        do {
            // initialize it
            audio1 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound1!))
            audio2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound2!))
        } catch {
            // It will print any
            print(error)
        }
        
    }
    
    @IBAction func play_sound1(_ sender: Any) {
        if (count%2==0) {
            audio1.play()
            count+=1
        } else {
            audio1.stop()
            count = 0
        }
    }
    
    @IBAction func play_sound2(_ sender: Any) {
        if (count%2==0) {
            audio2.play()
            count+=1
        } else {
            audio2.stop()
            count = 0
        }
    }
    
    @IBAction func play_sound3(_ sender: Any) {
        if (count%2==0) {
            audio1.play()
            audio2.play()
            count+=1
        } else {
            audio1.stop()
            audio2.stop()
            count = 0
        }
    }
    

}
