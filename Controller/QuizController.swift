//
//  QuizController.swift
//  Quiz
//
//  Created by Linda Guo on 2024/2/3.
//

import Foundation
import UIKit

class Quiz: ObservableObject{
    @Published var score = 0
    @Published var index = 0
    @Published var status = 0
    var buttonColors = [[UIColor]](repeating: [UIColor](repeating: UIColor.systemMint, count: 4), count: myQuiz.count)

    
    func isTrue(n : Int){
        if(status == 0){
            if(myQuiz[index].answer == n){
                score = score + 1
                status = 1
            }else{
                status = 2
            }
        }
        //        index = index + 1
    }
    
    
    func reset(){
        score = 0
        index = 0
        status = 0
        buttonColors = [[UIColor]](repeating: [UIColor](repeating: UIColor.systemMint, count: 4), count: myQuiz.count)
    }
    
    func allAnswered() -> Bool {
        return index >= myQuiz.count - 1
    }
    
    func optionButtonTapped(tag: Int) {
        if status == 0 {
            isTrue(n: tag)
            updateButtonColorAndSave(tag: tag)
        }
    }

    func updateButtonColorAndSave(tag: Int) {
        if status == 1 {
            buttonColors[index][tag - 100] = UIColor.green
        } else if status == 2{
            buttonColors[index][tag - 100] = UIColor.red
        } else {
            buttonColors[index][tag - 100] = UIColor.systemMint
        }
        buttonColors.append(contentsOf: self.buttonColors)
    }
    
}
