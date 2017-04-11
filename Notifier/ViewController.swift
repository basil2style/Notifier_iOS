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

class ViewController: UIViewController {
    
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
        
    }
    @IBAction func viewDeliveredNotifications(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) {
            (isGranted, error) in
            self.isGrantedPermission = isGranted
        }
    }

   


}

