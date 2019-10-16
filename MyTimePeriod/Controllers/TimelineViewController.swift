//
//  TimelineViewController.swift
//  MyDailyRoutine
//
//  Created by Marcos Simas on 22/09/19.
//  Copyright © 2019 Marcos Simas. All rights reserved.
//

import UIKit

import Foundation




class TimelineViewController: UIViewController {
    
    
    // MARK: - Public Properties
    
    
    // MARK: - Private Properties
    
    
    
    
    override func loadView() {
        
        super.loadView()
        
        view.backgroundColor = .white
        
        setupMenuButtons()
        
    }
    

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    
    
    private func setupMenuButtons() {
        
        //Setup TPButton
        let TPButtonFrame = CGRect(x: view.bounds.width - 50, y: 40, width: 30, height: 30)
        let TPButton = UIButton(frame: TPButtonFrame)
        TPButton.backgroundColor = UIColor.orange
        //scrollToTodayButton.setTitle("Menu", for: .normal)
        TPButton.addTarget(self, action: #selector(self.TPButtonTapped), for: .touchUpInside)
        
        view.addSubview(TPButton)
        
    }
    
    
    
    @objc func TPButtonTapped() {
        
        testTimeRange()
        
    }
    
    
    
    
    // Code to test TimeRange implementation
    // Tap the orange button on simulator to print results on console
    private func testTimeRange() {
        
        let tr0 = TimeRange()
            
        print("Init()")
        print("TR0")
        print(tr0.start)
        print(tr0.end)
            
            
        print("")
        print("Is Anytime")
        print(tr0.isAnytime)
        
        let tr1 = TimeRange(start: Date(), duration: 106000)
        let tr2 = TimeRange(start: Date(), end: Date().addingTimeInterval(508000))
            
        let date1 = Date().addingTimeInterval(126000)
        
        let date2 = Date().addingTimeInterval(115200)
        
        let date3 = date1.addingTimeInterval(323200)
            
        let tr3 = TimeRange(start: date1, duration: 208000)
            
            
        print("")
        print("TR1 - Date + duration")
        print("Date: \(Date())")
        print(tr1.start)
        print(tr1.end)
            
        print("")
        print("TR2 - Date + Date")
        print("Date: \(Date())")
        print(tr2.start)
        print(tr2.end)
        print("")
        print("TR3 - Date + Duration")
        print(Date())
        print(tr3.start)
        print(tr3.end)
            
        print("")
        print("Get Relation")
        print(tr1.getRelation(test: tr2))
        print(tr2.getRelation(test: tr1))
            
        print("")
        print("Has Start/End")
        print(tr1.hasStart)
        print(tr1.hasEnd)
            
        print("")
        print("Duration")
        print("TR1: \(tr1.duration)")
        print("TR2: \(tr2.duration)")
        print("TR3: \(tr3.duration)")
        print("")
        print("Has Inside - Date")
        print("Date1: \(date1)")
        print(tr1.hasInside(test: date1))
        print(tr2.hasInside(test: date1))
        print(tr3.hasInside(test: date1))
            
        print("")
        print("Has Inside - TimeRange")
        print(tr1.hasInside(test: tr3))
        print(tr2.hasInside(test: tr3))
            
            
        tr3.move(offset: 14400)
        print("")
        print("TR3 - Move")
        print(tr3.start)
        print(tr3.end)
            
            
        tr3.expandTo(moment: date2)
        print("")
        print("TR3 - ExpandTo")
        print("Date2: \(date2)")
        print(tr3.start)
        print(tr3.end)
            
            
            
        tr3.expandTo(moment: date3)
        print("")
        print("TR3 - ExpandTo")
        print("Date3: \(date3)")
        print(tr3.start)
        print(tr3.end)
            
            
            
            
        let tr4 = TimeRange(start: tr3.start!.addingTimeInterval(143200), end: tr3.end!.addingTimeInterval(-143200))
            
        tr3.shrinkTo(period: tr4)
        print("")
        print("TR3 - ShrinkTo")
        print("TR4")
        print(tr4.start)
        print(tr4.end)
        print("TR3 New")
        print(tr3.start)
        print(tr3.end)
            
            
        print("")
        print("IntersectsWith?")
            
        
        tr3.expandStartTo(moment: tr3.start!.addingTimeInterval(-3600))
        tr3.expandEndTo(moment: tr3.end!.addingTimeInterval(3600))
            
        print("TR3 - ExpandStartTo")
        print("TR3")
        print(tr3.start)
        print(tr3.end)

            
        print("TR3 - IntersectsWith?")
        print(tr3.intersectsWith(test: tr4))
            
        
        let tr5 = tr3.getIntersection(period: tr4) as! TimeRange
            
        print("GetIntersection")
        print("TR3")
        print(tr3.start)
        print(tr3.end)
        print("TR4")
        print(tr4.start)
        print(tr4.end)
        print("TR5")
        print(tr5.start)
        print(tr5.end)
            
            
        print("Has Same data")
        print(tr5.hasSameData(comp: tr4))
            
        print("")
        print("TR3 - Overlap?")
        print(tr3.overlapsWith(test: tr4))
            
            
            
        tr3.reset()
            
        print("TR3 - Reset")
        print(tr3.start)
        print(tr3.end)
            
            
            
        print("TR3 New - Has Start/End?")
        print(tr3.hasStart)
        print(tr3.hasEnd)
        
    
    }


}
