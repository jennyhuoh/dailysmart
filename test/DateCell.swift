//
//  DateCell.swift
//  test
//
//  Created by Jenny huoh on 2021/3/12.
//  Copyright © 2021 graduateproj. All rights reserved.
//

import UIKit
import JTAppleCalendar

class DateCell: JTACDayCell {
      var dateLabel : UILabel = {
          let dateLabel = UILabel()
          dateLabel.text = "sample"
          return dateLabel
      }()
    var selectView: UIView = {
       let selectView = UIView()
        selectView.backgroundColor = smartDarkGold
        selectView.layer.cornerRadius = 20
        selectView.isHidden = true
        return selectView
    }()
      
      override init(frame: CGRect) {
          super.init(frame: frame)
        
          addSubview(selectView)
          addSubview(dateLabel)
               
       
          dateLabel.translatesAutoresizingMaskIntoConstraints = false
          selectView.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                                      dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
                                      dateLabel.heightAnchor.constraint(equalToConstant: 13),
                                      selectView.widthAnchor.constraint(equalToConstant: 40),
                                      selectView.heightAnchor.constraint(equalToConstant: 40),
                                      selectView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                      selectView.centerYAnchor.constraint(equalTo: centerYAnchor)])
      }
      
      required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
}
