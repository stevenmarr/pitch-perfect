//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Steven Marr on 12/7/14.
//  Copyright (c) 2014 Steven Marr. All rights reserved.
//

import UIKit
import AVFoundation


class PlaySoundsViewController: UIViewController {
    var audioPlayer:AVAudioPlayer!
    var recievedAudio:RecordedAudio!
    
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: recievedAudio.filePathURL, error: nil)
        
        
        audioPlayer = AVAudioPlayer(contentsOfURL: recievedAudio.filePathURL, error: nil)
        audioPlayer.enableRate = true        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func play_file(var rate: Float){
        audioPlayer.stop()
        audioPlayer.rate = rate
        audioPlayer.play()
    }
    
    @IBAction func slowPlayback(sender: UIButton) {
        play_file(0.5)
    }
    
    @IBAction func fastPlayback(sender: UIButton) {
        play_file(2.0)
    }
    
    @IBAction func playChipmunk(sender: UIButton) {
        playAudioWithVariablePitch(1000)
        
    }
    @IBAction func playVader(sender: AnyObject) {
        playAudioWithVariablePitch(-1500)
    
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
        
    }
    
    
    @IBAction func stopPlayback(sender: UIButton) {
        audioPlayer.stop()
        audioEngine.stop()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
