//
//  CourseModel.swift
//  ClassReview
//
//  Created by 田中宏貴 on 2024-05-31.
//

import Foundation

struct Class: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var teacherComments: String
    var studentReviews: [String]
    var rating: Double
}


