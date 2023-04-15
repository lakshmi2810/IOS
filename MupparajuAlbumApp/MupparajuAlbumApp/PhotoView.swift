//
//  PhotoView.swift
//  MupparajuAlbumApp
//
//  Created by Mupparaju,Lakshmi on 3/29/23.
//

import UIKit

class PhotoView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var likeLBL: UILabel!
    
    
    
    var symbolView = false
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUp()
    }
    
    private func setUp() {
 
        let viewFromXib = Bundle.main.loadNibNamed("PhotoView", owner: self)![0] as! UIView
        viewFromXib.frame = self.bounds
        self.addSubview(viewFromXib)
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 2.0
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        
    }
    
    func tapFunc() {
        let doublepress = UITapGestureRecognizer(target: self, action: #selector(doubleTapGesture))
         doublepress.numberOfTapsRequired = 2
        self.imageView.addGestureRecognizer(doublepress)
    }
    
    @objc func press() {
         let prolongPress = UILongPressGestureRecognizer(target: self, action: #selector(AlbumVC.pressed(_:)))
         
        self.imageView.addGestureRecognizer(prolongPress)
     }

    
    @objc func doubleTapGesture() {
        
        symbolView = !symbolView
        likeLBL.isHidden = !symbolView
        self.likeLBL.text = "❤️"
       
    }
    
    @objc func imageTap(tapGestureRecognizer: UITapGestureRecognizer) {
      
       
        let tapImage = tapGestureRecognizer.view as! UIImageView
        let viewFromXib = Bundle.main.loadNibNamed("PhotoView", owner: self)![0] as! UIView
        viewFromXib.frame = self.bounds
        self.addSubview(viewFromXib)

    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
