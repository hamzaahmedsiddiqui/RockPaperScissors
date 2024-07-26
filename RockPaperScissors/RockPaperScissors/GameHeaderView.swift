//
//  GameHeaderView.swift
//  RockPaperScissors
//
//  Created by hamza Ahmed on 2024-07-26.
//

import SwiftUI

struct GameHeaderView: View {
    var noOfTurn: Int
    var gameArray: [String]
    var correctAnswer: Int
    
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.2, blue: 0.45)
            
            VStack {
                HStack {
                    Text("Turn \(noOfTurn) out of 10")
                        .foregroundColor(.white)
                }
                Text("Rock, Paper, Scissor")
                    .font(.title)
                    .foregroundColor(.white)
                
                if noOfTurn != 0 {
                    Image("\(gameArray[correctAnswer])")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 150, maxHeight: 150)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                        .padding(.top, 50)
                    
                    Text("\(gameArray[correctAnswer])")
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
        }
    }
}


#Preview {
    GameHeaderView()
}
