//
//  QuizModel.swift
//  Quiz
//
//  Created by Linda Guo on 2024/2/3.
//

import Foundation

struct QuizModel{
    var title : String?
    var option: [String]
    var answer: Int?
}

var myQuiz : [QuizModel] = [
    QuizModel(
        title: "Which movie won the Academy Award for Best Picture in 1994?",
        option: ["Pulp Fiction","The Shawshank Redemption","Forrest Gump","Schindler's List"],
        answer: 2),
    QuizModel(
        title: "Who directed the movie 'Inception'?",
        option: ["Christopher Nolan","Steven Spielberg","Martin Scorsese","Quentin Tarantino"],
        answer: 0),
    QuizModel(
        title: "Which actor played the lead role in the 'Matrix' trilogy?",
        option: ["Brad Pitt","Tom Cruise","Keanu Reeves","Leonardo DiCaprio"],
        answer: 2),
    QuizModel(
        title: "Which movie features a character named 'Hannibal Lecter'?",
        option: ["The Silence of the Lambs","Se7en","Fight Club","The Godfather"],
        answer: 0),
    QuizModel(
        title: "Who directed the movie 'Avatar'?",
        option: ["James Cameron","Christopher Nolan","Steven Spielberg","Peter Jackson"],
        answer: 0),
    QuizModel(
        title: "Which movie is based on a Marvel Comics superhero?",
        option: ["Jurassic Park","Harry Potter","The Lord of the Rings","Iron Man"],
        answer: 3),
    QuizModel(
        title: "Which movie features the famous line 'May the Force be with you'?",
        option: ["Star Trek","Star Wars","The Terminator","Blade Runner"],
        answer: 1),
    QuizModel(
        title: "Which actor played 'Batman' in the movie 'The Dark Knight'?",
        option: ["Christian Bale","Robert Downey Jr.","Hugh Jackman","Ryan Reynolds"],
        answer: 0),
    QuizModel(
        title: "Who directed the movie 'Forrest Gump'?",
        option: ["Steven Spielberg","Christopher Nolan","Quentin Tarantino","Martin Scorsese"],
        answer: 0),
    QuizModel(
        title: "Which movie won the Academy Award for Best Picture in 2020?",
        option: ["Joker","1917","Parasite","The Shape of Water"],
        answer: 2)
    
]
