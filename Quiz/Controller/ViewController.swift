//
//  ViewController.swift
//  Quiz
//
//  Created by Katheryne Graf on 07/04/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var alternative1: UIButton!
    @IBOutlet weak var alternative2: UIButton!
    @IBOutlet weak var alternative3: UIButton!
    @IBOutlet weak var alternative4: UIButton!
    
    @IBOutlet weak var feedbackView: UIView!
    @IBOutlet weak var feedbackTitleLabel: UILabel!
    @IBOutlet weak var feedbackButton: UIButton!
    
    var questions: [Question]!  //array de questoes
    var currentQuestion = 0     //questao atual
    var grade = 0.0             // pontuaçao do jogador
    var endedGame = false       //verifica se o jogo terminou ou nao
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = ArrayDao().populateArray()
        starQuiz()
        showQuestion(0)
    }
    
    //MARK - Funções que mexem com elementos da view
    
    /* Embaralha as questões e as alternativas
        seta as variaveis do jogo com os valores iniciais
     */
    func starQuiz(){
        questions.shuffle()
        for i in 0..<questions.count {
            questions[i].answers.shuffle()
        }
        
        currentQuestion = 0
        grade = 0.0
        endedGame = false
    }
    
    /*
     Atualiza a label, imagem e as alternativas para os valores da questão desejada
     */
    func showQuestion(_ index: Int){
        questionLabel.text = questions[index].questionLabel
        questionImage.image = questions[index].questionImage
        alternative1.setTitle(questions[index].answers[0].answer, for: UIControl.State())
        alternative2.setTitle(questions[index].answers[1].answer, for: UIControl.State())
        alternative3.setTitle(questions[index].answers[2].answer, for: UIControl.State())
        alternative4.setTitle(questions[index].answers[3].answer, for: UIControl.State())
    }
    
    /*
     Desabilita os botoes para o usuário nao possa clicar neles
     mostra o popup de feedback
     verifica se a resposta da alternativa escolhida é a correta ou não
     se for, mostra o feedback de acerto, caso contrario mostra o de erro
     verifica, em seguida se já foram respondidas todas as questoes
     se não foram mostra a proxima questão, caso contrario mostra a pontuação
     final do jogador
     */
    func selectAnswer(_ answer: Answer) {
        alternative1.isEnabled = false
        alternative2.isEnabled = false
        alternative3.isEnabled = false
        alternative4.isEnabled = false
        
        feedbackView.isHidden = false
        
        if answer.isCorrect == true{
            grade = grade + 1.0
            feedbackTitleLabel.text = "Parabéns! Você acertou.\n Sua pontuação é \(grade)"
        } else {
            
            feedbackTitleLabel.text = "Que pena! Sua resposta esta errada.\n Sua pontuação é \(grade)"
        }
        
        if(currentQuestion < questions.count){
            feedbackButton.setTitle("Próxima questão", for: UIControl.State())
        } else {
            feedbackButton.setTitle("Ver Pontuação", for: UIControl.State())
        }
    }
    
    /*
     Incrementa a variavel de questões, habilita os botoes de alternativas
     verifica se ainda existem questões para serem respondidas
     senão finaliza o jogo
     */
    func nextQuestion(){
        currentQuestion += 1
        alternative1.isEnabled = true
        alternative2.isEnabled = true
        alternative3.isEnabled = true
        alternative4.isEnabled = true
        
        if(currentQuestion < questions.count){
            showQuestion(currentQuestion)
        } else {
            endGame()
        }
    }
    
    /*
     Calcula a pontuação final do jogador e mostra o popup de feedback
     */
    func endGame(){
        grade = grade / Double(questions.count) * 100.0
        
        endedGame = true
        feedbackView.isHidden = false
        let formatGrade = String(format: "%.2f", grade)
        feedbackTitleLabel.text = "Sua pontuação final foi: \n" + formatGrade
        feedbackButton.setTitle("Refazer o Quiz", for: UIControl.State())
    }
    
    //Mark - Actions

    @IBAction func choose1(_ sender: Any) {
        let answer = questions[currentQuestion].answers[0]
        selectAnswer(answer)
    }
    
    @IBAction func choose2(_ sender: Any) {
        let answer = questions[currentQuestion].answers[1]
        selectAnswer(answer)
    }
    
    @IBAction func choose3(_ sender: Any) {
        let answer = questions[currentQuestion].answers[2]
        selectAnswer(answer)
    }
    
    @IBAction func choose4(_ sender: Any) {
        let answer = questions[currentQuestion].answers[3]
        selectAnswer(answer)
    }
    
    @IBAction func feedbackAction(_ sender: Any) {
        feedbackView.isHidden = true
        
        if(endedGame){
            starQuiz()
        } else {
            nextQuestion()
        }
    }
    
}

