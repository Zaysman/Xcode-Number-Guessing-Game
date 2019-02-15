//
//  ViewController.swift
//  Number Guessing Game
//
//  Created by Isaiah X Smith on 2/14/19.
//  Copyright © 2019 Isaiah X Smith. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    let lowerbound = 1; //This is the lowest possible number to be guessed.
    let upperbound = 100; //This is the highest possible number to be guessed.
    var numberToGuess: Int! //This the number we attempt to guess.
    var numberOfGuesses = 0; //This variable tracks the number of guesses the user makes.
    
    
    
    @IBOutlet weak var guessLabel: UILabel!
    
    @IBOutlet weak var guessTextField: UITextField!
    
    
    
    override func viewDidLoad() { //This function calls all of the functions when the app loads.
        super.viewDidLoad()
        generateRandomNumber()
    }

    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100)) + 1;
        
    }

    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if let guess = guessTextField.text, let guessInt = Int(guess) {
            numberOfGuesses += 1
            validateGuess(guessInt)
        }
    }
    
    func validateGuess(_ guess: Int) { //_ guess makes it to where we don't always need to label the formal parameter repeatably.
        
        if guess < lowerbound || guess > upperbound {
            //Show an alert saying the user is out of bound.
            showBoundsAlert()
            
        } else if guess < numberToGuess { //Tells the user to go higher when they guess under the number
            guessLabel.text = "Go Higher! ⬆️"
        } else if guess > numberToGuess { //Tells the user to go lower when they guess above the number
            guessLabel.text = "Go Lower! ⬇️"
        } else {
            //Win has won, show win alert
            guessLabel.text = "Guess the Number"
            numberOfGuesses = 0;
            generateRandomNumber()
            showWinAlert()
        }
            guessTextField.text = ""
    
    }
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Hey", message: "Your Guess should be between 1 and 100.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showWinAlert(){
        let alert = UIAlertController(title: "Hey", message: "Your Guess was correct! 👏", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)    }
    
}

