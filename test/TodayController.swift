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
    var  currentCalendar: Calendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentCalendar = Calendar.init(identifier: .gregorian)
        self.view.backgroundColor = UIColor(red:239.0/255, green:239.0/255, blue:239.0/255, alpha:1.0)
        self.navigationItem.title = CVDate (date: Date(), calendar: currentCalendar).globalDescription
        self.menuView = CVCalendarMenuView(frame: CGRect(x: 20, y: 0, width:380, height: 48))
        self.calendarView = CVCalendarView(frame: CGRect(x: 20, y: 45, width: 380, height: 60))
        self.calendarView.calendarAppearanceDelegate = self
        self.calendarView.calendarDelegate = self
        self.calendarView.animatorDelegate = self
        
        self.menuView.menuViewDelegate = self
        
        self.view.addSubview(menuView)
        self.view.addSubview(calendarView)
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
