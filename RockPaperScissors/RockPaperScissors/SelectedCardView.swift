//
//  SelectedCardView.swift
//  RockPaperScissors
//
//  Created by hamza Ahmed on 2024-07-26.
//

import SwiftUI

struct SelectedCardView: View {
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .background(Color.white.opacity(0.5))
            .cornerRadius(20)
            .padding(5)
    }
}

#Preview {
    SelectedCardView(image: "rock")
}
