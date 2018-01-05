//
//  Shot.swift
//  Fireshot
//
//  Created by Toan Nguyen Dinh on 1/4/18.
//  Copyright © 2018 Toan Nguyen Dinh. All rights reserved.
//

import Foundation
import FirebaseDatabase



class Shot{
    
    private var ref: DatabaseReference!
    let id: String!
    var file:String!
    var url:String!
    let uid: String!
    let timestamp: Int!
    
    init(file: String, url: String, uid: String) {
        
        self.ref = Database.database().reference(withPath: "shots")
        self.id = self.ref.childByAutoId().key
        self.file = file
        self.url = url
        self.uid = uid
        self.timestamp = lround(NSDate().timeIntervalSince1970 * 1000)
    }
    
    func setFilename(name: String){
    
        self.file = name
    }
    func setDownloadUrl(urlString: String){
        self.url = urlString
    }
    
    func save(){
        
        let shot: [String: Any] = [
            "file": self.file,
            "url": self.url,
            "uid": self.uid,
            "timestamp": self.timestamp
        ]
        
       // save to firebase db
        
        self.ref.child(self.id).setValue(shot) { (error, databaseRef) in
           
            if let error = error{
                print("Debug: saving the shot with error ", error )
            }
            
        }
    }
}

















