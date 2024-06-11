//
//  WelcomeScreen.swift
//  ClassReview
//
//  Created by 田中宏貴 on 2024-06-07.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var isActive: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            // Title
            Text("LCS Course Review")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.white)
                .padding(.bottom, 20)
            
            // Subtitle
            Text("LCS students can review the courses they would like to take for next year")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.bottom, 50)
            
            Spacer()
            
            // Get Started Button
            Button(action: {
                withAnimation {
                    isActive = false
                }
            }) {
                
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(15)
                .padding(.horizontal, 40)
            }
            .padding(.bottom, 30)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue]), startPoint: .top, endPoint: .bottom)
        )
        .ignoresSafeArea()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(isActive: .constant(true))
    }
}
