//
//  CalenderController.swift
//  test
//
//  Created by Jenny huoh on 2020/10/9.
//  Copyright © 2020 graduateproj. All rights reserved.
//

import UIKit
import CalendarKit

class CalenderController:DayViewController {
    //新增事件的背景
  var whiteBg : UIView!
    //卡片的地方
    var cardArea : UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:252/255, green:252/255, blue:252/255, alpha:1.0)
        
        //目標卡片的地方
        self.cardArea = UIView(frame: CGRect(x:0,y:60,width: 415,height: 275))
        self.cardArea.backgroundColor = UIColor.white
        //加新增事件的背景
        self.whiteBg = UIView(frame: CGRect(x: 0, y: 313, width: 415, height: 42))
        self.whiteBg.backgroundColor = UIColor.white
        //新增事件的陰影
        self.whiteBg.layer.masksToBounds = false
        self.whiteBg.layer.shadowColor = UIColor.lightGray.cgColor
        self.whiteBg.layer.shadowOpacity = 0.3
        self.whiteBg.layer.shadowOffset = CGSize(width: 0, height: -2.0)
        self.whiteBg.layer.shadowRadius = 2
        self.whiteBg.layer.cornerRadius = 25
        self.whiteBg.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
        // 建立前往 Detail 頁面的 UIButton
        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        //let addTargetButton = UIButton()
        myButton.setTitle("+ 新增事件", for: .normal)
        myButton.setTitleColor(UIColor .black, for: UIControl.State.normal)
        myButton.addTarget(nil, action: #selector(TodayController.goDetail), for: .touchUpInside)
        myButton.center = CGPoint(x: 355, y: 340)
        
        self.view.addSubview(cardArea)
        self.view.addSubview(whiteBg)
        self.view.addSubview(myButton)
              
        //navigation
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        print(Date())
        //navigation的title
        let date: Date = Date()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年 M月"
        dateFormatter.locale = Locale(identifier: "zh_Hant_TW") // 設定地區
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Taipei") // 設定時區
        let dateFormatString: String = dateFormatter.string(from: date)
        self.navigationItem.title = "\(dateFormatString)"
        
        
        //nav陰影
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.3
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
        
        //CalendarKit 改Style
        var Style = CalendarStyle()
        Style.header.backgroundColor = UIColor.white
        Style.timeline.timeColor = UIColor.gray
        Style.timeline.dateStyle = .twentyFourHour
        Style.header.daySelector.selectedBackgroundColor = UIColor(red:239.0/255, green:208.0/255, blue:139.0/255, alpha:1.0)
        dayView.updateStyle(Style)
        
    }
    
    //add event
    @objc func goDetail()
    {
        self.present(AddEventController(), animated: true, completion: nil)
    }
    
    override func dayView(dayView: CalendarKit.DayView, didMoveTo date: Date) {
    print("DayView = \(dayView) did move to: \(date)")
        //MARK:改變title
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年 M月"
        dateFormatter.locale = Locale(identifier: "zh_Hant_TW") // 設定地區
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Taipei") // 設定時區
        let dateFormatString: String = dateFormatter.string(from: date)
        self.navigationItem.title = "\(dateFormatString)"
    }
    

}

