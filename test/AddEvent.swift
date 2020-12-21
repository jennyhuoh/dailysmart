//
//  AddEvent.swift
//  test
//
//  Created by Jenny huoh on 2020/12/7.
//  Copyright © 2020 graduateproj. All rights reserved.
//
import UIKit

class AddEventController: UIViewController, UITextFieldDelegate
{
    var chooseColor: UIButton!
    var addContent: UIView!
    var colorSmallImage: UIImageView!
    var rNone: UIButton!
    var rDay: UIButton!
    var rWeek: UIButton!
    var rMonth: UIButton!
    var doneButton: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = smartLightBlue
        self.addContent = UIView(frame: CGRect(x: 0, y: 75, width: 415, height: 770))
        self.addContent.backgroundColor = smartLightBlue
        self.addContent.layer.borderWidth = 1
        self.addContent.layer.borderColor = CGColor.init(srgbRed: 163/225, green: 163/225, blue: 163/225, alpha: 1.0)
        
        
        let myEvent = UITextField(frame: CGRect(x: 0, y: 0, width: 380, height: 44))
        myEvent.center = CGPoint(x: 207, y: 115)
        // 尚未輸入時的預設顯示提示文字
        myEvent.placeholder = " 輸入事件"
        // 輸入框的樣式 這邊選擇圓角樣式
        myEvent.layer.cornerRadius = 5.0
        // 輸入框右邊顯示清除按鈕時機 這邊選擇當編輯時顯示
        myEvent.clearButtonMode = .whileEditing
        myEvent.keyboardType = .default
        // 鍵盤上的 return 鍵樣式 這邊選擇 Done
        myEvent.returnKeyType = .done
        // 輸入文字的顏色
        myEvent.textColor = UIColor.black
        // UITextField 的背景顏色
        myEvent.backgroundColor = UIColor.white
        myEvent.borderStyle = .none
        myEvent.delegate = self
        
        
        let myNote = UITextField(frame: CGRect(x: 0, y: 0, width: 380, height: 44))
        myNote.center = CGPoint(x: 207, y: 175)
        // 尚未輸入時的預設顯示提示文字
        myNote.placeholder = " 新增備註"
        // 輸入框的樣式 這邊選擇圓角樣式
        myNote.layer.cornerRadius = 5.0
        // 輸入框右邊顯示清除按鈕時機 這邊選擇當編輯時顯示
        myNote.clearButtonMode = .whileEditing
        myNote.keyboardType = .default
        // 鍵盤上的 return 鍵樣式 這邊選擇 Done
        myNote.returnKeyType = .done
        // 輸入文字的顏色
        myNote.textColor = UIColor.black
        // UITextField 的背景顏色
        myNote.backgroundColor = UIColor.white
        myNote.borderStyle = .none
        myNote.delegate = self
        
        let part = UILabel(frame: CGRect(x: 18, y: 220, width: 100, height: 40))
        part.text = "分類"
        part.textColor = smartDarkBlue
 
