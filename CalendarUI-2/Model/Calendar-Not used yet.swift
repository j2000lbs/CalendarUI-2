//
//  Calendar.swift
//  CalendarUI-2
//
//  Created by Joel Ton on 8/6/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit
import EventKit

// Doesn't work

//class Calendar {
//
//	// Create an Event Store instance
//	let eventStore = EKEventStore()
//
//	// Use Event Store to create a new calendar instance
//	// Configure its title
//	let newCalendar = EKCalendar()		//(for: .event, eventStore: eventStore)
//
//
//	// Probably want to prevent someone from saving a calendar
//	// if they don't type in a name...
//	newCalendar.title = "Some Calendar Name"
//
//
//	// Access list of available sources from the Event Store
//	let sourcesInEventStore = eventStore.sources
//
//	// Filter the available sources and select the "Local" source to assign to the new calendar's
//	// source property
//	newCalendar.source = sourcesInEventStore.filter{
//		(source: EKSource) -> Bool in
//		source.sourceType.rawValue == EKSourceType.local.rawValue
//	}.first!
//
//	// Save the calendar using the Event Store instance
//	do {
//		try eventStore.saveCalendar(newCalendar, commit: true)
//		UserDefaults.standard.set(newCalendar.calendarIdentifier, forKey: "EventTrackerPrimaryCalendar")
//	} catch {
//		let alert = UIAlertController(title: "Calendar could not save", message: (error as NSError).localizedDescription, preferredStyle: .alert)
//		let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//		alert.addAction(OKAction)
//
//		self.presentViewController(alert, animated: true, completion: nil)
//	}
//
//}
