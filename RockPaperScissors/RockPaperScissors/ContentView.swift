import SwiftUI

struct ContentView: View {
    var gameArray = ["rock", "paper", "scissor"]
    @State private var score = 0
    @State private var noOfTurn = 0
    @State private var correctAnswer = 0
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false

    var body: some View {
        VStack(spacing: 0) {
            GameHeaderView(noOfTurn: noOfTurn, gameArray: gameArray, correctAnswer: correctAnswer)
            
            GameSelectionView(gameArray: gameArray, score: $score, noOfTurn: $noOfTurn, correctAnswer: $correctAnswer, showAlert: $showAlert, alertTitle: $alertTitle, alertMessage: $alertMessage)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text(alertTitle),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
        }
        .ignoresSafeArea()
    }
}

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

#Preview {
    ContentView()
}
