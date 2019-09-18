//
//  ViewController.swift
//  TicTacToe
//
//  Created by Currie, Nicholas R on 9/19/18.
//  Copyright © 2018 Currie, Nicholas R. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
    var mBoard: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let BOARD_SIZE = 9
    var mBoardArray: [UIImageView] = []
    
    let HUMAN_PLAYER = "X"
    let COMPUTER_PLAYER = "O"
    var turn = "X"
    
    
    var wait = 0
    var win = 0
    var move = -1
    var gameDifficulty: Int!
    
    var xMove: AVAudioPlayer!
    var oMove: AVAudioPlayer!
    
    
    @IBOutlet weak var s1: UIImageView!
    @IBOutlet weak var s2: UIImageView!
    @IBOutlet weak var s3: UIImageView!
    @IBOutlet weak var s4: UIImageView!
    @IBOutlet weak var s5: UIImageView!
    @IBOutlet weak var s6: UIImageView!
    @IBOutlet weak var s7: UIImageView!
    @IBOutlet weak var s8: UIImageView!
    @IBOutlet weak var s9: UIImageView!
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBAction func newGame(_ sender: Any)
    {
        self.s1.image = nil
        self.s2.image = nil
        self.s3.image = nil
        self.s4.image = nil
        self.s5.image = nil
        self.s6.image = nil
        self.s7.image = nil
        self.s8.image = nil
        self.s9.image = nil
        self.reenableButtons()
        self.turn = HUMAN_PLAYER
        self.mBoard = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        infoLabel.text = "Human's Turn"
        self.wait = 0
        self.win = 0
    }
    
    @IBAction func gameSettings(_ sender: Any)
    {
        let easy = "Easy"
        let medium = "Medium"
        let hard = "Hard"
        
        let ac = UIAlertController(title: "Game Settings", message: "Select the Difficulty Level", preferredStyle: .actionSheet)
        
        let easyAction = UIAlertAction(title: easy, style: .default, handler: { action in self.setDifficulty(difficulty: 1)})
        
        ac.addAction(easyAction)
        
        let mediumAction = UIAlertAction(title: medium, style: .default, handler: { action in self.setDifficulty(difficulty: 2)})
        
        ac.addAction(mediumAction)
        
        let hardAction = UIAlertAction(title: hard, style: .default, handler: { action in self.setDifficulty(difficulty: 3)})
        
        ac.addAction(hardAction)
        
        present(ac, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mBoardArray.append(s1)
        mBoardArray.append(s2)
        mBoardArray.append(s3)
        mBoardArray.append(s4)
        mBoardArray.append(s5)
        mBoardArray.append(s6)
        mBoardArray.append(s7)
        mBoardArray.append(s8)
        mBoardArray.append(s9)
        
        gameDifficulty = 1
        
        infoLabel.text = "Human's Turn"
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img1Clicked))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img2Clicked))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img3Clicked))
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img4Clicked))
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img5Clicked))
        let tapGesture6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img6Clicked))
        let tapGesture7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img7Clicked))
        let tapGesture8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img8Clicked))
        let tapGesture9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.img9Clicked))
        
        tapGesture1.numberOfTapsRequired = 1
        s1.addGestureRecognizer(tapGesture1)
        tapGesture2.numberOfTapsRequired = 1
        s2.addGestureRecognizer(tapGesture2)
        tapGesture3.numberOfTapsRequired = 1
        s3.addGestureRecognizer(tapGesture3)
        tapGesture4.numberOfTapsRequired = 1
        s4.addGestureRecognizer(tapGesture4)
        tapGesture5.numberOfTapsRequired = 1
        s5.addGestureRecognizer(tapGesture5)
        tapGesture6.numberOfTapsRequired = 1
        s6.addGestureRecognizer(tapGesture6)
        tapGesture7.numberOfTapsRequired = 1
        s7.addGestureRecognizer(tapGesture7)
        tapGesture8.numberOfTapsRequired = 1
        s8.addGestureRecognizer(tapGesture8)
        tapGesture9.numberOfTapsRequired = 1
        s9.addGestureRecognizer(tapGesture9)
    }
    
    func setDifficulty(difficulty: Int)
    {
        var level: String
        gameDifficulty = difficulty
        switch difficulty
        {
            case 1:
                level = "Easy"
            case 2:
                level = "Medium"
            case 3:
                level = "Expert"
            default:
                level = "Easy"
        }
        print("TTT_ACTIVITY: Game Difficulty Level Now Set To: " + level)
    }
    
    // use an extra if statement to check that only allows method content to run only when the number gets switched in the computer turn part
    @objc func img1Clicked()
    {
        if(wait == 0)
        {
            self.wait = 1
            s1.isUserInteractionEnabled = false
            if(win == 0)
            {
                if(turn == HUMAN_PLAYER)
                {
                    s1.image = #imageLiteral(resourceName: "x_img.png")
                    mBoard[0] = HUMAN_PLAYER
                    playX()
                    checkForWinner()
                    self.turn = self.COMPUTER_PLAYER
                    infoLabel.text = "Computer's Turn"
                    displayBoard()
                }
                if(win == 0)
                {
                    prepareComputerTurn()
                }
                winnerText()
            }
        }
    }
    
    @objc func img2Clicked()
    {
        if(wait == 0)
        {
            self.wait = 1
            s2.isUserInteractionEnabled = false
            if(win == 0)
            {
                if(turn == HUMAN_PLAYER)
                {
                    s2.image = #imageLiteral(resourceName: "x_img.png")
                    mBoard[1] = HUMAN_PLAYER
                    playX()
                    checkForWinner()
                    self.turn = self.COMPUTER_PLAYER
                    infoLabel.text = "Computer's Turn"
                    displayBoard()
                }
                if(win == 0)
                {
                    prepareComputerTurn()
                }
                winnerText()
            }
        }
    }
    
    @objc func img3Clicked()
    {
        if(wait == 0)
        {
            self.wait = 1
            s3.isUserInteractionEnabled = false
            if(win == 0)
            {
                if(turn == HUMAN_PLAYER)
                {
                    s3.image = #imageLiteral(resourceName: "x_img.png")
                    mBoard[2] = HUMAN_PLAYER
                    playX()
                    checkForWinner()
                    self.turn = self.COMPUTER_PLAYER
                    infoLabel.text = "Computer's Turn"
                    displayBoard()
                }
                if(win == 0)
                {
                    prepareComputerTurn()
                }
                winnerText()
            }
        }
    }
    
    @objc func img4Clicked()
    {
        if(wait == 0)
        {
            self.wait = 1
            s4.isUserInteractionEnabled = false
            if(win == 0)
            {
                if(turn == HUMAN_PLAYER)
                {
                    s4.image = #imageLiteral(resourceName: "x_img.png")
                    mBoard[3] = HUMAN_PLAYER
                    playX()
                    checkForWinner()
                    self.turn = self.COMPUTER_PLAYER
                    infoLabel.text = "Computer's Turn"
                    displayBoard()
                }
                if(win == 0)
                {
                    prepareComputerTurn()
                }
                winnerText()

            }
        }
    }
    
    @objc func img5Clicked()
    {
        if(wait == 0)
        {
            self.wait = 1
            s5.isUserInteractionEnabled = false
            if(win == 0)
            {
                if(turn == HUMAN_PLAYER)
                {
                    s5.image = #imageLiteral(resourceName: "x_img.png")
                    mBoard[4] = HUMAN_PLAYER
                    playX()
                    checkForWinner()
                    self.turn = self.COMPUTER_PLAYER
                    infoLabel.text = "Computer's Turn"
                    displayBoard()
                }
                if(win == 0)
                {
                    prepareComputerTurn()
                }
                winnerText()
            }
        }
    }
    
    @objc func img6Clicked()
    {
        if(wait == 0)
        {
            self.wait = 1
            s6.isUserInteractionEnabled = false
            if(win == 0)
            {
                if(turn == HUMAN_PLAYER)
                {
                    s6.image = #imageLiteral(resourceName: "x_img.png")
                    mBoard[5] = HUMAN_PLAYER
                    playX()
                    checkForWinner()
                    self.turn = self.COMPUTER_PLAYER
                    infoLabel.text = "Computer's Turn"
                    displayBoard()
                }
                if(win == 0)
                {
                    prepareComputerTurn()
                }
                winnerText()

            }
        }
    }
    
    @objc func img7Clicked()
    {
        if(wait == 0)
        {
            self.wait = 1
            s7.isUserInteractionEnabled = false
            if(win == 0)
            {
                if(turn == HUMAN_PLAYER)
                {
                    s7.image = #imageLiteral(resourceName: "x_img.png")
                    mBoard[6] = HUMAN_PLAYER
                    playX()
                    checkForWinner()
                    self.turn = self.COMPUTER_PLAYER
                    infoLabel.text = "Computer's Turn"
                    displayBoard()
                }
                if(win == 0)
                {

                    wait = 1
                    prepareComputerTurn()
                }
                winnerText()
            }
        }
    }
    
    @objc func img8Clicked()
    {
        if(wait == 0)
        {
            self.wait = 1
            s8.isUserInteractionEnabled = false
            if(win == 0)
            {
                if(turn == HUMAN_PLAYER && s8.image != #imageLiteral(resourceName: "o_img.png"))
                {
                    s8.image = #imageLiteral(resourceName: "x_img.png")
                    mBoard[7] = HUMAN_PLAYER
                    playX()
                    checkForWinner()
                    self.turn = self.COMPUTER_PLAYER
                    infoLabel.text = "Computer's Turn"
                    displayBoard()
                }
                if(win == 0)
                {
                    prepareComputerTurn()
                }
                winnerText()
            }
        }
    }
    
    @objc func img9Clicked()
    {
        if(wait == 0)
        {
            self.wait = 1
            s9.isUserInteractionEnabled = false
            if(win == 0)
            {
            if(turn == HUMAN_PLAYER && s9.image != #imageLiteral(resourceName: "o_img.png"))
            {
                s9.image = #imageLiteral(resourceName: "x_img.png")
                mBoard[8] = HUMAN_PLAYER
                playX()
                checkForWinner()
                self.turn = self.COMPUTER_PLAYER
                infoLabel.text = "Computer's Turn"
                displayBoard()
            }
            if(win == 0)
            {
                prepareComputerTurn()
            }
                winnerText()
            }
        }
    }
    
    func prepareComputerTurn()
    {
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            if(self.gameDifficulty == 1)
            {
                self.getRandomMove()
            }
            
            if(self.gameDifficulty == 2)
            {
                if(self.getWinningMove() == true)
                {}
                else
                {
                    self.getRandomMove()
                }
            }
            if(self.gameDifficulty == 3)
            {
                if(self.getWinningMove() == true)
                {}
                else if(self.getBlockingMove() == true)
                {}
                else
                {
                    self.getRandomMove()
                }
            }
            
            self.checkForWinner()
            self.displayBoard()
            self.turn = self.HUMAN_PLAYER
            self.infoLabel.text = "Human's Turn"
            self.winnerText()
            self.wait = 0
        }
        
    }

    
    func getRandomMove()
    {
        repeat
        {
            checkForWinner()
            self.move  = Int(arc4random_uniform(9))
            print("random move is " + String(move))
        }
        while (mBoard[move] == HUMAN_PLAYER || mBoard[move] == COMPUTER_PLAYER)
        
        playO()
        print("Computer is moving to " + String((move + 1)))
        print("Random Move was made")
        mBoardArray[move].image =  #imageLiteral(resourceName: "o_img.png")
        mBoard[move] = COMPUTER_PLAYER
        self.win = 0
    }
    
    func getWinningMove() -> Bool
    {
        for i in 0 ... BOARD_SIZE-1
                {
                    if (mBoard[i] != HUMAN_PLAYER && mBoard[i] != COMPUTER_PLAYER)
                    {
                        let curr = mBoard[i]
                        self.mBoard[i] = COMPUTER_PLAYER
                        checkForWinner()
                        if (win == 3)
                        {
                            playO()
                            print("Computer is moving to " + String((i + 1)))
                            print("Winnning move was made")
                            mBoardArray[i].image = #imageLiteral(resourceName: "o_img.png")
                            return true
                        }
                        else
                        {
                            self.mBoard[i] = curr;
                            self.win = 0
                        }
                    }
                }
        return false
    }
    
    func getBlockingMove() -> Bool
    {
        for i in 0 ... BOARD_SIZE-1 {
            if (mBoard[i] != HUMAN_PLAYER && mBoard[i] != COMPUTER_PLAYER) {
                let curr = mBoard[i];   // Save the current number
                self.mBoard[i] = HUMAN_PLAYER
                checkForWinner()
                if (win == 2)
                {
                    self.mBoard[i] = COMPUTER_PLAYER;
                    self.mBoardArray[i].image =  #imageLiteral(resourceName: "o_img.png")
                    playO()
                    print("Computer is moving to " + String((i + 1)))
                    print("Blocking Move was made")
                    self.win = 0
                    return true
                }
                else
                {
                    self.mBoard[i] = curr
                    self.win = 0
                    
                }
            }
        }
        return false
    }

    func displayBoard(){
        print()
        print(mBoard[0] + " | " + mBoard[1] + " | " + mBoard[2])
        print("-----------")
        print(mBoard[3] + " | " + mBoard[4] + " | " + mBoard[5])
        print("-----------")
        print(mBoard[6] + " | " + mBoard[7] + " | " + mBoard[8])
        print()
    }
    
    
    func checkForWinner()
    {
        
        // Check horizontal wins
        for i in stride(from:0, through:6, by:3)
        {
            if (mBoard[i] == HUMAN_PLAYER && mBoard[i+1] == HUMAN_PLAYER && mBoard[i+2] == HUMAN_PLAYER)
            {
                win = 2
                return
            }
            
            if (mBoard[i] == COMPUTER_PLAYER && mBoard[i+1] == COMPUTER_PLAYER && mBoard[i+2] == COMPUTER_PLAYER)
            {
                win = 3
                return
                
            }
        }
        
        // Check vertical wins
        for i in 0 ... 2
        {
            if (mBoard[i] == HUMAN_PLAYER && mBoard[i+3] == HUMAN_PLAYER && mBoard[i+6] == HUMAN_PLAYER)
            {
                win = 2
                return
            }
            
            if (mBoard[i] == COMPUTER_PLAYER && mBoard[i+3] == COMPUTER_PLAYER && mBoard[i+6] == COMPUTER_PLAYER)
            {
                win =  3
                return
            }
        }
        
        // Check for diagonal wins
        if ((mBoard[0] == HUMAN_PLAYER && mBoard[4] == HUMAN_PLAYER && mBoard[8] == HUMAN_PLAYER) || (mBoard[2] == HUMAN_PLAYER && mBoard[4] == HUMAN_PLAYER && mBoard[6] == HUMAN_PLAYER))
        {
            win = 2
            return
        }
        
        if ((mBoard[0] == COMPUTER_PLAYER && mBoard[4] == COMPUTER_PLAYER && mBoard[8] == COMPUTER_PLAYER) || (mBoard[2] == COMPUTER_PLAYER && mBoard[4] == COMPUTER_PLAYER && mBoard[6] == COMPUTER_PLAYER))
        {
            win = 3
            return
        }
        
        // Check for tie
        for i in 0...BOARD_SIZE-1
        {
            // If we find a number, then no one has won yet
            if (mBoard[i] != HUMAN_PLAYER && mBoard[i] != COMPUTER_PLAYER)
            {
                win = 0
                return
            }
        }
        
        // If we make it through the previous loop, all places are taken, so it's a tie
        win = 1
    }
    
    
    func reenableButtons()
    {
        self.s1.isUserInteractionEnabled = true
        self.s2.isUserInteractionEnabled = true
        self.s3.isUserInteractionEnabled = true
        self.s4.isUserInteractionEnabled = true
        self.s5.isUserInteractionEnabled = true
        self.s6.isUserInteractionEnabled = true
        self.s7.isUserInteractionEnabled = true
        self.s8.isUserInteractionEnabled = true
        self.s9.isUserInteractionEnabled = true
    }
    

    func playX()
    {
        do{
            let path = Bundle.main.path(forResource: "sword.mp3", ofType:nil)!
            let urlx = URL(fileURLWithPath: path)
            let soundX = try AVAudioPlayer(contentsOf: urlx)
            xMove = soundX
            xMove.play()
        }
        catch
        {
            //Couldn't load file
        }
    }
    
    func playO()
    {
        do{
            let path = Bundle.main.path(forResource: "swish.mp3", ofType:nil)!
            let urlo = URL(fileURLWithPath: path)
            let soundO = try AVAudioPlayer(contentsOf: urlo)
            oMove = soundO
            oMove.play()
        }
        catch
        {
            //Couldn't load file
        }
    }
    
    func winnerText()
    {

        if(win == 1)
        {
            print("It's a Tie!")
            self.infoLabel.text = "It's a Tie!"
            GlobalVariables.sharedManager.tCount = GlobalVariables.sharedManager.tCount+1
            
        }
        if(win == 2)
        {
            print("Human Player Wins!")
            self.infoLabel.text = "Human Player Wins!"
            GlobalVariables.sharedManager.hCount = GlobalVariables.sharedManager.hCount+1
        }
        if(win == 3)
        {
            print("Computer Player Wins!")
            self.infoLabel.text = "Computer Player Wins!"
            GlobalVariables.sharedManager.cCount = GlobalVariables.sharedManager.cCount+1
            
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

