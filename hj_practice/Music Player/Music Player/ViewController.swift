//
//  ViewController.swift
//  Music Player
//
//  Created by 이현지 on 2022/05/03.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    // @modifier var property
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timelabel: UILabel!
    @IBOutlet var progressSlider: UISlider!
    
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

