//
//  MainViewController.swift
//  test
//
//  Created by Yu hsuan Yang on 2021/2/11.
//  Copyright © 2021 graduateproj. All rights reserved.
//

import UIKit
@objcMembers class MainViewController: UITabBarController {

    var btn : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupbtn()
    }
    
    //設定按鈕
    func setupbtn() {
        
         //設定圖片
        let image = UIImage(named:"plus")
        btn.setImage(image,for: .normal)
        
         //按鈕位置
        btn.frame.size = CGSize(width: 60,height:60)
        btn.center = CGPoint(x: tabBar.center.x,y:tabBar.bounds.height/2-15)
        
        //樣式設定
//        let color = UIColor(red: 151/255, green: 216/255, blue: 246/255, alpha:1 )
//        btn.backgroundColor = color
//        btn.layer.masksToBounds = true
//        btn.layer.cornerRadius = 10
        
        //添加按鈕
        tabBar.addSubview(btn)
        btn.addTarget(self,action: #selector(btnClick), for: .touchUpInside)
    }
    
    func btnClick(){
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "plus")
        present(vc!,animated: true,completion:nil)
    }
}
