//
//  CustomSideMenuNavigation.swift
//  web
//
//  Created by 장진웅 on 2022/06/07.
//

import Foundation
import SideMenu

class CustomSideMenuNavigation: SideMenuNavigationController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presentationStyle = .menuSlideIn
    }
}
