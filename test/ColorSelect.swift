//
//  ColorSelect.swift
//  test
//
//  Created by Jenny huoh on 2020/12/19.
//  Copyright © 2020 graduateproj. All rights reserved.
//
import UIKit

class ColorSelectController: UIViewController
{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backView = UIView(frame: CGRect(x: 0, y: 540, width: 415, height: 305))
        backView.backgroundColor = UIColor.white
        backView.layer.cornerRadius = 5.0
        self.view.addSubview(backView)
        
        let topTitle = UILabel(frame: CGRect(x: 188, y: 550, width: 50, height: 40))
        topTitle.text = "分類"
        topTitle.textColor = smartDarkBlue
        topTitle.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(topTitle)
        
        let backBtn = UIButton(frame: CGRect(x: 20, y: 549, width: 50, height: 40))
        backBtn.setTitle("取消", for: .normal)
        backBtn.setTitleColor(smartDarkGold, for: UIControl.State.normal)
        backBtn.addTarget(nil, action: #selector(AddEventController.goBack), for: .touchUpInside)
        self.view.addSubview(backBtn)
        
        let color2 = UIButton(frame: CGRect(x: 0, y: 597, width: 415, height: 52))
        color2.addTarget(nil, action: #selector(AddEventController.goBack), for: .touchUpInside)
        color2.addTarget(nil, action: #selector(AddEventController.changeOne), for: .touchUpInside)
        color2.setTitle("工作", for: .normal)
        color2.backgroundColor = UIColor.white
        color2.setTitleColor(.black, for: .normal)
        color2.layer.borderWidth = 0.8
        color2.layer.borderColor = CGColor.init(srgbRed: 157/225, green: 187/225, blue: 209/225, alpha: 1.0)
        let color2Image = UIImageView(frame: CGRect(x: 150, y: 611, width: 25, height: 25))
        color2Image.image = UIImage(named: "blue_BCircle@3x.png")
         self.view.addSubview(color2)
        self.view.addSubview(color2Image)
        
        let color1 = UIButton(frame: CGRect(x: 0, y: 649, width: 415, height: 52))
        color1.addTarget(nil, action: #selector(AddEventController.goBack), for: .touchUpInside)
        color1.addTarget(nil, action: #selector(AddEventController.changeTwo), for: .touchUpInside)
        color1.setTitle("學習", for: .normal)
        color1.backgroundColor = UIColor.white
        color1.setTitleColor(.black, for: .normal)
        let color1Image = UIImageView(frame: CGRect(x: 150, y: 663, width: 25, height: 25))
        color1Image.image = UIImage(named: "green_BCircle@3x.png")
        self.view.addSubview(color1)
        self.view.addSubview(color1Image)
        
        let color3 = UIButton(frame: CGRect(x: 0, y: 701, width: 415, height: 52))
        color3.addTarget(nil, action: #selector(AddEventController.goBack), for: .touchUpInside)
        color3.addTarget(nil, action: #selector(AddEventController.changeThree), for: .touchUpInside)
        color3.setTitle("重要", for: .normal)
        color3.backgroundColor = UIColor.white
        color3.setTitleColor(.black, for: .normal)
        color3.layer.borderWidth = 0.8
        color3.layer.borderColor = CGColor.init(srgbRed: 157/225, green: 187/225, blue: 209/225, alpha: 1.0)
        let color3Image = UIImageView(frame: CGRect(x: 150, y: 715, width: 25, height: 25))
        color3Image.image = UIImage(named: "pink_BCircle@3x.png")
        self.view.addSubview(color3)
        self.view.addSubview(color3Image)
        
        let color4 = UIButton(frame: CGRect(x: 0, y: 753, width: 415, height: 52))
        color4.addTarget(nil, action: #selector(AddEventController.goBack), for: .touchUpInside)
        color4.addTarget(nil, action: #selector(AddEventController.changeFour), for: .touchUpInside)
        color4.setTitle("運動", for: .normal)
        color4.backgroundColor = UIColor.white
        color4.setTitleColor(.black, for: .normal)
        let color4Image = UIImageView(frame: CGRect(x: 150, y: 767, width: 25, height: 25))
        color4Image.image = UIImage(named: "yellow_BCircle@3x.png")
        self.view.addSubview(color4)
        self.view.addSubview(color4Image)
     
    }
    
    @objc func goBack()
       {
           self.dismiss(animated: true, completion:nil)
       }

    @objc func goDetail()
    {
        self.present(AddEventController(), animated: true, completion: nil)
    }
}


