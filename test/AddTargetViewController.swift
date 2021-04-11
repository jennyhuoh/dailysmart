//
//  AddTargetViewController.swift
//  test
//
//  Created by Yu hsuan Yang on 2021/4/8.
//  Copyright © 2021 graduateproj. All rights reserved.
//

import UIKit
//import PlaygroundSupport

class AddTargetViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    let buttonBar = UIView()
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

    var segmentedControl = UISegmentedControl()
    var pageViewControl = UIPageViewController()
    var viewControllerArr = Array<UIViewController>()
    var selectedIndex: Int = 0
    var quantifyController = UIViewController()
    var generalController = UIViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        let viewController1 = UIViewController()
        viewController1.view.backgroundColor =  smartLightBlue
        viewController1.view.tag = 0
        
        let viewController2 = UIViewController()
        viewController2.view.backgroundColor = smartLightGold
        viewController2.view.tag = 1
        
        
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
        
        //量化目標
//        quantifyController.view.tag = 0
//        quantifyController.view.addSubview(self.collectionView)
//        viewControllerArr.append(quantifyController)
    }
}
