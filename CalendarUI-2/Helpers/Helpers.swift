//
//  IsLeapYear.swift
//  CalendarUI-2
//
//  Created by Joel Ton on 8/11/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import Foundation


struct Helpers {
	
	func isLeapYear(currentYear: Int) -> Bool {
		return currentYear % 4 == 0 && currentYear % 100 != 0 ||
			currentYear % 400 == 0
	}
}
