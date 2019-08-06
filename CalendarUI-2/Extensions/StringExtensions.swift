//
//  StringExtensions.swift
//  MyTestCalendar
//
//  Created by Joel Ton on 8/3/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import Foundation


// MARK: - String extension
extension String {
	static var dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"
		return formatter
	}()
	
	
	var date: Date? {
		return String.dateFormatter.date(from: self)
	}
}
