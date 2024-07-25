//
//  SelectedCardView.swift
//  RockPaperScissors
//
//  Created by hamza Ahmed on 2024-07-25.
//

import SwiftUI

struct SelectedCardView: View {
    var image: String = ""
    var body: some View {
        VStack {
           
            Image(image)
                    .resizable() // Allows the image to be resizable
                    .aspectRatio(contentMode: .fit) // Keeps the aspect ratio
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
            
            Text(image)
                .font(.title2)
                .foregroundColor(.white)
            
        }
    }
}

#Preview {
    SelectedCardView()
}
