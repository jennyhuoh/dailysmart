//
//  SelectDate.swift
//  test
//
//  Created by Jenny huoh on 2021/3/10.
//  Copyright © 2021 graduateproj. All rights reserved.
//
import UIKit
import JTAppleCalendar

class SelectDateController:UIViewController, JTACMonthViewDelegate, JTACMonthViewDataSource {
    let monthStackLabel1 = UILabel()
    let monthStackLabel2 = UILabel()
    let monthStackView = UIStackView(frame: CGRect(x: 140, y: 410, width: 135, height: 48))
        let formatter = DateFormatter()
    
      func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
          let cell = calendar.dequeueReusableCell(withReuseIdentifier: "calenderCellID", for: indexPath) as! DateCell
          cell.dateLabel.text = cellState.text
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        self.calendar(calendar, willDisplay: cell, forItemAt: date, cellState: cellState, indexPath: indexPath)
          return cell
      }
      
      func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
      
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
          formatter.dateFormat = "yyyy MM dd"
          
          let startDate = formatter.date(from: "2021 03 01")!
        let endDate = formatter.date(from: "2022 01 31")!
          let parameters = ConfigurationParameters(startDate: startDate,
                                                   endDate: endDate,
                                                   numberOfRows: 6, // Only 1, 2, 3, & 6 are allowed
                                                    calendar: Calendar.current ,
                                                    generateInDates: .forAllMonths,
                                                    generateOutDates: .tillEndOfRow,
                                                   firstDayOfWeek: .sunday,
                                                    hasStrictBoundaries: true)
          return parameters
      }
      
      func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
          let cell = cell as! DateCell
        let cellHidden = cellState.dateBelongsTo != .thisMonth
        cell.isHidden = cellHidden
          cell.dateLabel.text = cellState.text
        cell.dateLabel.textColor = smartDarkBlue
       
      }

    func handleCellSelected(view: JTACDayCell?, cellState: CellState){
         guard let validCell = view as? DateCell else { return }
        if cellState.isSelected{
            validCell.selectView.isHidden = false
        }else {
            validCell.selectView.isHidden = true
        }
    }
    func handleCellTextColor(view: JTACDayCell?, cellState: CellState){
        guard let validCell = view as? DateCell else { return }
        if cellState.isSelected{
            validCell.dateLabel.textColor = .white
        } else{
            if cellState.dateBelongsTo == .thisMonth{
                validCell.dateLabel.textColor = smartDarkBlue
            }else {
                validCell.dateLabel.textColor = .gray
            }
            
        }
    }
    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
    }
    func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
    }
    func calendar(_ calendar: JTACMonthView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        formatter.dateFormat = "yyyy"
        monthStackLabel1.text = formatter.string(from: date)
        formatter.dateFormat = "MMMM"
        monthStackLabel2.text = formatter.string(from: date)
        
    }
//    func calendar(_ calendar: JTACMonthView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTACMonthReusableView {
//        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: "CalendarSectionHeaderView", for: indexPath)
//        let date = range.start
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM YYYY"
//        (header as! CalendarSectionHeaderView).title.text = formatter.string(from: date)
//        return header
//    }
//    func calendarSizeForMonths(_ calendar: JTACMonthView?) -> MonthSize? {
//        return MonthSize(defaultSize: 40)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        monthStackLabel1.textColor = smartDarkBlue
        monthStackLabel2.textColor = smartDarkBlue
        monthStackView.axis = .horizontal
        monthStackView.addArrangedSubview(monthStackLabel1)
        monthStackView.addArrangedSubview(monthStackLabel2)
        
        let dateStackLabel1 = UILabel()
        dateStackLabel1.text = "日"
        dateStackLabel1.textColor = smartDarkBlue
        let dateStackLabel2 = UILabel()
        dateStackLabel2.text = "一"
        dateStackLabel2.textColor = smartDarkBlue
        let dateStackLabel3 = UILabel()
        dateStackLabel3.text = "二"
        dateStackLabel3.textColor = smartDarkBlue
        let dateStackLabel4 = UILabel()
        dateStackLabel4.text = "三"
        dateStackLabel4.textColor = smartDarkBlue
        let dateStackLabel5 = UILabel()
        dateStackLabel5.text = "四"
        dateStackLabel5.textColor = smartDarkBlue
        let dateStackLabel6 = UILabel()
        dateStackLabel6.text = "五"
        dateStackLabel6.textColor = smartDarkBlue
        let dateStackLabel7 = UILabel()
        dateStackLabel7.text = "六"
        dateStackLabel7.textColor = smartDarkBlue
        
        let dateStackView = UIStackView(frame: CGRect(x: 35, y:450, width: 368, height: 48))
        dateStackView.axis = .horizontal
        dateStackView.distribution = .fillEqually
        
        dateStackView.spacing = 10
        dateStackView.addArrangedSubview(dateStackLabel1)
        dateStackView.addArrangedSubview(dateStackLabel2)
        dateStackView.addArrangedSubview(dateStackLabel3)
        dateStackView.addArrangedSubview(dateStackLabel4)
        dateStackView.addArrangedSubview(dateStackLabel5)
        dateStackView.addArrangedSubview(dateStackLabel6)
        dateStackView.addArrangedSubview(dateStackLabel7)
        //CGRect(x: 0, y: 440, width: 415, height: 405)
        let backView = UIView(frame: CGRect(x: 0, y: 405, width: 415, height: 440))
        backView.backgroundColor = UIColor.white
        backView.layer.cornerRadius = 5.0
        
        let cal = JTACMonthView(frame: CGRect.zero)
        cal.backgroundColor = .white
        cal.cellSize = 60
        cal.calendarDelegate = self
        cal.calendarDataSource = self
        cal.scrollingMode = .stopAtEachSection
        cal.minimumLineSpacing = 0
        cal.minimumInteritemSpacing = 0
        cal.register(DateCell.self, forCellWithReuseIdentifier: "calenderCellID")
        cal.visibleDates{(visibleDates) in
            let date = visibleDates.monthDates.first!.date
            self.formatter.dateFormat = "yyyy"
            self.monthStackLabel1.text = self.formatter.string(from: date)
            self.formatter.dateFormat = "MMMM"
            self.monthStackLabel2.text = self.formatter.string(from: date)
        }
//        cal.register(UINib(nibName: "CalendarSectionHeaderView", bundle:Bundle.main) , forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CalendarSectionHeaderView")
 //       cal.scrollToDate(Date(),animateScroll: false)
        cal.selectDates([Date()])
        self.view.addSubview(backView)
        self.view.addSubview(cal)
        self.view.addSubview(dateStackView)
        self.view.addSubview(monthStackView)
        
      
        cal.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([cal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     cal.topAnchor.constraint(equalTo: view.topAnchor, constant: 490),
                                     cal.widthAnchor.constraint(equalToConstant: 375),
                                     cal.heightAnchor.constraint(equalToConstant: 340),])
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
