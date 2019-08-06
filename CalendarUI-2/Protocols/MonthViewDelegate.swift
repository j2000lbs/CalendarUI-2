//
//  MonthViewDelegate.swift
//  CalendarUI-2
//
//  Created by Joel Ton on 8/4/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import Foundation


protocol MonthViewDelegate {
	func didChange(month monthIndex: Int, year:Int)
}
