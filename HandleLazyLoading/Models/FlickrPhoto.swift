//
//  FlickrPhoto.swift
//  HandleLazyLoading
//
//  Created by Apple on 2/15/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

class FlickrPhoto:Equatable{

    let photoID : String
    let farm : Int
    let server : String
    let secret : String
    
     init (photoID:String,farm:Int, server:String, secret:String) {
       self.photoID = photoID
       self.farm = farm
       self.server = server
       self.secret = secret
     }
    
    static func == (lhs: FlickrPhoto, rhs: FlickrPhoto) -> Bool {
           return lhs.photoID == rhs.photoID
    }
    
    func flickrImageURL(_ size:String = "m") -> URL? {
    if let url =  URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(photoID)_\(secret)_\(size).jpg") {
         return url
       }
       return nil
    }
    
}
