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


#Preview {
    ContentView()
}
