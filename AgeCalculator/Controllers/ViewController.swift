//
//  ViewController.swift
//  AgeCalculator
//
//  Created by Adam Hatch on 2/10/20.
//  Copyright © 2020 Adam Hatch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    @IBAction func btnCalculateHandler (_ sender: UIButton)
       {
        
        //1 - get selected date from date picker
        let birthDate = self.datePicker.date
        
        //2 - get today's date
        let today = Date()
        
        //3 - create an instance of the user's current calendar
        let calendar = Calendar.current
        
        //4 - use calendar to get difference between two dates
        let components = calendar.dateComponents([.year, .month, .day], from: birthDate, to: today)
        let ageYears = components.year
        let ageMonths = components.month
        let ageDays = components.day
        
        //5 - display age in label
        self.lblAge.text = "\(ageYears!) years, \(ageMonths!) months, \(ageDays!) days"
          
        //check our birth date is earlier than today
        if birthDate >= today
        {
            //display error and return
            let alertView = UIAlertController(title: "Error", message: "Please enter a valid date", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alertView.addAction(action)
            
            self.present(alertView, animated: false, completion: nil)
            
            return
        }
       }

}

