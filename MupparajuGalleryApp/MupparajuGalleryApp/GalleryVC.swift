//
//  ViewController.swift
//  MupparajuGalleryApp
//
//  Created by Mupparaju,Lakshmi on 3/12/23.
//

import UIKit

class GalleryVC: UIViewController {
    
    
    @IBOutlet weak var searchTF: UITextField!
    
    
    @IBOutlet weak var commentTF: UITextField!
    
    
    @IBOutlet weak var pictureIV: UIImageView!
    
    @IBOutlet weak var pictureCommentsTV: UITextView!
    
    
    @IBOutlet weak var searchBTN: UIButton!
    
    @IBAction func search(_ sender: UIButton) {
    }
    
    @IBOutlet weak var likeBTN: UIButton!
    
    @IBAction func like(_ sender: UIButton) {
    }
    
    @IBOutlet weak var dislikeBTN: UIButton!
    
    @IBAction func dislike(_ sender: UIButton) {
    }
    
    @IBOutlet weak var saveBTN: UIButton!
    
    @IBAction func save(_ sender: UIButton) {
    }
    
    
    @IBOutlet weak var resetBTN: UIButton!
    
    
    @IBAction func reset(_ sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

