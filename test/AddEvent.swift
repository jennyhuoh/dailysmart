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
    
    var addContent: UIView!
    //var color = NSMutableArray()
    let cellID = "testCellID"
    
    var color = ["工作","綠","重要","黃"]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:239.0/255, green:239.0/255, blue:239.0/255, alpha:1.0)
        
        self.addContent = UIView(frame: CGRect(x: 0, y: 75, width: 415, height: 770))
        self.addContent.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
        
        let myEvent = UITextField(frame: CGRect(x: 0, y: 0, width: 380, height: 44))
        myEvent.center = CGPoint(x: 207, y: 115)
        // 尚未輸入時的預設顯示提示文字
        myEvent.placeholder = "輸入事件"
        // 輸入框的樣式 這邊選擇圓角樣式
        myEvent.borderStyle = .roundedRect
        // 輸入框右邊顯示清除按鈕時機 這邊選擇當編輯時顯示
        myEvent.clearButtonMode = .whileEditing
        myEvent.keyboardType = .default
        // 鍵盤上的 return 鍵樣式 這邊選擇 Done
        myEvent.returnKeyType = .done
        // 輸入文字的顏色
        myEvent.textColor = UIColor.black
        // UITextField 的背景顏色
        myEvent.backgroundColor = UIColor.white
        myEvent.delegate = self
        
        let myNote = UITextField(frame: CGRect(x: 0, y: 0, width: 380, height: 44))
        myNote.center = CGPoint(x: 207, y: 175)
        // 尚未輸入時的預設顯示提示文字
        myNote.placeholder = "新增備註"
        // 輸入框的樣式 這邊選擇圓角樣式
        myNote.borderStyle = .roundedRect
        // 輸入框右邊顯示清除按鈕時機 這邊選擇當編輯時顯示
        myNote.clearButtonMode = .whileEditing
        myNote.keyboardType = .default
        // 鍵盤上的 return 鍵樣式 這邊選擇 Done
        myNote.returnKeyType = .done
        // 輸入文字的顏色
        myNote.textColor = UIColor.black
        // UITextField 的背景顏色
        myNote.backgroundColor = UIColor.white
        myNote.delegate = self
        
        let part = UILabel(frame: CGRect(x: 18, y: 220, width: 100, height: 40))
        part.text = "分類"
        part.textColor = UIColor.black
       
        let chooseColor = UIButton(frame: CGRect(x: 90, y: 220, width: 100, height: 40))
        chooseColor.layer.cornerRadius = 5.0
        chooseColor.contentHorizontalAlignment = .right
        chooseColor.titleEdgeInsets = UIEdgeInsets(top:0, left:0, bottom:0, right:20)
        chooseColor.setTitle("bCell", for: .normal)
        chooseColor.backgroundColor = UIColor.white
        chooseColor.setTitleColor(UIColor .black, for: UIControl.State.normal)
       
        
//        self.color = ["工作","綠","重要","黃"]
//        let colorTableView = UITableView(frame: CGRect(x: 0, y: 615,width: 415,height: 230),style: .plain)
//        // 註冊 cell
//        colorTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
//        // 設置委任對象
//        colorTableView.delegate = self
//        colorTableView.dataSource = self
//        // 分隔線的樣式
//        colorTableView.separatorStyle = .singleLine
//        // 分隔線的間距 四個數值分別代表 上、左、下、右 的間距
//        colorTableView.separatorInset = UIEdgeInsets(top:0, left:20, bottom:0, right:20)
//        // 是否可以點選 cell
//        colorTableView.allowsSelection = true
//        // 是否可以多選 cell
//        colorTableView.allowsMultipleSelection = false
//        colorTableView.tableFooterView = UIView()
//        colorTableView.rowHeight = 48
        
        
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        myLabel.center = CGPoint(x: 207, y:40)
        myLabel.textAlignment = .center
        myLabel.text = "新增事件"
        self.view.addSubview(myLabel)
        
        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        myButton.setTitle("取消", for: .normal)
        myButton.setTitleColor(UIColor .black, for: UIControl.State.normal)
        myButton.addTarget(nil, action: #selector(AddEventController.goBack), for: .touchUpInside)
        myButton.center = CGPoint(x: 35, y: 40)
        
        self.view.addSubview(addContent)
        //self.view.addSubview(colorTableView)
        self.view.addSubview(chooseColor)
        self.view.addSubview(part)
        self.view.addSubview(myNote)
        self.view.addSubview(myEvent)
        self.view.addSubview(myButton)
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
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//        return color.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    {
//        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
//        if cell == nil
//        {
//            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellID)
//        }
//        cell!.textLabel!.text = self.color[indexPath.row] as? String
//        cell?.textLabel?.textAlignment = .center
//        return cell!
//    }
//    @objc private func colorTableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
//    {
//        return true
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
}
