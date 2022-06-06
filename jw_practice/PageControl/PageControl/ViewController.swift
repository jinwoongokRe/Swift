//
//  ViewController.swift
//  PageControl
//
//  Created by 장진웅 on 2022/06/04.
//  Copyright © 2022 cbycongbab. All rights reserved.
//

import UIKit

var images = [ "01.png","02.png","03.png","04.png","05.png","06.png"]
class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count
        
        pageControl.currentPage = 0
        
        //페이지 표시 색상을 초록색으로 설정
        pageControl.pageIndicatorTintColor = UIColor.green
        //현재 페이지 표시 색상을 빨간색으로 설정
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imgView.image = UIImage(named: images[0])
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named : images[pageControl.currentPage])
        //currentPage : 페이지 컨트롤의 현재 페이지를 가지고온다.
        //named : 현재 페이지에 해당하는 이미지 파일의 이름을 images 배열에서 가지고 온다.
        //UIImage 타입의 이미지를 만들고
        //만든 이미지를 이미지 뷰에 할당한다.
    }
    
}

