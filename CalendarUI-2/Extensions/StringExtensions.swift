//
//  StringExtensions.swift
//  MyTestCalendar
//
//  Created by Joel Ton on 8/3/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import Foundation

// Get date from string
extension String {
	static var dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "MM-dd-yyyy"
		return formatter
	}()
	
	
	var date: Date? {
		return String.dateFormatter.date(from: self)
	}
}
