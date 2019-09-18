//
//  ScoreViewController.swift
//  TicTacToe
//
//  Created by Currie, Nicholas R on 10/29/18.
//  Copyright © 2018 Currie, Nicholas R. All rights reserved.
//

import UIKit
import AVFoundation

class ScoreViewController: UIViewController
{
    
    @IBOutlet weak var computerCount: UILabel!
    @IBOutlet weak var humanCount: UILabel!
    @IBOutlet weak var tieCount: UILabel!
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidLoad()
        computerCount.text = GlobalVariables.sharedManager.cCount.description
        tieCount.text = GlobalVariables.sharedManager.tCount.description
        humanCount.text = GlobalVariables.sharedManager.hCount.description
    }
    
    
    @IBAction func resetScores(_ sender: Any)
    {
        GlobalVariables.sharedManager.cCount = 0
        GlobalVariables.sharedManager.tCount = 0
        GlobalVariables.sharedManager.hCount = 0
        computerCount.text = GlobalVariables.sharedManager.cCount.description
        tieCount.text = GlobalVariables.sharedManager.tCount.description
        humanCount.text = GlobalVariables.sharedManager.hCount.description
    }
    
}
