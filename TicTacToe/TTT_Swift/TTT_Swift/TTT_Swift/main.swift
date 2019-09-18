//
//  main.swift
//  TTT_Swift
//
//  Created by Currie, Nicholas R on 9/26/18.
//  Copyright © 2018 Currie, Nicholas R. All rights reserved.
//

import Foundation

var mBoard: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
let BOARD_SIZE = 9

let HUMAN_PLAYER = "X"
let COMPUTER_PLAYER = "O"

var turn = HUMAN_PLAYER
var win = 0
var move = -1

func displayBoard()
{
    print()
    print(mBoard[0] + " | " + mBoard[1] + " | " + mBoard[2])
    print("-----------")
    print(mBoard[3] + " | " + mBoard[4] + " | " + mBoard[5])
    print("-----------")
    print(mBoard[6] + " | " + mBoard[7] + " | " + mBoard[8])
    print()
}

func getUserMove()
{
    move = -1
    while(move == -1)
    {
        print("Enter your move: ")
        let strMove = readLine()!
        print ("Here is your move: " + strMove)
        switch(strMove)
        {
        case "1":
            
            move = 1
            break;
            
        case "2":
            
            move = 2
            break;
            
        case "3":
            
            move = 3
            break;
            
        case "4":
            
            move = 4
            break;
            
        case "5":
            
            move = 5
            break;
            
        case "6":
            
            move = 6
            break;
            
        case "7":
            
            move = 7
            break;
            
        case "8":
            
            move = 8
            break;
            
        case "9":
            
            move = 9
            break;
            
        default:
            break
            
        } // end of bad input loop
        
        while(move < 1 || move > BOARD_SIZE || mBoard[move - 1] == HUMAN_PLAYER || mBoard[move - 1] == COMPUTER_PLAYER)
        {
            if(move < 1 || move > BOARD_SIZE)
            {
                print("Please enter a move between 1 and " + String(BOARD_SIZE) + ".")
            }
            else
            {
                print("That space is occupied. Select another space.")
            }

            print("Enter your move: ")
            let strMove = readLine()!
            switch(strMove)
            {
                case "1":
                    move = 1
                    break;
                case "2":
                    move = 2
                    break;
                case "3":
                    move = 3
                    break;
                case "4":
                    move = 4
                    break;
                case "5":
                    move = 5
                    break;
                case "6":
                    move = 6
                    break;
                case "7":
                    move = 7
                    break;
                case "8":
                    move = 8
                    break;
                case "9":
                    move = 9
                    break;
                default:
                break
            }
        }
        
    }
}

func checkForWinner()
{
    
    // Check horizontal wins
    for i in stride(from:0, through:6, by:3)
    {
        if (mBoard[i] == HUMAN_PLAYER &&
            mBoard[i+1] == HUMAN_PLAYER &&
            mBoard[i+2] == HUMAN_PLAYER)
        {
            win = 2
            return
        }
        if (mBoard[i] == COMPUTER_PLAYER &&
            mBoard[i+1] == COMPUTER_PLAYER &&
            mBoard[i+2] == COMPUTER_PLAYER)
        {
            win = 3
            return
        }
    }
    
    // Check vertical wins
    for i  in 0 ... 2
    {
        if (mBoard[i] == HUMAN_PLAYER &&
            mBoard[i+3] == HUMAN_PLAYER &&
            mBoard[i+6] == HUMAN_PLAYER)
        {
            win = 2
            return
        }
        
        if (mBoard[i] == COMPUTER_PLAYER &&
            mBoard[i+3] == COMPUTER_PLAYER &&
            mBoard[i+6] == COMPUTER_PLAYER)
        {
            win = 3
            return
        }
    }
    
    // Check for diagonal wins
    if ((mBoard[0] == HUMAN_PLAYER &&
        mBoard[4] == HUMAN_PLAYER &&
        mBoard[8] == HUMAN_PLAYER) ||
        (mBoard[2] == HUMAN_PLAYER &&
            mBoard[4] == HUMAN_PLAYER &&
            mBoard[6] == HUMAN_PLAYER))
    {
        win = 2
        return
    }
    if ((mBoard[0] == COMPUTER_PLAYER &&
        mBoard[4] == COMPUTER_PLAYER &&
        mBoard[8] == COMPUTER_PLAYER) ||
        (mBoard[2] == COMPUTER_PLAYER &&
            mBoard[4] == COMPUTER_PLAYER &&
            mBoard[6] == COMPUTER_PLAYER))
    {
        win = 3
        return
    }
    
    // Check for tie
    for i in 0 ... BOARD_SIZE - 1
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


func getComputerMove()
{
    
    // First see if there's a move O can make to win
    for i in 0 ... BOARD_SIZE - 1
    {
        if (mBoard[i] != HUMAN_PLAYER && mBoard[i] != COMPUTER_PLAYER) {
            let curr = mBoard[i];
            mBoard[i] = COMPUTER_PLAYER;
            checkForWinner()
            if(win == 3)
            {
                print("Computer is moving to " + String((i + 1)))
                return
            }
            else
            {
                mBoard[i] = curr;
            }
        }
    }
    
    // See if there's a move O can make to block X from winning
    for i in 0 ... BOARD_SIZE - 1
    {
        if (mBoard[i] != HUMAN_PLAYER && mBoard[i] != COMPUTER_PLAYER) {
            let curr = mBoard[i];   // Save the current number
            mBoard[i] = HUMAN_PLAYER;
            checkForWinner()
            if(win == 2)
            {
                mBoard[i] = COMPUTER_PLAYER;
                print("Computer is moving to " + String((i + 1)));
                return;
            }
            else
            {
                mBoard[i] = curr;
            }
        }
    }
    
    // Generate random move
    repeat
    {
        move = Int(arc4random_uniform(9))
        print ("Random move is " + String(move))
    }
    while (mBoard[move] == HUMAN_PLAYER || mBoard[move] == COMPUTER_PLAYER)
    print("Computer is moving to " + String(move + 1));
    mBoard[move] = COMPUTER_PLAYER;
}
// GAME LOOP

while(win == 0)
{
    displayBoard()
    if(turn == HUMAN_PLAYER)
    {
        getUserMove()
        turn = COMPUTER_PLAYER
    }
    else
    {
        print ("I am computer")
        getComputerMove()
        turn = HUMAN_PLAYER
    }
    checkForWinner()
    print("Win =" + String(win))
    if(win == 3)
    {
        print("Computer Wins")
    }
    if(win == 2)
    {
        print("You Win")
    }
    if(win == 1)
    {
        print("It's a Tie")
    }
}




