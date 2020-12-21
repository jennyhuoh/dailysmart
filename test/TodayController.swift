//
//  TodayController.swift
//  test
//
//  Created by Jenny huoh on 2020/10/9.
//  Copyright © 2020 graduateproj. All rights reserved.
//

import UIKit
import CVCalendar

class TodayController: UIViewController {
    var menuView : CVCalendarMenuView!
    var calendarView : CVCalendarView!
    var currentCalendar: Calendar!
    var dayTextView: UITextView!
    var timeLine: UIView!
 
    var datesDictionary:[String:String] = ["5 December, 2020":"Service","9 December, 2020":"Change Oil","20 December, 2020":"Check brakes"]
    func dotMarker(shouldShowOnDayView dayView: DayView) -> Bool
    {
        // Look up date in dictionary
        if(datesDictionary[dayView.date.commonDescription] != nil)
        {
            return true // date is in the array so draw a dot
        }
        return false
    }
    func dotMarker(colorOnDayView dayView: DayView) -> [UIColor]
    {
        return [UIColor.black]
    }

    func didSelectDayView(_ dayView: DayView, animationDidFinish: Bool)
    {
        dayTextView.text = ""
        // Look up date in dictionary
        if(datesDictionary[dayView.date.commonDescription] != nil)
        {
            dayTextView.text = datesDictionary[dayView.date.commonDescription] // day is in the dictionary - wrote the corresponding text to dayTextView
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentCalendar = Calendar.init(identifier: .gregorian)
        self.view.backgroundColor = UIColor(red:239.0/255, green:239.0/255, blue:239.0/255, alpha:1.0)
        self.navigationItem.title = CVDate (date: Date(), calendar: currentCalendar).globalDescription
        
        
        
        self.timeLine = UIView(frame: CGRect(x: 0, y: 340, width: 415, height: 400))
        self.timeLine.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        
        // 建立前往 Detail 頁面的 UIButton
        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        let addTargetButton = UIButton()
        myButton.setTitle("+ 新增事件", for: .normal)
        myButton.setTitleColor(UIColor .black, for: UIControl.State.normal)
        myButton.addTarget(nil, action: #selector(TodayController.goDetail), for: .touchUpInside)
        myButton.center = CGPoint(x: 355, y: 365)
              
        self.dayTextView = UITextView(frame: CGRect(x: 75, y: 390, width: 340, height: 350))
        self.dayTextView.backgroundColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1.0)
        
        self.menuView = CVCalendarMenuView(frame: CGRect(x: 20, y: 0, width:375, height: 48))
        self.calendarView = CVCalendarView(frame: CGRect(x: 20, y: 45, width: 375, height: 60))
        self.calendarView.calendarAppearanceDelegate = self
        self.calendarView.calendarDelegate = self
        self.calendarView.animatorDelegate = self
        
        self.menuView.menuViewDelegate = self
        self.view.addSubview(timeLine)
        self.view.addSubview(dayTextView)
        self.view.addSubview(myButton)
        self.view.addSubview(menuView)
        self.view.addSubview(calendarView)
    }
    
    @objc func goDetail()
    {
        self.present(AddEventController(), animated: true, completion: nil)
    }
 
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.menuView.commitMenuViewUpdate()
        self.calendarView.commitCalendarViewUpdate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension TodayController: CVCalendarViewDelegate, CVCalendarMenuViewDelegate
{
    func presentationMode() -> CalendarMode
    {
        return .weekView
    }
    func firstWeekday() -> Weekday
    {
        return .sunday
    }
    func presentedDateUpdated(_ date: CVDate)
    {
        //导航栏显示当前日历的年月
        self.title = date.globalDescription
    }
    func topMarker(shouldDisplayOnDayView dayView: CVCalendarDayView) -> Bool
    {
        return  true
    }
    func dayOfWeekTextColor(by weekday: Weekday) -> UIColor
    {
        return weekday == .sunday ? UIColor.red: UIColor.black
    }
    func shouldShowWeekdaysOut() -> Bool
    {
        return true
    }
    func shouldSelectDayView(_ dayView: DayView) -> Bool
    {
        return true
    }
    func preliminaryView(viewOnDayView dayView: DayView) -> UIView
    {
        let circleView = CVAuxiliaryView(dayView: dayView, rect: dayView.frame, shape: CVShape.circle)
        return circleView
    }
    func preliminaryView(shouldDisplayOnDayView dayView: DayView) -> Bool
    {
        return false
    }
    func dayOfWeekTextColor() -> UIColor
    {
        return UIColor.black
}
}
