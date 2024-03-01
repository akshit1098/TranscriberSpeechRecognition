//
//  RecordViewController.swift
//  Transcriber
//
//  Created by Akshit Saxena on 3/1/24.
//

import UIKit
import AVFoundation
import Speech

class RecordViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRec: AVAudioRecorder?
    var recFileUrl: URL!
    var textFileUrl: URL!
    
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let utils = Utilities()
        recFileUrl = utils.getAudioFileUrl()
        textFileUrl = utils.getTextUrl()
        print("grantk " + recFileUrl!.absoluteString)
        recordAudio()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        audioPlayer?.stop()
    }
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func stopButtonClicked(_ sender: UIButton) {
        stopRecording(sender: sender)
    }
    
    func stopRecording(sender: UIButton){
        audioRec?.stop()
        sender.titleLabel?.text = "Finished"
        sender.isEnabled = false
        sender.alpha = 0.2
        activityIndicator.stopAnimating()
        UIView.animate(withDuration: 1.2){
            self.activityIndicator.alpha = 0
        }
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Audio Delegate
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag{
            recordingEnded(success: false)
        }else{
            recordingEnded(success: true)
        }
    }
    
    func recordAudio(){
        let session = AVAudioSession.sharedInstance()
        do{
            try session.setCategory(AVAudioSession.Category.playAndRecord, options: .defaultToSpeaker)
            
            try session.setActive(true)
            
            let settings = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 4410,
                AVNumberOfChannelsKey: 2,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            
            audioRec = try AVAudioRecorder(url: recFileUrl, settings: settings)
            
            audioRec?.delegate = self
            audioRec?.record()
            activityIndicator.startAnimating()
            
        }catch let error{
            //failed to record
            print("grantk Failed Recording \(error)")
            recordingEnded(success: false)
        }
    }
    
    func recordingEnded(success: Bool){
        
        audioRec?.stop()
        if success{
            do{
                //trascribe Audio
                transcribeAudio()
                print("playing the audio....")
               
            }catch let error{
                print(error)
            }
        }
        
    }
    
    //MARK: Transcribe
    func transcribeAudio(){
        let recogniser = SFSpeechRecognizer()
        let request = SFSpeechURLRecognitionRequest(url: recFileUrl)
        
        recogniser?.recognitionTask(with: request, resultHandler: { [unowned self] (result, error) in
            guard let result = result else{
                print(error!)
                return
            }
            if result.isFinal{
                let text = result.bestTranscription.formattedString
                self.textView.text = text
                do{
                    try text.write(to: self.textFileUrl, atomically: true, encoding: String.Encoding.utf8)
                }catch{
                    
                }
            }
        })
    }

}
