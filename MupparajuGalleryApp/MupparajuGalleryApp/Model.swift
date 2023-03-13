//
//  Model.swift
//  MupparajuGalleryApp
//
//  Created by Mupparaju,Lakshmi on 3/12/23.
//

import Foundation

struct AppConstants {
    static let carKeywords = ["BMW", "Lambo", "Fearrari", "Jeep", "Car", "car","cars", "cars"]
    static let carPictures = ["BMW", "Lambo", "Fearrari", "Jeep","AUDI"]
    
    static let bikeKeywords = []
    static let bikePictures = []
    
    static let laptopKeywords = []
    static let laptopPictures = []
    
    // add more
    
    static let randomValueOfLikesAndDisklikes: UInt32 = 100
    static let defaultSearchMessage = "Sorry! No pictures fiubd for the search. Try again with a different search keyword."
    static let defaultCommentMessage = "No Comments yet."
    
}

struct Picture {
    let name: String
    var likeCount: String
    var dislikeCount: String
    let comments: [String]
}
class Category {
    var keywords : [String]
    var pictures: [String]
    
    init(with keywords: [String], pictures: [String]){
        //intialize
    }
}
