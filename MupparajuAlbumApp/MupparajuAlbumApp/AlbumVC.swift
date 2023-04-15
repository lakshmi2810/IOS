//
//  AlbumVC.swift
//  MupparajuAlbumApp
//
//  Created by Mupparaju,Lakshmi on 3/29/23.
//

import UIKit
import AudioToolbox

class AlbumVC: UIViewController {
    var imageDescription: String = ""
    var tag: Int?
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
        
 
    
    @IBOutlet var vehicle: [PhotoView]! {
        didSet {
            for i in 0..<self.vehicle.count {
                self.loadItem(self.vehicle[i], AppConstants.vehicles[i])
            }
        }
    }
    
    var soundType: SystemSoundID = 1003
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "imageDeets" {
            guard let destVc = segue.destination as? ImageDescVC else {return}
            destVc.photTag = sender as? Int
        }
             
         
     }
    
    func loadItem(_ view: PhotoView, _ item:(imagebrand:String,descname:String)) {
       view.imageView.image = UIImage(named: item.imagebrand)
       //view.photoLBL.text = item.descname
   }
   
   func loadSymbol(_ view: PhotoView,_ item: (imageview: String, descName: String)) {
       
       view.doubleTapGesture()
   }
            
    override func viewDidLoad() {
           super.viewDidLoad()
           
          
           for i in 0..<vehicle.count {
          let prolongPress = UILongPressGestureRecognizer(target: self, action: #selector(pressed(_:)))
         
           self.vehicle[i].addGestureRecognizer(prolongPress)
               
           let doublepress = UITapGestureRecognizer(target: self, action: #selector(doubleTapGesture))
                 doublepress.numberOfTapsRequired = 2
               self.vehicle[i].addGestureRecognizer(doublepress)
               
           }
         
           
       }
        
    @objc func imageTap(tapGestureRecognizer: UITapGestureRecognizer) {
        
        AudioServicesPlaySystemSound(soundType)
        var k = tapGestureRecognizer.view!.tag
    

        }
    
    @objc func pressed(_ sender: UILongPressGestureRecognizer) {
       
        guard let lr = sender.view else {return}
         tag = lr.tag
        performSegue(withIdentifier: "imageDeets", sender: tag)
    }
    
    @objc func doubleTapGesture(_ sender: UITapGestureRecognizer) {
        AudioServicesPlaySystemSound(soundType)
        guard let tagNum = sender.view else {return}
        var  likeTag = tagNum.tag
            self.loadSymbol(self.vehicle[likeTag], AppConstants.vehicles[likeTag])
       
    }

       
}


