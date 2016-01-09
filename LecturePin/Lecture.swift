//
//  Lecture.swift
//  LecturePin
//
//  Created by 劉仲軒 on 2016/1/9.
//  Copyright © 2016年 劉仲軒. All rights reserved.
//

import Foundation

class Lecture  {
    var name = ""
    var type = ""
    var professor = ""
    var semester = ""
    var image = ""
    
    init(name:String, type:String, professor:String, semester: String, image: String) {
        self.name = name
        self.type = type
        self.professor = professor
        self.semester = semester
        self.image = image
    }
}