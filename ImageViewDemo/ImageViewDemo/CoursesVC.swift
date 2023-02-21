//
//  ViewController.swift
//  ImageViewDemo
//
//  Created by Avuthu,Manisha on 2/19/23.
//

import UIKit

class CoursesVC: UIViewController {
    
    //constants
    let borderWidth = 0.25
    let cornerRadius = 20.0
    
    //App Model
    let courses: Dictionary<String, Dictionary<String, String>> = ["Cybersec" : ["title" : "Cybersecurity", "crn": "44652", "termOffered": "Fall", "desc": "Cyberseurity is the practice of protecting critical systems and sensitive information from digital attacks. Also known as information technology (IT) security, cybersecurity measures are designed to combat threats aganist networked systems and applications, whether those threats originate from inside or outside of an organization.", "image": "cybersec"],
                                                                   
        "Java": ["title" : "Object-Oriented prog in java", "crn": "44542", "termOffered": "Fall/Spring", "desc": "Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. It is a general-purpose programming language intended to let programmers write once, run anywhere(WORA), meaning that compiled java code can run on any Java virtual machine JVM regardess of the underlyig computer architecture.", "image":"java"],
                                                                   
        "iOS" : ["title": "Mobile Computing iOS", "crn": "44653", "termOffered": "Fall/Spring", "desc": "iOS development is the process of creating applications for Apple,s mobile operating system-the operating system used by the iPhone and iPod Touch.", "image": "iOS"],
                                                                   
        "Database": ["title": "Advance Databse", "crn": "44533", "termOffered": "Fall/Spring", "desc": "In computing, a databse is an organized collection of data stored and accessed electronically. Small databases can be stored on afile system, while large databases are hosted on computer clusters or cloud storage. The design of databases spans formal techniques and practical considerations, including data modeling, efficient data reoresentation and storage, query languages, security and privacy of sensitive data, and distributed computing issues,including supporting concurrent access and fault tolerance.", "image": "database"]
    ]

    
    @IBOutlet weak var coursesSegCtrl: UISegmentedControl! {
        didSet{
            self.coursesSegCtrl.removeAllSegments()
            for (idx, course) in self.courses.keys.enumerated(){
                self.coursesSegCtrl.insertSegment(withTitle: course, at: idx, animated: true)
            }
            self.coursesSegCtrl.addTarget(self, action: #selector(selectCourse(_:)), for: .valueChanged)
        }
    }
    
    @IBOutlet weak var courseThumbnailView: UIView!
    {
        didSet{
            self.setAttributes(for: self.courseThumbnailView)
        }
    }
    
    @IBOutlet weak var ThumbnailIMG: UIImageView! {
        didSet{
            self.setAttributes(for: self.ThumbnailIMG)
        }
    }
    
    @IBOutlet weak var courseTitleLBL: UILabel! {
        didSet{
            self.courseTitleLBL.text = " "
            self.courseTitleLBL.textColor = .white
            self.courseTitleLBL.shadowColor = .systemPink
        }
    }
    
    @IBOutlet weak var courseCRNLBL: UILabel!
    {
        didSet{
            self.courseCRNLBL.text = " "
            self.setAttributes(for: self.courseCRNLBL)
        }
    }
    
    @IBOutlet weak var courseTermLBL: UILabel!
    {
        didSet{
            self.courseTermLBL.text = " "
            self.setAttributes(for: self.courseTermLBL)
        }
    }
    
    @IBOutlet weak var courseDescTV: UITextView!{
        didSet{
            self.courseDescTV.text = "Select a coursee to see its description"
            self.setAttributes(for: self.courseDescTV)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.coursesSegCtrl.selectedSegmentIndex = 0
        self.selectCourse(self.coursesSegCtrl)
    }
    
    @objc func selectCourse(_ sender: UISegmentedControl){
        switch sender.selectedSegmentIndex{
        case 0..<self.courses.count:
            let course = Array(self.courses.keys)[sender.selectedSegmentIndex]
            guard let courseItem = self.courses[course] else {return}
            
            guard let courseImg = courseItem["image"] else {return}
            self.ThumbnailIMG.image = UIImage(named: courseImg)
            
            guard let courseTitle = courseItem["title"] else {return}
            self.courseTitleLBL.text = courseTitle
            
            guard let courseCRN = courseItem["crn"] else {return}
            self.courseCRNLBL.text = courseCRN
            
            guard let courseTerm = courseItem["termOffered"] else {return}
            self.courseTermLBL.text = courseTerm
            
            guard let courseDesc = courseItem["desc"] else {return}
            self.courseDescTV.text = courseDesc
        default:
            break
        }
    }
    
    private func setAttributes(for view: UIView){
        view.layer.borderWidth = self.borderWidth
        view.layer.cornerRadius = self.cornerRadius
        view.layer.borderColor = UIColor.black.cgColor
    }


}

