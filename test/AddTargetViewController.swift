//
//  AddTargetViewController.swift
//  test
//
//  Created by Yu hsuan Yang on 2021/4/8.
//  Copyright © 2021 graduateproj. All rights reserved.
//

import UIKit
//import PlaygroundSupport

class AddTargetViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource, UITextFieldDelegate{
    let buttonBar = UIView()
    let formatter = DateFormatter()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        selectedIndex = viewController.view.tag
        segmentedControl.selectedSegmentIndex = selectedIndex
        let pageIndex = viewController.view.tag - 1
        if pageIndex < 0 {
            return nil
        }
        return viewControllerArr[pageIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        selectedIndex = viewController.view.tag
        segmentedControl.selectedSegmentIndex = selectedIndex
        let pageIndex = viewController.view.tag + 1
        if pageIndex > 1{
            return nil
        }
        return viewControllerArr[pageIndex]
    }
    @objc func segmentedChange(sender: UISegmentedControl){
        //index
        print(sender.selectedSegmentIndex)
        
        //文字
        print(sender.titleForSegment(at: sender.selectedSegmentIndex)!)
        
        pageViewControl.setViewControllers([viewControllerArr[sender.selectedSegmentIndex]], direction: .forward, animated: false)
        UIView.animate(withDuration: 0.3) {
            self.buttonBar.frame.origin.x = (self.segmentedControl.frame.width / CGFloat(self.segmentedControl.numberOfSegments)) * CGFloat(self.segmentedControl.selectedSegmentIndex)
 
     }
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
    @objc func selectDate()
    {
        self.present(SelectDateController(), animated: true, completion: nil)
    }
    @objc func clickButton() {
        var subDateBtn : UIButton!
        let nowDate = self.formatter.string(from: Date())
        subDateBtn = UIButton(frame: CGRect(x: 16, y: 470, width: 125, height: 45))
        subDateBtn.backgroundColor = smartMiddleBlue
        subDateBtn.setTitle(nowDate, for: UIControl.State.normal)
        subDateBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -19, bottom: 0, right: 0)
        subDateBtn.setTitleColor(UIColor.white, for: .normal)
        subDateBtn.layer.cornerRadius = 10.0
        subDateBtn.addTarget(nil, action: #selector(AddTargetViewController.selectDate), for: .touchUpInside)
        self.view.addSubview(subDateBtn)
        
        let triangleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 9, height: 4))
        // 使用 UIImage(named:) 放置圖片檔案
        triangleImageView.image = UIImage(named: "triangleButton")
        // 設置新的位置並放入畫面中
        triangleImageView.center = CGPoint(x:124,y:495)
        self.view.addSubview(triangleImageView)
        
