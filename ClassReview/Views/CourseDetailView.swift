//
//  CourseDetailView.swift
//  ClassReview
//
//  Created by 田中宏貴 on 2024-05-31.
//


import SwiftUI

struct ClassDetailView: View {
    @State var classItem: Class
    @State private var newReview = ""
    @State private var rating: Double
    
    init(classItem: Class) {
        self._classItem = State(initialValue: classItem)
        self._rating = State(initialValue: classItem.rating)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(classItem.description)
                    .font(.body)
                
                Text("Teacher Comments")
                    .font(.headline)
                Text(classItem.teacherComments)
                    .font(.subheadline)
                
                Text("Student Reviews")
                    .font(.headline)
                ForEach(classItem.studentReviews, id: \.self) { review in
                    Text("• \(review)")
                }
                
                TextField("Add your review", text: $newReview)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    if !newReview.isEmpty {
                        classItem.studentReviews.append(newReview)
                        newReview = ""
                    }
                }) {
                    Text("Submit Review")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                Text("Rate this class")
                    .font(.headline)
                StarRatingView(rating: $rating)
                
                Button(action: {
                    classItem.rating = rating
                }) {
                    Text("Submit Rating")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .navigationTitle(classItem.name)
    }
}

struct ClassDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ClassDetailView(classItem: Class(name: "Sample Class", description: "Sample Description", teacherComments: "Sample Comments", studentReviews: ["Sample Review"], rating: 3.5))
    }
}
