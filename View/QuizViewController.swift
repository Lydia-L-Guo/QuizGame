//
//  QuizView.swift
//  QuizGame
//
//  Created by Linda Guo on 2024/2/6.
//

import Foundation
import UIKit

class QuizViewController: UIViewController {
    var thisQuiz = Quiz()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        //slide gestures
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
            swipeLeft.direction = .left
            view.addGestureRecognizer(swipeLeft)
            
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
            swipeRight.direction = .right
            view.addGestureRecognizer(swipeRight)
    }
    
    func setupViews() {
        self.navigationItem.setHidesBackButton(true, animated:true)
        //remove old views
        view.subviews.forEach { subview in
            if subview is UILabel || subview is UIButton {
                subview.removeFromSuperview()
            }
        }
        view.backgroundColor = .white
        // titleLabel: index / 10
        let titleLabel = UILabel()
        titleLabel.text = "\(thisQuiz.index + 1) / \(myQuiz.count)"
        titleLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)
        //constraint
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //questionLabel
        let questionLabel = UILabel()
        questionLabel.text = myQuiz[thisQuiz.index].title ?? ""
        questionLabel.font = UIFont.systemFont(ofSize: 24)
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 0
        view.addSubview(questionLabel)
        //constraint
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -400),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            questionLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let topAnchor = questionLabel.bottomAnchor
        var newTopAnchor = topAnchor
        
        //optionButton
        for (index, option) in myQuiz[thisQuiz.index].option.enumerated() {
            let optionButton = UIButton(type: .system)
            optionButton.tag = index + 100
            optionButton.titleLabel?.text = "Option_" + String(index)
            
            optionButton.setTitle(option, for: .normal)
            optionButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
            optionButton.setTitleColor(.black, for: .normal)
            optionButton.backgroundColor = thisQuiz.buttonColors[thisQuiz.index][index]
            optionButton.layer.cornerRadius = 10
            optionButton.layer.borderWidth = 2
            optionButton.layer.borderColor = UIColor.gray.cgColor
            optionButton.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
            view.addSubview(optionButton)
            //constraint
            optionButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                optionButton.topAnchor.constraint(equalTo: newTopAnchor, constant: -130),
                optionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                optionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                optionButton.heightAnchor.constraint(equalToConstant: 50)
            ])
            newTopAnchor = optionButton.bottomAnchor
        }
        
        let spacerView = UIView()
        view.addSubview(spacerView)
        //constraint
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spacerView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            spacerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            spacerView.widthAnchor.constraint(equalToConstant: 1),
            spacerView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        //backButton
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        backButton.setTitleColor(.black, for: .normal)
        backButton.backgroundColor = UIColor.yellow
        backButton.layer.cornerRadius = 8
        backButton.layer.borderWidth = 2
        backButton.layer.borderColor = UIColor.gray.cgColor
        
        backButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(backButton)
        //constraint
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            backButton.widthAnchor.constraint(equalToConstant: 80),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        //nextButton
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.backgroundColor = UIColor.yellow
        nextButton.layer.cornerRadius = 8
        nextButton.layer.borderWidth = 2
        nextButton.layer.borderColor = UIColor.gray.cgColor
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButton.widthAnchor.constraint(equalToConstant: 80),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
   
    @IBAction func optionButtonTapped(_ sender: UIButton) {
        thisQuiz.optionButtonTapped(tag: sender.tag)
        self.setupViews()
        disableOptionButtons()
        
    }
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        if thisQuiz.index > 0 {
            thisQuiz.index -= 1
            navigationController?.popViewController(animated: true)
        }
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        thisQuiz.status = 0
        if thisQuiz.index < myQuiz.count - 1 {
            thisQuiz.index += 1
            let nextQuizVC = QuizViewController()
            nextQuizVC.thisQuiz = thisQuiz
            navigationController?.pushViewController(nextQuizVC, animated: true)
        } else {
            let resultVC = ResultViewController()
            resultVC.score = thisQuiz.score
            thisQuiz.reset()
            navigationController?.pushViewController(resultVC, animated: true)
        }
    }
    func disableOptionButtons() {
        for subview in view.subviews {
            if let button = subview as? UIButton {
                if button.tag >= 100 {
                    button.isEnabled = false
                }
            }
        }
    }
    
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            nextButtonTapped(UIButton())
        } else if sender.direction == .right {
            backButtonTapped(UIButton())
        }
    }
    
}
