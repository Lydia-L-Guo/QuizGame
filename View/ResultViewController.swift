//
//  ResultViewController.swift
//  QuizGame
//
//  Created by Linda Guo on 2024/2/7.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    var thisQuiz = Quiz()
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        self.navigationItem.setHidesBackButton(true, animated:true)
        view.backgroundColor = .white
        
        let scoreLabel = UILabel()
        scoreLabel.text = "Score: \(score) / \(myQuiz.count)"
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 36)
        scoreLabel.textAlignment = .center
        view.addSubview(scoreLabel)
        
        let playAgainButton = UIButton(type: .system)
        playAgainButton.setTitle("PLAY AGAIN", for: .normal)
        playAgainButton.setTitleColor(.black, for: .normal)
        playAgainButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        playAgainButton.backgroundColor = UIColor.systemMint
        playAgainButton.layer.cornerRadius = 10
        playAgainButton.layer.borderWidth = 2
        playAgainButton.layer.borderColor = UIColor.gray.cgColor
        playAgainButton.addTarget(self, action: #selector(playAgainButtonTapped), for: .touchUpInside)
        view.addSubview(playAgainButton)
        
        //constraint
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        playAgainButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scoreLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            playAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playAgainButton.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 20),
            playAgainButton.widthAnchor.constraint(equalToConstant: 200),
            playAgainButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @IBAction func playAgainButtonTapped(_ sender: UIButton) {
        thisQuiz.reset()
        thisQuiz = Quiz()
        dismiss(animated: true, completion: nil)
        self.navigationController?.popToRootViewController(animated: true)
    }
}
