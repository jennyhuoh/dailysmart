//
//  TodayController.swift
//  test
//
//  Created by Jenny huoh on 2020/10/9.
//  Copyright © 2020 graduateproj. All rights reserved.
//

import UIKit
import CalendarKit
import CVCalendar
import RealmSwift

class TodayController: DayViewController {
    //新增事件的背景
    var whiteBg : UIView!
    //卡片的地方
    var cardArea : UIView!
    
    var titleArea : UITableView!
    var cardScrollView: UIScrollView!
    var cardBackground: UIView!
    var cardTitle: UILabel!
    var cardTime: UILabel!
    var cardSetTime: UIButton!
    var cardRecord: UIButton!
    var cardProgressLabel: UILabel!
    var cardPercent: UILabel!
    var cardCheck: UIButton!
    var generatedEvents = [EventDescriptor]()
    var alreadyGeneratedSet = Set<Date>()
    

    override func loadView() {
        calendar.timeZone = TimeZone(identifier: "Asia/Taipei")!
        dayView = DayView(calendar: calendar)
          print(Date())
        view = dayView
          dayView.autoScrollToFirstEvent = false
    }
    @objc func pressed(){
        if cardCheck.isSelected == true {
            cardCheck.isSelected = false
        } else {
            cardCheck.isSelected = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //目標卡片的地方
        self.cardArea = UIView(frame: CGRect(x:0,y:60,width: 415,height: 275))
        self.cardArea.backgroundColor = UIColor(red:252/255, green:252/255, blue:252/255, alpha:1.0)
        
         cardScrollView = UIScrollView(frame: CGRect(x: 20, y: 70, width: 395, height: 210))
            //    cardScrollView.backgroundColor = .black
        //        cardScrollView.frame = CGRect(x: 20, y: 70, width: 395, height: 230)
                cardScrollView.contentSize = CGSize(width: 1200, height: 230)
                cardScrollView.showsHorizontalScrollIndicator = true
                cardScrollView.showsVerticalScrollIndicator = false
        //        cardScrollView.indicatorStyle = .default
        //        cardScrollView.isScrollEnabled = true
         //       cardScrollView.bounces = true
          //      cardScrollView.isPagingEnabled = true
                cardScrollView.isDirectionalLockEnabled = true
                
                cardBackground = UIView(frame: CGRect(x: 0, y: 0, width: 350, height: 210))
                cardBackground.backgroundColor = smartLightGold
                cardBackground.layer.cornerRadius = 20
                
                cardTitle = UILabel(frame: CGRect(x: 20, y: 10, width: 310, height: 40))
                cardTitle.textColor = smartDarkBlue
                cardTitle.text = "健身球"
                cardTitle.font = cardTitle.font.withSize(20)
                
                cardTime = UILabel(frame: CGRect(x: 20, y: 50, width: 310, height: 40))
                cardTime.textColor = smartDarkBlue
                cardTime.text = "下午 02:00-03:00"
                cardTime.font = cardTime.font.withSize(16)
               // cardTime.backgroundColor = .black
                
                cardSetTime = UIButton(frame: CGRect(x: 20, y: 100, width: 148, height: 44))
                cardSetTime.backgroundColor = .white
                cardSetTime.layer.cornerRadius = 6
                cardSetTime.setTitle("設定時間", for: .normal)
                cardSetTime.setTitleColor(smartDarkBlue, for: .normal)
               // cardSetTime.titleLabel?.font = UIFont.systemFont(ofSize: 16)
                cardSetTime.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                cardSetTime.layer.shadowColor = UIColor.gray.cgColor
                cardSetTime.layer.shadowRadius = 6
                cardSetTime.layer.shadowOpacity = 0.4
                cardSetTime.layer.shadowOffset = CGSize(width: 0, height: 2)
                
                cardRecord = UIButton(frame: CGRect(x: 182, y: 100, width: 148, height: 44))
                cardRecord.backgroundColor = .white
                cardRecord.layer.cornerRadius = 6
                cardRecord.setTitle("查看進度", for: .normal)
                cardRecord.setTitleColor(smartDarkBlue, for: .normal)
                cardRecord.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                cardRecord.layer.shadowColor = UIColor.gray.cgColor
                cardRecord.layer.shadowRadius = 6
                cardRecord.layer.shadowOpacity = 0.4
                cardRecord.layer.shadowOffset = CGSize(width: 0, height: 2)
                
                cardProgressLabel = UILabel(frame: CGRect(x: 20, y: 160, width: 200, height: 14))
                cardProgressLabel.text = "目前進度 (2/6)"
                cardProgressLabel.font = cardProgressLabel.font.withSize(12)
                cardProgressLabel.textColor = smartDarkBlue
                
                cardPercent = UILabel(frame: CGRect(x: 240, y: 160, width: 35, height: 14))
                cardPercent.text = "33%"
                cardPercent.font = cardPercent.font.withSize(12)
                cardPercent.textColor = smartDarkBlue
                
                cardCheck = UIButton(frame: CGRect(x: 280, y: 150, width: 55, height: 55))
               // cardCheck.backgroundColor = .black
                cardCheck.layer.cornerRadius = 21
                let cardGrayCheckimg = UIImage(named: "graycheck_btn@3x.png")
                let cardGreenCheckimg = UIImage(named: "greencheck_btn@3x.png")
                cardCheck.setBackgroundImage(cardGreenCheckimg, for: .selected)
                cardCheck.setBackgroundImage(cardGrayCheckimg, for: .normal)
                cardCheck.addTarget(self, action: #selector(TodayController.pressed), for: .touchUpInside)
                //cardCheck.isEnabled = true
        
        
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
        self.view.addSubview(cardScrollView)
        cardScrollView.addSubview(cardBackground)
        cardScrollView.addSubview(cardTitle)
        cardScrollView.addSubview(cardTime)
        cardScrollView.addSubview(cardSetTime)
        cardScrollView.addSubview(cardRecord)
        cardScrollView.addSubview(cardProgressLabel)
        cardScrollView.addSubview(cardPercent)
        cardScrollView.addSubview(cardCheck)
              
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
//        print(dateFormatString)
        self.navigationItem.title = "\(dateFormatString)"
        
        
        //nav陰影
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.3
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
        
        //CalendarKit 改Style
        var Style = CalendarStyle()
        Style.header.backgroundColor = UIColor(red:252/255, green:252/255, blue:252/255, alpha:1.0)
        Style.header.daySelector.activeTextColor = UIColor.white
        Style.header.daySelector.selectedBackgroundColor = smartDarkGold //黃色
        Style.header.daySelector.weekendTextColor = UIColor(red:25.0/255, green:52.0/255, blue:70.0/255, alpha:1.0)  //深藍
        Style.header.daySelector.inactiveTextColor = smartDarkBlue
        Style.header.daySelector.todayInactiveTextColor = smartDarkBlue
        Style.header.daySelector.todayActiveBackgroundColor = smartDarkGold
        Style.header.daySymbols.weekendColor = UIColor(red:25.0/255, green:52.0/255, blue:70.0/255, alpha:1.0)
        Style.header.daySymbols.weekDayColor = UIColor(red:25.0/255, green:52.0/255, blue:70.0/255, alpha:1.0)
        Style.timeline.timeIndicator.color = UIColor(red:239.0/255, green:208.0/255, blue:139.0/255, alpha:1.0)
        Style.timeline.timeColor = UIColor(red:25.0/255, green:52.0/255, blue:70.0/255, alpha:1.0)
        Style.timeline.separatorColor = smartDarkBlue
        Style.timeline.backgroundColor = UIColor.white
        Style.timeline.dateStyle = .twentyFourHour
        Style.timeline.timeIndicator.dateStyle = .twentyFourHour
        Style.timeline.verticalInset = 280
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
    
    
    
    //MARK:行程的資料的顯示
    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
        let realm = try! Realm()
        let models = realm.objects(eventDataList4.self)
        var events = [Event]()
        for model in models {
            let event = Event()
            event.startDate = model.Starttime
            event.endDate = model.Endtime
            event.text = "\(model.content) \n \(model.note ?? "")"
            event.color = smartLightGold
            if model.color == 1{
                event.backgroundColor = smartEventblue
            }
            else if model.color == 2{
                event.backgroundColor = smartEventGreen
            }
            else if model.color == 3{
                event.backgroundColor = smartEventRed
            }
            else{
                event.backgroundColor = smartEventYellow
            }
            event.textColor = smartDarkBlue
            events.append(event)
        }
        return events
    }
    

}

