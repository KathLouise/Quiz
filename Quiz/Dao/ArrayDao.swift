//
//  ArrayDao.swift
//  Quiz
//
//  Created by Katheryne Graf on 07/04/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import Foundation

class ArrayDao{
    /*popula o array de questões
     q = questão
     0,1,2,3,4,5 = numero da questão
     a = alternativa
     0,1,2,3 = numero da alternativa
    */
    func populateArray() -> [Question]{
        var questions: [Question]
        
        let q0a0 = Answer(answer: "França", isCorrect: false)
        let q0a1 = Answer(answer: "Inglaterra", isCorrect: false)
        let q0a2 = Answer(answer: "Brasil", isCorrect: true)
        let q0a3 = Answer(answer: "Austrália", isCorrect: false)
        let q0 = Question(questionLabel: "De onde é a invenção do chuveiro elétrico?", questionImageName: "chuveiro", answers: [q0a0,q0a1,q0a2,q0a3])
    
        let q1a0 = Answer(answer: "Vaticano e Rússia", isCorrect: true)
        let q1a1 = Answer(answer: "Nauru e China", isCorrect: false)
        let q1a2 = Answer(answer: "Mônaco e Canadá", isCorrect: false)
        let q1a3 = Answer(answer: "Malta e Estados Unidos", isCorrect: false)
        let q1 = Question(questionLabel: "Quais o menor e o maior país do mundo?", questionImageName: "mapamundi", answers: [q1a0,q1a1,q1a2,q1a3])
    
        let q2a0 = Answer(answer: "113", isCorrect: false)
        let q2a1 = Answer(answer: "109", isCorrect: false)
        let q2a2 = Answer(answer: "108", isCorrect: false)
        let q2a3 = Answer(answer: "118", isCorrect: true)
        let q2 = Question(questionLabel: "Atualmente, quantos elementos químicos a tabela periódica possui?", questionImageName: "tabelaperiodica", answers: [q2a0,q2a1,q2a2,q2a3])
    
        let q3a0 = Answer(answer: "10", isCorrect: false)
        let q3a1 = Answer(answer: "11", isCorrect: false)
        let q3a2 = Answer(answer: "5", isCorrect: false)
        let q3a3 = Answer(answer: "7", isCorrect: true)
        let q3 = Question(questionLabel: "Qual o número mínimo de jogadores numa partida de futebol?", questionImageName: "futebol", answers: [q3a0,q3a1,q3a2,q3a3])
    
        let q4a0 = Answer(answer: "Paul Cézanne", isCorrect: false)
        let q4a1 = Answer(answer: "Pablo Picasso", isCorrect: true)
        let q4a2 = Answer(answer: "Diego Rivera", isCorrect: false)
        let q4a3 = Answer(answer: "Tarsila do Amaral", isCorrect: false)
        let q4 = Question(questionLabel: "Quem pintou Guernica?", questionImageName: "guernika", answers: [q4a0,q4a1,q4a2,q4a3])
    
        let q5a0 = Answer(answer: "8 minutos", isCorrect: false)
        let q5a1 = Answer(answer: "1 dia", isCorrect: false)
        let q5a2 = Answer(answer: "12 horas", isCorrect: false)
        let q5a3 = Answer(answer: "12 minutos", isCorrect: true)
        let q5 = Question(questionLabel: "Quanto tempo a luz do Sol demora para chegar à Terra?", questionImageName: "solterra", answers: [q5a0,q5a1,q5a2,q5a3])
    
        questions = [q0, q1, q2, q3, q4, q5]
        return questions
    }
}
