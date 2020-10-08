//
//  CalendarNavigation.swift
//  LifeCycle
//
//  Created by Sophia Bonsu on 10/8/20.
//  Copyright © 2020 John Solano. All rights reserved.
//


// Sources:
//fSCALENDAR LIBRARY:
//https://github.com/WenchaoD/FSCalendar/blob/master/MOREUSAGE.md
//https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation

import FSCalendar
import UIKit

class ViewController: UIViewController {
    
    fileprivate weak var calendar: FSCalendar!

    //@IBOutlet var calendar:FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        calendar.dataSource = self
        calendar.delegate = self
        calendar.register(FSCalendarCell.self, forCellReuseIdentifier:  "CELL")
        view.addSubview(calendar)
        self.calendar = calendar
        //calendar.delegate = self
    }
    //func calendar(_calendar:FSCalendar,didSelect date: Date,at month)
        

    }

extension ViewController: FSCalendarDataSource, FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
        return"sophia.io"
    }
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        return"checkit"
    }
    
    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
        return UIImage(named: "Lifecycle color monogram PNG ")
    }
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "CELL", for: date, at: position)
        cell.imageView.contentMode = .scaleAspectFit
        return cell
    }
    
}
