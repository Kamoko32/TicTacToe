//
//  gameViewController.swift
//  TicTacToe
//
//  Created by Kamil Gucik on 24/06/2020.
//  Copyright © 2020 Kamil Gucik. All rights reserved.
//

import Foundation
import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet private var button1: UIButton!
    @IBOutlet private var button2: UIButton!
    @IBOutlet private var button3: UIButton!
    @IBOutlet private var button4: UIButton!
    @IBOutlet private var button5: UIButton!
    @IBOutlet private var button6: UIButton!
    @IBOutlet private var button7: UIButton!
    @IBOutlet private var button8: UIButton!
    @IBOutlet private var button9: UIButton!
    
    
    @IBOutlet var gameButtons: [UIButton]! {
        didSet {
            gameButtons.forEach { (button) in
                button.layer.cornerRadius = 10
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moves = ["X","O","X","O","X","O","X","O","X"]
    }
    
    var firstH = [String]()
    var secondH = [String]()
    var thirdH = [String]()

    var firstV = [String]()
    var secondV = [String]()
    var thirdV = [String]()

    var upCLeftToLCRight = [String]()
    var lowCLeftToUCRight = [String]()
    
    var allLines = [[String]]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = .systemPurple
        updateView()
    }
    
    private func updateView() {
        allLines = []
        self.allLines.append(contentsOf: [firstH,secondH,thirdH,firstV,secondV,thirdV,upCLeftToLCRight,lowCLeftToUCRight])
    }
    
    var moves = [String]()
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
            if sender.titleLabel?.text == nil && !moves.isEmpty {
            sender.setTitle(moves.first, for: UIControl.State.normal)
            moves.removeFirst()
                print(moves)
                if let title = sender.titleLabel?.text {
                    switch sender.tag {
                    case 1:
                        firstH.append(title)
                        firstV.append(title)
                        upCLeftToLCRight.append(title)
                    case 2:
                        firstH.append(title)
                        secondV.append(title)
                    case 3:
                        firstH.append(title)
                        thirdV.append(title)
                        lowCLeftToUCRight.append(title)
                    case 4:
                        secondH.append(title)
                        firstV.append(title)
                    case 5:
                        secondH.append(title)
                        secondV.append(title)
                        upCLeftToLCRight.append(title)
                        lowCLeftToUCRight.append(title)
                    case 6:
                        secondH.append(title)
                        thirdV.append(title)
                    case 7:
                        thirdH.append(title)
                        firstV.append(title)
                        lowCLeftToUCRight.append(title)
                    case 8:
                        thirdH.append(title)
                        secondV.append(title)
                    case 9:
                        thirdH.append(title)
                        thirdV.append(title)
                        upCLeftToLCRight.append(title)
                    default:
                        return
                    }
                }
                updateView()
                checkIfWon()
        }
    }
    
    private func newGame() {
        
        gameButtons.forEach { (button) in
            button.titleLabel?.text = nil
            button.setTitle(nil, for: UIControl.State.normal)
        }
        moves.removeAll()
        viewDidLoad()
        
        firstH.removeAll()
        secondH.removeAll()
        thirdH.removeAll()

        firstV.removeAll()
        secondV.removeAll()
        thirdV.removeAll()

        upCLeftToLCRight.removeAll()
        lowCLeftToUCRight.removeAll()
        updateView()
    }
    
    private func checkIfWon() {
        for line in allLines {
            if line.count == 3 {
                let allItemsEqual = line.dropLast().allSatisfy { $0 == line.last }
                if allItemsEqual {
                    let alert = UIAlertController(title: "\(line[0]) has won !", message: "", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Again", style: UIAlertAction.Style.default, handler: { action in
                        self.newGame()
                    }))
                    alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { action in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                if moves.isEmpty && !allItemsEqual {
                    let alert = UIAlertController(title: "Try again", message: "", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { action in
                        self.newGame()
                    }))
                    alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { action in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}