        chooseColor = UIButton(frame: CGRect(x: 85, y: 220, width: 100, height: 40))
        chooseColor.layer.cornerRadius = 5.0
        chooseColor.contentHorizontalAlignment = .right
        chooseColor.titleEdgeInsets = UIEdgeInsets(top:0, left:0, bottom:0, right:20)
        chooseColor.setTitle("重要", for: .normal)
        chooseColor.backgroundColor = UIColor.white
        chooseColor.setTitleColor(UIColor .black, for: UIControl.State.normal)
        chooseColor.addTarget(nil, action: #selector(ColorSelectController.goDetail), for: .touchUpInside)
        chooseColor.tintColor = smartDarkBlue
        
        colorSmallImage = UIImageView(frame: CGRect(x: 102, y: 232, width: 17, height: 17))
        colorSmallImage.image = UIImage(named: "pink_BCircle@3x.png")
        
        let selectRepeat = UILabel(frame: CGRect(x: 18, y: 290, width: 100, height: 40))
        selectRepeat.text = "重複"
        selectRepeat.textColor = smartDarkBlue
        
        rNone = UIButton(frame: CGRect(x: 85, y: 290, width: 60, height: 40))
        rNone.layer.cornerRadius = 5.0
        rNone.setTitle("無", for: .normal)
        rNone.backgroundColor = smartMiddleBlue
        rNone.setTitleColor(UIColor.white, for: UIControl.State.normal)
        rNone.addTarget(nil, action: #selector(changeNoneBackground), for: .touchUpInside)
        rDay = UIButton(frame: CGRect(x: 160, y: 290, width: 60, height: 40))
        rDay.layer.cornerRadius = 5.0
        rDay.setTitle("每日", for: .normal)
        rDay.backgroundColor = UIColor.white
        rDay.setTitleColor(smartDarkBlue, for: UIControl.State.normal)
        rDay.addTarget(nil, action: #selector(changeDayBackground), for: .touchUpInside)
        rWeek = UIButton(frame: CGRect(x: 235, y: 290, width: 60, height: 40))
        rWeek.layer.cornerRadius = 5.0
        rWeek.setTitle("每週", for: .normal)
        rWeek.backgroundColor = UIColor.white
        rWeek.setTitleColor(smartDarkBlue, for: UIControl.State.normal)
        rWeek.addTarget(nil, action: #selector(changeWeekBackground), for: .touchUpInside)
        rMonth = UIButton(frame: CGRect(x: 310, y: 290, width: 60, height: 40))
        rMonth.layer.cornerRadius = 5.0
        rMonth.setTitle("每月", for: .normal)
        rMonth.backgroundColor = UIColor.white
        rMonth.setTitleColor(smartDarkBlue, for: UIControl.State.normal)
        rMonth.addTarget(nil, action: #selector(changeMonthBackground), for: .touchUpInside)
        
        let date = UILabel(frame: CGRect(x: 18, y: 360, width: 100, height: 40))
        date.text = "日期"
        date.textColor = smartDarkBlue
        
        let start = UILabel(frame: CGRect(x: 20, y: 410, width: 100, height: 40))
        start.text = "開始"
        start.textColor = smartDarkBlue
        start.font = UIFont.systemFont(ofSize: 14)
        let end = UILabel(frame: CGRect(x: 20, y: 480, width: 100, height: 40))
        end.text = "結束"
        end.textColor = smartDarkBlue
        end.font = UIFont.systemFont(ofSize: 14)
        
        let dateStartBtn = UIButton(frame: CGRect(x: 83, y: 410, width: 170, height: 44))
        dateStartBtn.backgroundColor = UIColor.white
        dateStartBtn.setTitle("2020/12/22", for: UIControl.State.normal)
        dateStartBtn.setTitleColor(UIColor.lightGray, for: .normal)
        dateStartBtn.layer.cornerRadius = 5.0
        let dateEndBtn = UIButton(frame: CGRect(x: 83, y: 480, width: 170, height: 44))
        dateEndBtn.backgroundColor = UIColor.white
        dateEndBtn.setTitle("2020/12/23", for: UIControl.State.normal)
        dateEndBtn.setTitleColor(UIColor.lightGray, for: .normal)
        dateEndBtn.layer.cornerRadius = 5.0
        
        let timeStartBtn = UIButton(frame: CGRect(x: 270, y: 410, width: 125, height: 44))
        timeStartBtn.backgroundColor = UIColor.white
        timeStartBtn.setTitle("上午 9:00", for: UIControl.State.normal)
        timeStartBtn.setTitleColor(UIColor.lightGray, for: .normal)
        timeStartBtn.layer.cornerRadius = 5.0
        let timeEndBtn = UIButton(frame: CGRect(x: 270, y: 480, width: 125, height: 44))
        timeEndBtn.backgroundColor = UIColor.white
        timeEndBtn.setTitle("上午 9:00", for: UIControl.State.normal)
        timeEndBtn.setTitleColor(UIColor.lightGray, for: .normal)
        timeEndBtn.layer.cornerRadius = 5.0
        
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        myLabel.center = CGPoint(x: 207, y:40)
        myLabel.textAlignment = .center
        myLabel.text = "新增事件"
        myLabel.textColor = smartDarkBlue
        self.view.addSubview(myLabel)
        
        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        myButton.setTitle("取消", for: .normal)
        myButton.setTitleColor(smartDarkGold, for: UIControl.State.normal)
        myButton.addTarget(nil, action: #selector(AddEventController.goBack), for: .touchUpInside)
        myButton.center = CGPoint(x: 35, y: 40)
        myButton.tintColor = smartDarkGold
        
        doneButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        doneButton.setTitle("完成", for: .normal)
        doneButton.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        doneButton.addTarget(nil, action: #selector(AddEventController.goBack), for: .touchUpInside)
        doneButton.center = CGPoint(x: 380, y: 40)
        doneButton.tintColor = smartDarkGold
        
        self.view.addSubview(addContent)
        self.view.addSubview(timeEndBtn)
        self.view.addSubview(timeStartBtn)
        self.view.addSubview(dateEndBtn)
        self.view.addSubview(dateStartBtn)
        self.view.addSubview(end)
        self.view.addSubview(start)
        self.view.addSubview(date)
        self.view.addSubview(rMonth)
        self.view.addSubview(rWeek)
        self.view.addSubview(rDay)
        self.view.addSubview(rNone)
        self.view.addSubview(selectRepeat)
        self.view.addSubview(chooseColor)
        self.view.addSubview(colorSmallImage)
        self.view.addSubview(part)
        self.view.addSubview(myNote)
        self.view.addSubview(myEvent)
        self.view.addSubview(doneButton)
        self.view.addSubview(myButton)
    }
    @objc func changeNoneBackground()
    {
        rNone.backgroundColor = smartMiddleBlue
        rNone.setTitleColor(UIColor.white, for: UIControl.State.normal)
        rDay.backgroundColor = UIColor.white
        rDay.setTitleColor(smartDarkBlue, for: UIControl.State.normal)
        
        rWeek.backgroundColor = UIColor.white
        rWeek.setTitleColor(smartDarkBlue, for: UIControl.State.normal)
        
        rMonth.backgroundColor = UIColor.white
        rMonth.setTitleColor(smartDarkBlue, for: UIControl.State.normal)
    }
    @objc func changeDayBackground()
    {
        rNone.backgroundColor = UIColor.white
        rNone.setTitleColor(smartDarkBlue, for: UIControl.State.normal)
        rDay.backgroundColor = smartMiddleBlue
        rDay.setTitleColor(UIColor.white, for: UIControl.State.normal)
        
        rWeek.backgroundColor = UIColor.white
        rWeek.setTitleColor(smartDarkBlue, for: UIControl.State.normal)
        
        rMonth.backgroundColor = UIColor.white
        rMonth.setTitleColor(smartDarkBlue, for: UIControl.State.normal)
    }
    @objc func changeWeekBackground()
       {
           rNone.backgroundColor = UIColor.white
           rNone.setTitleColor(smartDarkBlue, for: UIControl.State.normal)
           rDay.backgroundColor = UIColor.white
           rDay.setTitleColor(smartDarkBlue, for: UIControl.State.normal)
        rWeek.backgroundColor = smartMiddleBlue
        rWeek.setTitleColor(UIColor.white, for: UIControl.State.normal)
        
        rMonth.backgroundColor = UIColor.white
        rMonth.setTitleColor(smartDarkBlue, for: UIControl.State.normal)
       }
    @objc func changeMonthBackground()
       {
           rNone.backgroundColor = UIColor.white
           rNone.setTitleColor(smartDarkBlue, for: UIControl.State.normal)
           rDay.backgroundColor = UIColor.white
           rDay.setTitleColor(smartDarkBlue, for: UIControl.State.normal)
        rWeek.backgroundColor = UIColor.white
        rWeek.setTitleColor(smartDarkBlue, for: UIControl.State.normal)
        
        rMonth.backgroundColor = smartMiddleBlue
        rMonth.setTitleColor(UIColor.white, for: UIControl.State.normal)
       }
    
    @objc func changeOne()
    {
        chooseColor.setTitle("工作", for: .normal)
        colorSmallImage.image = UIImage(named: "blue_BCircle@3x.png")
        doneButton.setTitleColor(smartDarkGold, for: UIControl.State.normal)
    }
    @objc func changeTwo()
    {
        chooseColor.setTitle("綠", for: .normal)
        colorSmallImage.image = UIImage(named: "green_BCircle@3x.png")
        doneButton.setTitleColor(smartDarkGold, for: UIControl.State.normal)
    }
    @objc func changeThree()
    {
        chooseColor.setTitle("重要", for: .normal)
        doneButton.setTitleColor(smartDarkGold, for: UIControl.State.normal)
    }
    @objc func changeFour()
    {
        chooseColor.setTitle("黃", for: .normal)
        colorSmallImage.image = UIImage(named: "yellow_BCircle@3x.png")
        doneButton.setTitleColor(smartDarkGold, for: UIControl.State.normal)
    }
    
    
    private func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        // 結束編輯 把鍵盤隱藏起來
        self.view.endEditing(true)
        return true
    }
    @objc func goBack()
    {
        self.dismiss(animated: true, completion:nil)
    }
    
    @objc func goDetail()
    {
        self.present(ColorSelectController(), animated: true, completion: nil)
    }
}

