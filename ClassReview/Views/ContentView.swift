//
//  ContentView.swift
//  ClassReview
//
//  Created by 田中宏貴 on 2024-05-30.
//

import SwiftUI

struct ContentView: View {
    @State private var classes: [Class] = [
        Class(name: "Mathematics", description: "An engaging and thorough mathematics course covering algebra, geometry, and calculus.", teacherComments: "Great for students who love problem-solving.", studentReviews: ["Very engaging and thorough.", "Challenging but rewarding."], rating: 4.5),
        Class(name: "History", description: "A comprehensive study of world history from ancient times to modern day.", teacherComments: "Important for understanding the world's past and present.", studentReviews: ["Informative but a bit dry.", "Interesting topics covered."], rating: 3.0),
        Class(name: "Science", description: "Explore fascinating experiments and scientific concepts in biology, chemistry, and physics.", teacherComments: "Hands-on learning experience.", studentReviews: ["Fascinating experiments and topics.", "Loved the practical sessions."], rating: 4.0)
    ]
    
    @State private var showingAddClass = false
    @State private var newClassName = ""
    @State private var newClassDescription = ""
    @State private var newTeacherComments = ""
    @State private var newClassRating: Double = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(classes) { classItem in
                        NavigationLink(destination: ClassDetailView(classItem: classItem)) {
                            ClassCardView(classItem: classItem)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("Classes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddClass = true
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }
                }
            }
            .sheet(isPresented: $showingAddClass) {
                NavigationView {
                    Form {
                        Section(header: Text("Class Name")) {
                            TextField("Enter class name", text: $newClassName)
                        }
                        Section(header: Text("Description")) {
                            TextField("Enter description", text: $newClassDescription)
                        }
                        Section(header: Text("Teacher Comments")) {
                            TextField("Enter teacher comments", text: $newTeacherComments)
                        }
                        Section(header: Text("Rating")) {
                            StarRatingView(rating: $newClassRating)
                        }
                    }
                    .navigationTitle("Add New Class")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                showingAddClass = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                let newClass = Class(name: newClassName, description: newClassDescription, teacherComments: newTeacherComments, studentReviews: [], rating: newClassRating)
                                classes.append(newClass)
                                newClassName = ""
                                newClassDescription = ""
                                newTeacherComments = ""
                                newClassRating = 0
                                showingAddClass = false
                            }
                            .disabled(newClassName.isEmpty || newClassDescription.isEmpty || newTeacherComments.isEmpty)
                        }
                    }
                }
            }
        }
    }
}

struct ClassCardView: View {
    var classItem: Class
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(height: 150)
                .shadow(radius: 10)
            
            VStack(alignment: .leading) {
                Text(classItem.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 2)
                Text(classItem.description)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(2)
                StarRatingView(rating: .constant(classItem.rating))
            }
            .padding()
        }
        .padding(.vertical, 4)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
