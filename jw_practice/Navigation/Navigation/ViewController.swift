//
//  ViewController.swift
//  Navigation
//
//  Created by 장진웅 on 2022/06/05.
//  Copyright © 2022 cbycongbab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
   
    
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true

    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            //버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" {
            // 바 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn // prepare함수에서 editViewController, 즉 '수정화면'의 isOn에 '메인화면'의 상태를 전달한다.
        editViewController.delegate = self
    }
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message // '수정화면'의 데이터를 '메인화면'에 전달하여 보여줌.
    }
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
}

