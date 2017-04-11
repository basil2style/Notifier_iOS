//
//  ViewController.swift
//  Notifier
//
//  Created by Basil on 2017-04-11.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import UIKit
import UserNotifications

//There are different kinds of notificaitons

class ViewController: UIViewController,  UNUserNotificationCenterDelegate {
    
    var isGrantedPermission = false

    @IBAction func sendANotification(_ sender: UIButton) {
        
        if (isGrantedPermission) {
            let content = UNMutableNotificationContent()
            content.title = "New Notification"
            content.body = "This is body message"
            
            //Create trigger object
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
            
            //create a request object (container for tje notificaiton request)
            let request = UNNotificationRequest(identifier: "message.new", content: content, trigger: trigger)
            
            //add the request to the notification center
            UNUserNotificationCenter.current().add(request) {
                (error) in
                if(error != nil) {
                    print("error adding notifications")
                }
            }
        }
        
    }
    
    @IBAction func viewPendingNotifications(_ sender: UIButton) {
        UNUserNotificationCenter.current().getPendingNotificationRequests {
            (requestList) in
            print("\(Date()) --> \(requestList.count) request pending")
            for request in requestList {
                    print("\(request.identifier) --> \(request.content.body)")
            }
        }
    }
    @IBAction func viewDeliveredNotifications(_ sender: UIButton) {
        UNUserNotificationCenter.current().getDeliveredNotifications {
            (notifications) in
            print("\(Date()) --> \(notifications.count) delivered")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) {
            (isGranted, error) in
            self.isGrantedPermission = isGranted
        }
    }

    //Delegate  ---------
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.badge,.sound])
    }

}

