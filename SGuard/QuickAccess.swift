//
//  QuickAccess.swift
//  SGuard
//
//  Created by Sang To on 12/4/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit
import AVFoundation

class QuickAccess: UIViewController {

    var audio1: AVAudioPlayer!
    var audio2: AVAudioPlayer!
    var count = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UI_Util.setGradientGreenBlue(uiView: self.view)

        // sound
        let sound1 = Bundle.main.path(forResource: "S4.mp3", ofType:nil)
        
        do {
            // initialize it
            audio1 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound1!))
            audio1.numberOfLoops = 100

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
    
}
