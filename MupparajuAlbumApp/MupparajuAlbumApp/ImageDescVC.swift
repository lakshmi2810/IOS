//
//  ImageDescVC.swift
//  MupparajuAlbumApp
//
//  Created by Mupparaju,Lakshmi on 3/29/23.
//

import UIKit

class ImageDescVC: UIViewController {
    
    var photTag: Int?
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var descTV: UITextView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        print("############ \(photTag!)")
        self.loadImg(AppConstants.vehicles[photTag!])
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 2.0
        
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        
        let swipeabove = UISwipeGestureRecognizer(target: self, action: #selector(swipeGes))
        swipeabove.direction = .up
        imageView.addGestureRecognizer(swipeabove)
        
        let swipebelow = UISwipeGestureRecognizer(target: self, action: #selector(swipeGes))
        swipebelow.direction = .down
        imageView.addGestureRecognizer(swipebelow)
        
        imageView.isUserInteractionEnabled = true

 
    }
    
    func loadImg(_ item:(img:String,dsc:String)) {
        self.imageView.image = UIImage(named: item.img)
        self.descTV.text = item.dsc
    }
    
    @objc func swipeGes(sender: UISwipeGestureRecognizer) {
        if sender.direction == .up {
            imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        } else if sender.direction == .down {
            imageView.transform = .identity
        }
    }


   

}
