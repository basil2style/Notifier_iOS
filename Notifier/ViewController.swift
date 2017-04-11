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
            (isGranted, <#Error?#>) in
            self.isGrantedPermission = isGranted
        }
    }

   


}

