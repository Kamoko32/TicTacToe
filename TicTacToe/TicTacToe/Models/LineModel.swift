//
//  LineModel.swift
//  TicTacToe
//
//  Created by Kamil Gucik on 24/06/2020.
//  Copyright © 2020 Kamil Gucik. All rights reserved.
//

import Foundation
import UIKit

class SingleLine {
    var isWinning: Bool
    var buttons: [UIButton]?
    
    init(button1: UIButton, button2: UIButton, button3: UIButton) {
        buttons?.append(contentsOf: [button1, button2, button3])
        isWinning = false
    }
}

class AllLines {
    var allLines: [SingleLine]?
    
    init(line1: SingleLine, line2: SingleLine, line3: SingleLine, line4: SingleLine, line5: SingleLine, line6: SingleLine, line7: SingleLine, line8: SingleLine) {
        allLines?.append(contentsOf: [line1, line2, line3, line4, line5, line6, line7, line8])
    }
}
