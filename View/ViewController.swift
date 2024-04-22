//
//  ViewController.swift
//  QuizGame
//
//  Created by Linda Guo on 2024/2/4.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    func setupView(){
        let startButton = UIButton(type: .system)
        startButton.setTitle("START", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        startButton.backgroundColor = UIColor.systemMint
        startButton.layer.cornerRadius = 10
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor.gray.cgColor
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
            let quizViewController = QuizViewController()
            navigationController?.pushViewController(quizViewController, animated: true)

        }
          
}

