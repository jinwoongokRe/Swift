//
//  EditViewController.swift
//  Navigation
//
//  Created by 장진웅 on 2022/06/05.
//  Copyright © 2022 cbycongbab. All rights reserved.
//

import UIKit
//프로토콜: 특정 객체가 갖추어야 할 기능이나 속성에 대한 설계도. 실질적 내용은 없으며 그냥 단순한 선언 형태를 가짐.
protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}



class EditViewController: UIViewController {
    
    var textWayValue: String = ""
    var textMessage: String = "" //수정화면에서 직접 텍스트 필드의 텍스트를 제어할수 없기 때문에 변수 textMessage를 문자열로 만든다.
    var delegate : EditDelegate?
    var isOn = false
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue //변수 textWayValue 값을 레이블의 텍스트로 대입
        txMessage.text = textMessage
        //viewDidLoad 함수에서 변수 textMessage 값을 텍스트 필드의 텍스트로 대입하여 텍스트 필드에 나타나게한다.
        swIsOn.isOn = isOn
        //viewDidLoad함수에서 변수 isOn값을 스위치의 On에 대입하여 스위치 값에 출력되게 한다.
        //현재 isOn이 false값을 가지므로 스위치는 꺼져 있는 모습을 보여준다.
    }
    

    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            //'수정화면'의 텍스트 필드의 내용, 즉 데이터를 '메인화면'으로 전달
        }
        _ = navigationController?.popViewController(animated: true)
        
    }
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
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

}
