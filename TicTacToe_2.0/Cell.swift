//
//  Cell.swift
//  TicTacToe_2.0
//
//  Created by Nishanta Nepal on 15/05/2023.
//

import Foundation
import SwiftUI

struct Cell{
    var tile:Tile
    
    func displayTile() -> String{
        switch(tile)
        {
        case Tile.Zero:
            return "0"
        case Tile.Cross:
            return "X"
        default:
            return ""
        }
    }
    
    func tileColor() -> Color
    {
        switch(tile)
        {
        case Tile.Zero:
            return Color.green
        case Tile.Cross:
            return Color.black
        default:
            return Color.black
        }
    }
}
enum Tile{
    case Zero
    case Cross
    case Empty
}
