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
    var movieQuote:AVAudioPlayer!
    var recievedAudio:RecordedAudio!
    var chipmunkEngine:AVAudioEngine!
    var audioSourceNode:AVAudioPlayerNode!
    var pitchEffectNode:AVAudioUnitTimePitch!
    var audioFile:AVAudioFile!

    override func viewDidLoad() {
        super.viewDidLoad()
        chipmunkEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: recievedAudio.filePathURL, error: nil)
        
        audioSourceNode = AVAudioPlayerNode()
        pitchEffectNode = AVAudioUnitTimePitch()
        chipmunkEngine.attachNode(audioSourceNode)
        chipmunkEngine.attachNode(audioFile)
        
        
        
        
        movieQuote = AVAudioPlayer(contentsOfURL: recievedAudio.filePathURL, error: nil)
        movieQuote.enableRate = true        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func play_file(var rate: Float){
        movieQuote.stop()
        movieQuote.rate = rate
        movieQuote.play()
    }
    
    @IBAction func slowPlayback(sender: UIButton) {
        play_file(0.5)
    }
    
    @IBAction func fastPlayback(sender: UIButton) {
        play_file(2.0)
    }
    
    @IBAction func playChipmunk(sender: UIButton) {
        
        
    }
    
    @IBAction func stopPlayback(sender: UIButton) {
        movieQuote.stop()
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
