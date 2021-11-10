//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by Yasuo Niihori on 2021/11/06.


import UIKit

class ViewController: UIViewController {
    
    @IBAction func goNext(_ sender: Any) {
        
        // ①storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // ②遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "Create") as! CreateViewController
        
        // ③画面遷移
        self.present(nextView, animated: true, completion: nil)
    }
    
    @IBOutlet weak var questionLabel: UILabel!
    
    var currentQuestionNum: Int = 0
    var questions: [[String: Any]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "add") != nil{
            questions = userDefaults.object(forKey: "add") as! [[String: Any]]
        }
        showQuestion()
    }
    
    @IBAction func tappedNoButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    
    func showQuestion() {
        if questions.isEmpty == true {
            questionLabel.text = "問題がありません。作成してください"
        } else {
            let question = questions[currentQuestionNum]
            
            if let que = question["question"] as? String {
                questionLabel.text = que
            }
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    func checkAnswer(yourAnswer: Bool) {
        if questions.isEmpty == true {
            
        } else {
            let question = questions[currentQuestionNum]
            
            if let ans = question["answer"] as? Bool {
                if yourAnswer == ans {
                    currentQuestionNum += 1
                    showAlert(message: "正解！")
                } else {
                    showAlert(message: "不正解…")
                }
            } else {
                print("答えが入ってません")
                return
            }
            
            if currentQuestionNum >= questions.count {
                currentQuestionNum = 0
            }
            
            showQuestion()
        }
    }
    
}

