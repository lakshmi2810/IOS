//
//  ViewController.swift
//  MupparajuCourseRegisterationApp
//
//  Created by Mupparaju,Lakshmi on 2/6/23.
//

import UIKit

class CourseRegistrationVC: UIViewController {
    
    
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var messageLBL: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        messageLBL.text="";
    }
    
    @IBOutlet var courseSWCH: [UISwitch]!
    

    @IBAction func toggleCourse(_ sender: UISwitch) {
       
    }
    @IBAction func onReset(_ sender: UIButton) {
        firstNameTF.text = ""
        lastNameTF.text = ""
        messageLBL.text = ""
        for course in courseSWCH{
            course.isOn = false
        }
    }
    
    @IBAction func onSubmit(_ sender: UIButton) {
        var Courseregistered = courseSWCH.filter{
                    $0.isOn == true
                }
        
                var firstName = firstNameTF.text!
                var lastName = lastNameTF.text!
        
                if (firstName.isEmpty || lastName.isEmpty){
                    messageLBL.text = "Please enter your full name."
                }
                else if(Courseregistered.count>0){
                    messageLBL.text = "CONFIRMATION \n \(firstName), \(lastName) has successfully enrolled in \(Courseregistered.count), course(s), namely, \(courseSWCH[0].isOn == true ? "iOS" : " ")\(courseSWCH[1].isOn == true ? " , Patterns" : " ")\(courseSWCH[2].isOn == true ? " ,Big Data" : " ")."
                }
    
                else{
                    messageLBL.text = """
        Hi \(firstName),\(lastName) please select the courses of your choice.
        """
                }
        }
}


