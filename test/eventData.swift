//
//  eventData.swift
//  test
//
//  Created by Alice Lai on 2021/3/30.
//  Copyright © 2021 graduateproj. All rights reserved.
//

import Foundation
import RealmSwift

class eventDataList4 : Object{
    //標題
    @objc dynamic var content = " "
    //備註
    @objc dynamic var note :String? = nil
    //開始時間
    @objc dynamic var Starttime = Date()
    //結束時間
    @objc dynamic var Endtime = Date()
    //分類顏色
    @objc dynamic var color :Int = 1
}

