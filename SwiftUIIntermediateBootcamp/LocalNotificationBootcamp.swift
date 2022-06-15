//
//  LocalNotificationBootcamp.swift
//  SwiftUIIntermediateBootcamp
//
//  Created by Rossana Laricchia on 06/06/22.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager()  // Singleton
    
    func requestAuthorization() {
	   let options: UNAuthorizationOptions = [.alert, .sound, .badge]
	   
	   UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
		  if let error = error {
			 print("ERROR: \(error)")
		  } else {
			 print("SUCCESS")
		  }
	   }
    }
    
    func scheduleNotification() {
	   let content = UNMutableNotificationContent()
	   content.title = "This is my first notification"
	   content.subtitle = "This was sooo easy!"
	   content.sound = .default
	   content.badge = 1
	   
	   // time
	   let trigger = UNTimeIntervalNotificationTrigger(
		  timeInterval: 5, repeats: false
	   )
	   
	   // calendar
	   var dateComponents = DateComponents()
	   dateComponents.hour = 11
	   dateComponents.minute = 51
	   // what day of the week - 2: Monday
//	   dateComponents.weekday = 2
	   // the first week of every month
//	   dateComponents.weekOfMonth
	   
	   let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
	   
	   // location
	   
	   
	   let request = UNNotificationRequest(
		  identifier: UUID().uuidString,
		  content: content,
		  trigger: trigger2
	   )
	   UNUserNotificationCenter.current().add(request)
    }
}
struct LocalNotificationBootcamp: View {
    var body: some View {
	   VStack(spacing: 40) {
		  Button("Request permission") {
			 NotificationManager.instance.requestAuthorization()
		  }
		  
		  Button("Schedule notification") {
			 NotificationManager.instance.scheduleNotification()
		  }
	   }
	   // onAppear block loads only once (at first launch time) - not working
	   .onAppear {
		  UIApplication.shared.applicationIconBadgeNumber = -1
	   }
    }
}

struct LocalNotificationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationBootcamp()
    }
}
