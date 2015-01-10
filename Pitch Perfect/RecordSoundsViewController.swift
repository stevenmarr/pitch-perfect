//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Steven Marr on 12/6/14.
//  Copyright (c) 2014 Steven Marr. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRecorder:AVAudioRecorder!
    var newRecord: RecordedAudio!
    
    @IBOutlet weak var recLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true
        recButton.enabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecord"){
            let PlaySoundVC:PlaySoundsViewController = segue.destinationViewController as PlaySoundsViewController
            let data = sender as RecordedAudio
            PlaySoundVC.recievedAudio = data
        }
        
    }
    @IBAction func recordButton(sender: UIButton) {
        // Add "Recording..." text
        recLabel.hidden = false
        stopButton.hidden = false
        recButton.enabled = false
        //TODO: Create New Recording
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.meteringEnabled = true
        audioRecorder.delegate = self
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if (flag){
        //TODO: Save audio
        newRecord = RecordedAudio()
        newRecord.filePathURL = recorder.url
        newRecord.title = recorder.url.lastPathComponent
        //TODO: Make seque to next scene
        self.performSegueWithIdentifier("stopRecord", sender: newRecord)
        }
        
    }
    @IBAction func stopRec(sender: UIButton) {
        recLabel.hidden = true
        stopButton.hidden = true
        //TODO: Stop Recording
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }
    
}
