//
//  GameSelectionView.swift
//  RockPaperScissors
//
//  Created by hamza Ahmed on 2024-07-26.
//

import SwiftUI

struct GameSelectionView: View {
    var gameArray: [String]
    @Binding var score: Int
    @Binding var noOfTurn: Int
    @Binding var correctAnswer: Int
    @Binding var showAlert: Bool
    @Binding var alertTitle: String
    @Binding var alertMessage: String
    
    var body: some View {
        ZStack {
            Color(red: 0.76, green: 0.15, blue: 0.26)
            
            VStack {
                Text("Select any one to play")
                    .font(.title3)
                    .foregroundColor(.white)
                
                HStack {
                    ForEach(0..<gameArray.count, id: \.self) { index in
                        Button(action: {
                            askQuestion(selectedAnswer: index)
                        }) {
                            SelectedCardView(image: gameArray[index])
                        }
                    }
                }
                .padding(.top)
                
                Spacer()
                
                Text("Your score is \(score)")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
        }
    }
    
    func askQuestion(selectedAnswer: Int) {
        correctAnswer = Int.random(in: 0...2)
        noOfTurn += 1
        
        if (selectedAnswer == 0 && correctAnswer == 2) || (selectedAnswer == 1 && correctAnswer == 0) || (selectedAnswer == 2 && correctAnswer == 1) {
            score += 1
            alertTitle = "You Win"
        } else if selectedAnswer == correctAnswer {
            alertTitle = "Draw"
        } else {
            alertTitle = "You Lose"
        }
        
        alertMessage = "\(10 - noOfTurn) turns left"
        showAlert = true
        
        if noOfTurn == 10 {
            alertTitle = "Your Turn Finished"
            alertMessage = "Your Score is \(score)"
            showAlert = true
            score = 0
            noOfTurn = 0
        }
    }
}


//#Preview {
//    GameSelectionView(gameArray: <#[String]#>, score: <#Binding<Int>#>, noOfTurn: <#Binding<Int>#>, correctAnswer: <#Binding<Int>#>, showAlert: <#Binding<Bool>#>, alertTitle: <#Binding<String>#>, alertMessage: <#Binding<String>#>)
//}
