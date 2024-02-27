//
//  ViewController.swift
//  Transcriber
//
//  Created by Akshit Saxena on 2/23/24.
//

import UIKit
import AVFoundation
import Speech

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var button: UIButton!
    @IBAction func buttonClicked(_ sender: Any) {
        requestRecordPermissions()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //bubbles through to transcribe eprmissions
    func requestRecordPermissions(){
        AVAudioApplication.requestRecordPermission { [unowned self] allowed in
            DispatchQueue.main.async{
                if allowed{
                    self.requestTranscribePermissions()
                }else{
                    self.showError()
                }
            }
        }
    }
    
    func requestTranscribePermissions(){
        SFSpeechRecognizer.requestAuthorization { [unowned self] authStatus in
            DispatchQueue.main.async{
                if authStatus == .authorized{
                    //great to go
                    self.dismiss(animated: true, completion: nil)
                    
                }else{
                    //error handling
                    self.showError()
                }
            }
        }
    }
    
    func showError(){
        
        self.label.text = "You have previously denied this app access to speech recognition. Please change the settings and restart the app!!!"
        self.disableButton()
        
    }
    
    func disableButton(){
        self.button.isEnabled = false
        UIView.animate(withDuration: 1.0){
            self.button.alpha = 0.3
        }
    }


}

