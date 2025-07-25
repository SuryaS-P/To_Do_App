//
//  Task.swift
//  To_Do_App
//
//  Created by Scholar on 7/25/25.
//

import Foundation
import SwiftData

@Model
class Task{
    var type : String
    var completion : Bool
    var importanceLevel : String
    
    init(type: String, completion: Bool, importanceLevel: String){
        self.type = type
        self.completion = completion
        self.importanceLevel = importanceLevel
    }
}
