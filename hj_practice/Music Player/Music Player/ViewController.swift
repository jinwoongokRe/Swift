//
//  ViewController.swift
//  Music Player
//
//  Created by 이현지 on 2022/05/03.
//

import UIKit
import AVFoundation // framework

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    // MARK: - Properties
    var player: AVAudioPlayer!
    var timer: Timer!
    
    // MARK: IBOutlets
    // @modifier var property
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timelabel: UILabel!
    @IBOutlet var progressSlider: UISlider!
    
    //MARK: - Methods
    //MARK: Custom Method
    func initializePlayer(){
        
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
            print("Can't bring the sound file asset.")
            return
        }
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        }
        catch let error as NSError {
            print("player initialization fail")
            print("code: \(error.code), msg: \(error.localizedDescription)")
        }
        
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
        
    }
    
    func updateTimeLabelText(time:TimeInterval){
        let minute: Int = Int(time/60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond: Int = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        let timeText: String = String(format: "%021d:%021d:%021d", minute, second, milisecond)
        
        self.timelabel.text = timeText
    }
    
    func makeAndFireTimer(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [unowned self] (timer:Timer) in
            
            if self.progressSlider.isTracking {return}
            self.updateTimeLabelText(time: self.player.currentTime)
            self.progressSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    
    func invalidateTimer(){
        self.timer.invalidate()
        self.timer = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // dispose of any resources that can be recreated.
    }
    
    //method
    @IBAction func touchUpPlayPauseButtion(_sender: UIButton) {
        print("button tapped")
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print("slider value changed")
    }
    
}

