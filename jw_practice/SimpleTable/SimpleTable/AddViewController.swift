//
//  AddViewController.swift
//  SimpleTable
//
//  Created by 장진웅 on 2022/06/01.
//  Copyright © 2022 cbycongbab. All rights reserved.
//

import UIKit

class AddViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COLUMN = 1
    var imageArray = [UIImage?]()
    var imageFileName = ["cart.png", "clock.png", "pencil.png"]
    var fileName = ""

    @IBOutlet var pickerImage: UIPickerView!
    
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        fileName = imageFileName[0]
        lblImageFileName.text = imageFileName[0] //lblImageFileName 레이블에 ImageFileName배열의 첫번째 파일명을 출력
        imageView.image = imageArray[0] // 이미지 뷰에 첫 번째 이미지가 나타난다.

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!) //items에 텍스트 필드의 텍스트 값을 추가
        itemsImageFile.append(fileName) // itmesImageFile에는 무조건 clock.png파일을 추가
     // itemsImageFile.append("clock.png") // itmesImageFile에는 무조건 clock.png파일을 추가
        tfAddItem.text="" //텍스트 필드의 내용을 지운다.
        _ = navigationController?.popViewController(animated: true)//루트 뷰 컨트롤러, 즉 테이블 뷰로 돌아간다.
    }
    //
    //
    //
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row] //피커 뷰에게 컴포넌트의 각 열의 타이틀을 문자열 값으로 넘겨준다.
        //여기서는 imageFileName에 저장되어 있는 파일명을 넘겨준다.
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
        fileName = imageFileName[row]
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
