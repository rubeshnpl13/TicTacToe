//
//  ContentView.swift
//  TicTacToe_2.0
//
//  Created by Nishanta Nepal on 15/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var gameState = GameState()
    
    var body: some View {
        let borderSize = CGFloat(5)
        
        Text(gameState.turnText()).font(.title)
            .bold().padding()
        Spacer()
        
        Text(String(format: "X Score: %d", gameState.crossScore)).font(.title)
            .bold().padding()
        Spacer()
        
        
        VStack(spacing : borderSize ){
            ForEach(0...2, id: \.self)
            {
                row in
                HStack(spacing: borderSize){
                    ForEach(0...2, id: \.self)
                    {
                        column in
                        let cell = gameState.board[row][column]
                        Text(cell.displayTile()).font(.system(size: 60))
                            .foregroundColor(cell.tileColor())
                            .bold().frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white)
                            .onTapGesture {
                                gameState.placeTile(row, column)
                            }
                    }
                }
            }
        }.background(Color.black)
            .padding()
            .alert(isPresented: $gameState.showAlert) {
                Alert(
                    title: Text(gameState.alertMessage), // Corrected line
                    dismissButton: .default(Text("Okay")) {
                        gameState.resetBoard()
                    }
                )
            }
        Text(String(format: "O Score: %d", gameState.zeroScore)).font(.title)
            .bold().padding()
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
