//
//  Month.swift
//  CalendarUI-2
//
//  Created by Joel Ton on 8/6/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import Foundation


struct Month {
	var monthNames = ["January", "February", "March", "April", "May", "June", "July",
					  "August", "September", "October", "November", "December"]
	var currentMonthIndex = Calendar.current.component(.month, from: Date())
	var currentYear = Calendar.current.component(.year, from: Date())
	var delegate: MonthViewDelegate?
}
