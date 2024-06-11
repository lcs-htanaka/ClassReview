//
//  StarRatingView.swift
//  ClassReview
//
//  Created by 田中宏貴 on 2024-06-04.
//

import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Double
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow

    var body: some View {
        HStack {
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > Int(rating) ? offColor : onColor)
                    .onTapGesture {
                        rating = Double(number)
                    }
            }
        }
    }

    private func image(for number: Int) -> Image {
        if number > Int(rating) {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}
