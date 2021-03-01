//
//  CalenderController.swift
//  test
//
//  Created by Jenny huoh on 2020/10/9.
//  Copyright © 2020 graduateproj. All rights reserved.
//

import UIKit
import CalendarKit
import CVCalendar

class TodayController: DayViewController {
  
  var data = [
              ["Software Development Lecture",
               "Mikpoli MB310",
               "Craig Federighi"],
              
  ]
  
  var generatedEvents = [EventDescriptor]()
  var alreadyGeneratedSet = Set<Date>()
  
  var colors = [UIColor.blue,
                UIColor.yellow,
                UIColor.green,
                UIColor.red]

    //新增事件的背景
  var whiteBg : UIView!
    
  private lazy var rangeFormatter: DateIntervalFormatter = {
    let fmt = DateIntervalFormatter()
    fmt.dateStyle = .none
    fmt.timeStyle = .short

    return fmt
  }()

  override func loadView() {
    calendar.timeZone = TimeZone(identifier: "Asia/Taipei")!
    calendar.locale = Locale(identifier: "zh_Hant_TW")
    dayView = DayView(calendar: calendar)
    view = dayView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor(red:252/255, green:252/255, blue:252/255, alpha:1.0)
    
    //加新增事件的背景
    self.whiteBg = UIView(frame: CGRect(x: 0, y: 313, width: 415, height: 42))
    self.whiteBg.backgroundColor = UIColor.white
    self.view.addSubview(whiteBg)
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
    dayView.autoScrollToFirstEvent = true
    
    
    reloadData()
  }
    
    
    
    //add event
    @objc func goDetail()
    {
        self.present(AddEventController(), animated: true, completion: nil)
    }
  
  // MARK: EventDataSource
  
 
  
  private func generateEventsForDate(_ date: Date) -> [EventDescriptor] {
    var workingDate = Calendar.current.date(byAdding: .hour, value: -1, to: date)! //Int.random(in: 1...15)
    var events = [Event]()
    
    for i in 0...4 {
      let event = Event()

      let duration = Int.random(in: 60 ... 160)
      event.startDate = workingDate
      event.endDate = Calendar.current.date(byAdding: .minute, value: duration, to: workingDate)!

      var info = data[Int(arc4random_uniform(UInt32(data.count)))]
      
      let timezone = dayView.calendar.timeZone
      print("timezone:\(timezone)")

      info.append(rangeFormatter.string(from: event.startDate, to: event.endDate))
      event.text = info.reduce("", {$0 + $1 + "\n"})
      event.color = colors[Int(arc4random_uniform(UInt32(colors.count)))]
      event.isAllDay = Int(arc4random_uniform(2)) % 2 == 0
      
      // Event styles are updated independently from CalendarStyle
      // hence the need to specify exact colors in case of Dark style
      if #available(iOS 12.0, *) {
        if traitCollection.userInterfaceStyle == .dark {
          event.textColor = textColorForEventInDarkTheme(baseColor: event.color)
          event.backgroundColor = event.color.withAlphaComponent(0.6)
        }
      }
      
      events.append(event)
      
      let nextOffset = Int.random(in: 40 ... 250)
      workingDate = Calendar.current.date(byAdding: .minute, value: nextOffset, to: workingDate)!
      event.userInfo = String(i)
    }

    print("Events for \(date)")
    return events
  }
  
  private func textColorForEventInDarkTheme(baseColor: UIColor) -> UIColor {
    var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
    baseColor.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
    return UIColor(hue: h, saturation: s * 0.3, brightness: b, alpha: a)
  }
  
  // MARK: DayViewDelegate
  
  private var createdEvent: EventDescriptor?
  
  override func dayViewDidSelectEventView(_ eventView: EventView) {
    guard let descriptor = eventView.descriptor as? Event else {
      return
    }
    print("Event has been selected: \(descriptor) \(String(describing: descriptor.userInfo))")
  }
  
  override func dayViewDidLongPressEventView(_ eventView: EventView) {
    guard let descriptor = eventView.descriptor as? Event else {
      return
    }
    endEventEditing()
    print("Event has been longPressed: \(descriptor) \(String(describing: descriptor.userInfo))")
    beginEditing(event: descriptor, animated: true)
    print(Date())
  }
  
    override func dayView(dayView: CalendarKit.DayView, didTapTimelineAt date: Date) {
    endEventEditing()
    print("Did Tap at date: \(date)")
  }
  
    override func dayViewDidBeginDragging(dayView: CalendarKit.DayView) {
    endEventEditing()
    print("DayView did begin dragging")
  }
  
    override func dayView(dayView: CalendarKit.DayView, willMoveTo date: Date) {
    print("DayView = \(dayView) will move to: \(date)")
        
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
  
    override func dayView(dayView: CalendarKit.DayView, didLongPressTimelineAt date: Date) {
    print("Did long press timeline at date \(date)")
    // Cancel editing current event and start creating a new one
    endEventEditing()
    let event = generateEventNearDate(date)
    print("Creating a new event")
    create(event: event, animated: true)
    createdEvent = event
  }
  
  private func generateEventNearDate(_ date: Date) -> EventDescriptor {
    let duration = Int(arc4random_uniform(160) + 60)
    let startDate = Calendar.current.date(byAdding: .minute, value: -Int(CGFloat(duration) / 2), to: date)!
    let event = Event()

    event.startDate = startDate
    event.endDate = Calendar.current.date(byAdding: .minute, value: duration, to: startDate)!
    
    var info = data[Int(arc4random_uniform(UInt32(data.count)))]

    info.append(rangeFormatter.string(from: event.startDate, to: event.endDate))
    event.text = info.reduce("", {$0 + $1 + "\n"})
    event.color = colors[Int(arc4random_uniform(UInt32(colors.count)))]
    event.editedEvent = event
    
    // Event styles are updated independently from CalendarStyle
    // hence the need to specify exact colors in case of Dark style
    if #available(iOS 12.0, *) {
      if traitCollection.userInterfaceStyle == .dark {
        event.textColor = textColorForEventInDarkTheme(baseColor: event.color)
        event.backgroundColor = event.color.withAlphaComponent(0.6)
      }
    }
    return event
  }
  
    override func dayView(dayView: CalendarKit.DayView, didUpdate event: EventDescriptor) {
    print("did finish editing \(event)")
    print("new startDate: \(event.startDate) new endDate: \(event.endDate)")
    
    if let _ = event.editedEvent {
      event.commitEditing()
    }
    
    if let createdEvent = createdEvent {
      createdEvent.editedEvent = nil
      generatedEvents.append(createdEvent)
      self.createdEvent = nil
      endEventEditing()
    }
    
    reloadData()
  }
}