        let subGTargetField = UITextField(frame: CGRect(x: 0, y: 0, width: 240, height: 45))
        let subGTargetFieldFont:UIFont = UIFont.systemFont(ofSize: 20)
        subGTargetField.font = subGTargetFieldFont
        subGTargetField.center = CGPoint(x: 278, y: 492)
        // 尚未輸入時的預設顯示提示文字
        subGTargetField.placeholder = "名稱"
        let subGindentView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        subGTargetField.leftView = subGindentView
        subGTargetField.leftViewMode = .always
        // 輸入框的樣式 這邊選擇圓角樣式
        subGTargetField.layer.cornerRadius = 10.0
        // 輸入框右邊顯示清除按鈕時機 這邊選擇當編輯時顯示
        subGTargetField.clearButtonMode = .whileEditing
        subGTargetField.keyboardType = .default
        // 鍵盤上的 return 鍵樣式 這邊選擇 Done
        subGTargetField.returnKeyType = .done
        // 輸入文字的顏色
        subGTargetField.textColor = UIColor.black
        // UITextField 的背景顏色
        subGTargetField.backgroundColor = UIColor.white
        subGTargetField.borderStyle = .none
        self.view.addSubview(subGTargetField)
        
    }
    var segmentedControl = UISegmentedControl()
    var pageViewControl = UIPageViewController()
    var viewControllerArr = Array<UIViewController>()
    var selectedIndex: Int = 0
    var quantifyController = UIViewController()
    var generalController = UIViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        //設置日期樣式
        formatter.dateStyle = .full
        formatter.locale = Locale(identifier: "zh_TW")
        //客製化日期格式
        formatter.dateFormat = "yyyy/MM/dd"
        let nowDate = self.formatter.string(from: Date())
        
        let myTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        myTitle.center = CGPoint(x: 207, y:40)
        myTitle.textAlignment = .center
        myTitle.text = "新增目標"
        let customTitleFont:UIFont = UIFont.systemFont(ofSize: 20)
        myTitle.font = customTitleFont
        myTitle.font = UIFont.systemFont(ofSize: 20)
        myTitle.textColor = smartDarkBlue
        self.view.addSubview(myTitle)

        let cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.setTitleColor(smartDarkGold, for: UIControl.State.normal)
        cancelButton.addTarget(nil, action: #selector(AddEventController.goBack), for: .touchUpInside)
        cancelButton.center = CGPoint(x: 35, y: 40)
        cancelButton.tintColor = smartDarkGold
        self.view.addSubview(cancelButton)
        
        let myQTarget = UITextField(frame: CGRect(x: 0, y: 0, width: 380, height: 45))
        
        let nextButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        nextButton.setTitle("下一步", for: .normal)
        nextButton.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        nextButton.addTarget(nil, action: #selector(AddEventController.goBack), for: .touchUpInside)
        nextButton.center = CGPoint(x: 371, y: 40)
        nextButton.tintColor = smartDarkGold
        if myQTarget.text != "" {
            nextButton.addTarget(nil, action: #selector(AddTargetViewController.goBack), for: .touchUpInside)
        }
        self.view.addSubview(nextButton)
        segmentedControl.insertSegment(withTitle: "量化目標", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "一般目標", at: 1, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .clear
        segmentedControl.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 18),
         NSAttributedString.Key.foregroundColor: smartDarkGold], for: .selected)
        segmentedControl.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 18),
         NSAttributedString.Key.foregroundColor:  UIColor.darkGray], for: .normal)
        
        segmentedControl.frame = CGRect.init(x:0,y:75,width: self.view.frame.width,height:54)
        segmentedControl.addTarget(self, action: #selector(segmentedChange), for: .valueChanged)
        self.view.addSubview(segmentedControl)
        pageViewControl = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewControl.view.frame = CGRect.init(x:0, y:128, width: self.view.frame.width, height: self.view.frame.height - 128)
        pageViewControl.delegate = self
        pageViewControl.dataSource = self
        pageViewControl.isEditing = true
        self.addChild(pageViewControl)
        self.view.addSubview(pageViewControl.view)
        
        
        let QTargetFont:UIFont = UIFont.systemFont(ofSize: 20)
        myQTarget.font = QTargetFont
        myQTarget.center = CGPoint(x: 207, y: 50)
        // 尚未輸入時的預設顯示提示文字
        myQTarget.placeholder = "目標名稱"
        let indenttView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        myQTarget.leftView = indenttView
        myQTarget.leftViewMode = .always
        // 輸入框的樣式 這邊選擇圓角樣式
        myQTarget.layer.cornerRadius = 5.0
        // 輸入框右邊顯示清除按鈕時機 這邊選擇當編輯時顯示
        myQTarget.clearButtonMode = .whileEditing
        myQTarget.keyboardType = .default
        // 鍵盤上的 return 鍵樣式 這邊選擇 Done
        myQTarget.returnKeyType = .done
        // 輸入文字的顏色
        myQTarget.textColor = UIColor.black
        // UITextField 的背景顏色
        myQTarget.backgroundColor = UIColor.white
        myQTarget.borderStyle = .none
        myQTarget.delegate = self
        
        // 使用 UIImageView(frame:) 建立一個 UIImageView
        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        // 使用 UIImage(named:) 放置圖片檔案
        myImageView.image = UIImage(named: "icon_home_goal_goal")
        // 設置新的位置並放入畫面中
        myImageView.center = CGPoint(x:29,y:126)
        
        let myFinalGoal = UILabel(frame: CGRect(x: 50, y: 118, width: 104, height: 25))
        myFinalGoal.text = "最終目標"
        myFinalGoal.font = UIFont.systemFont(ofSize: 18)
        myFinalGoal.textColor = smartDarkBlue
        
        let viewController1 = UIViewController()
        viewController1.view.backgroundColor =  smartLightBlue
        viewController1.view.tag = 0
        viewController1.view.addSubview(myQTarget)
        viewController1.view.addSubview(myImageView)
        viewController1.view.addSubview(myFinalGoal)
        
        let myGTarget = UITextField(frame: CGRect(x: 0, y: 0, width: 380, height: 45))
        let GTargetFont:UIFont = UIFont.systemFont(ofSize: 20)
        myGTarget.font = GTargetFont
        myGTarget.center = CGPoint(x: 207, y: 50)
        // 尚未輸入時的預設顯示提示文字
        myGTarget.placeholder = "目標名稱"
        let GindenttView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        myGTarget.leftView = GindenttView
        myGTarget.leftViewMode = .always
        // 輸入框的樣式 這邊選擇圓角樣式
        myGTarget.layer.cornerRadius = 10.0
        // 輸入框右邊顯示清除按鈕時機 這邊選擇當編輯時顯示
        myGTarget.clearButtonMode = .whileEditing
        myGTarget.keyboardType = .default
        // 鍵盤上的 return 鍵樣式 這邊選擇 Done
        myGTarget.returnKeyType = .done
        // 輸入文字的顏色
        myGTarget.textColor = UIColor.black
        // UITextField 的背景顏色
        myGTarget.backgroundColor = UIColor.white
        myGTarget.borderStyle = .none
        myGTarget.delegate = self
       
        let myDateImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        // 使用 UIImage(named:) 放置圖片檔案
        myDateImageView.image = UIImage(named: "icon_date_range")
        // 設置新的位置並放入畫面中
        myDateImageView.center = CGPoint(x:25,y:126)
        
        let myDateText = UILabel(frame: CGRect(x: 44, y: 115, width: 104, height: 25))
        myDateText.text = "日期"
        myDateText.font = UIFont.systemFont(ofSize: 18)
        myDateText.textColor = smartDarkBlue
        
        var dateBtn : UIButton!
        dateBtn = UIButton(frame: CGRect(x: 17, y: 155, width: 380, height: 45))
        dateBtn.backgroundColor = UIColor.white
        dateBtn.setTitle(nowDate, for: UIControl.State.normal)
        dateBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -265, bottom: 0, right: 0)
        dateBtn.setTitleColor(UIColor.lightGray, for: .normal)
        dateBtn.layer.cornerRadius = 10.0
        dateBtn.addTarget(nil, action: #selector(AddTargetViewController.selectDate), for: .touchUpInside)
        
        var subDateBtn : UIButton!
        subDateBtn = UIButton(frame: CGRect(x: 16, y: 280, width: 125, height: 45))
        subDateBtn.backgroundColor = smartMiddleBlue
        subDateBtn.setTitle(nowDate, for: UIControl.State.normal)
        subDateBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -19, bottom: 0, right: 0)
        subDateBtn.setTitleColor(UIColor.white, for: .normal)
        subDateBtn.layer.cornerRadius = 10.0
        subDateBtn.addTarget(nil, action: #selector(AddTargetViewController.selectDate), for: .touchUpInside)
        
        let subGTargetImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        // 使用 UIImage(named:) 放置圖片檔案
        subGTargetImageView.image = UIImage(named: "assignment")
        // 設置新的位置並放入畫面中
        subGTargetImageView.center = CGPoint(x:25,y:255)
        
        let subGTargetText = UILabel(frame: CGRect(x: 44, y: 242, width: 104, height: 25))
        subGTargetText.text = "子目標"
        subGTargetText.font = UIFont.systemFont(ofSize: 18)
        subGTargetText.textColor = smartDarkBlue
        
        let triangleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 9, height: 4))
        // 使用 UIImage(named:) 放置圖片檔案
        triangleImageView.image = UIImage(named: "triangleButton")
        // 設置新的位置並放入畫面中
        triangleImageView.center = CGPoint(x:124,y:305)
        
        let subGTargetField = UITextField(frame: CGRect(x: 0, y: 0, width: 240, height: 45))
        let subGTargetFieldFont:UIFont = UIFont.systemFont(ofSize: 20)
        subGTargetField.font = subGTargetFieldFont
        subGTargetField.center = CGPoint(x: 278, y: 302)
        // 尚未輸入時的預設顯示提示文字
        subGTargetField.placeholder = "名稱"
        let subGindentView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        subGTargetField.leftView = subGindentView
        subGTargetField.leftViewMode = .always
        // 輸入框的樣式 這邊選擇圓角樣式
        subGTargetField.layer.cornerRadius = 10.0
        // 輸入框右邊顯示清除按鈕時機 這邊選擇當編輯時顯示
        subGTargetField.clearButtonMode = .whileEditing
        subGTargetField.keyboardType = .default
        // 鍵盤上的 return 鍵樣式 這邊選擇 Done
        subGTargetField.returnKeyType = .done
        // 輸入文字的顏色
        subGTargetField.textColor = UIColor.black
        // UITextField 的背景顏色
        subGTargetField.backgroundColor = UIColor.white
        subGTargetField.borderStyle = .none
        
        let viewController2 = UIViewController()
        
        var addSubGBtn = UIButton()
        addSubGBtn = UIButton(frame: CGRect(x: 0, y: 610, width: 160, height: 40))
        addSubGBtn.setTitle("新增子目標", for: .normal)
        addSubGBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        addSubGBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 0)
        addSubGBtn.contentVerticalAlignment = .bottom
        addSubGBtn.setTitleColor(smartSubTBlue, for: .normal)
        addSubGBtn.setImage(UIImage(named: "addSubBtn"), for: .normal)
        addSubGBtn.addTarget(self,action: #selector(AddTargetViewController.clickButton),for: .touchUpInside)
//        var addSubGBtn : UIButton!
//        addSubGBtn = UIButton(frame: CGRect(x: 16, y: 350, width: 380, height: 43))
//        addSubGBtn.backgroundColor = smartMiddleBlue
//        addSubGBtn.setTitle("+ 新的子目標",for: .normal)
//        addSubGBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        addSubGBtn.setTitleColor(UIColor.white, for: .normal)
//        addSubGBtn.layer.cornerRadius = 10.0
//        // 按鈕按下後的動作
//        addSubGBtn.addTarget(self,action: #selector(AddTargetViewController.clickButton),for: .touchUpInside)
        



        
        
        viewController2.view.backgroundColor = smartLightBlue
        viewController2.view.tag = 1
        viewController2.view.addSubview(myGTarget)
        viewController2.view.addSubview(myDateImageView)
        viewController2.view.addSubview(myDateText)
        viewController2.view.addSubview(dateBtn)
        viewController2.view.addSubview(subGTargetImageView)
        viewController2.view.addSubview(subGTargetText)
        viewController2.view.addSubview(subDateBtn)
        viewController2.view.addSubview(triangleImageView)
        viewController2.view.addSubview(subGTargetField)
        viewController2.view.addSubview(addSubGBtn)
        
        // This needs to be false since we are using auto layout constraints
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        buttonBar.backgroundColor = smartDarkGold
        view.addSubview(buttonBar)
        buttonBar.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor).isActive = true
        buttonBar.heightAnchor.constraint(equalToConstant: 3).isActive = true
        // Constrain the button bar to the left side of the segmented control
        buttonBar.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor).isActive = true
        // Constrain the button bar to the width of the segmented control divided by the number of segments
        buttonBar.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments)).isActive = true
        viewControllerArr.append(viewController1)
        viewControllerArr.append(viewController2)
        
        pageViewControl.setViewControllers([viewControllerArr[0]], direction: .forward, animated: false)
        
    }
}

