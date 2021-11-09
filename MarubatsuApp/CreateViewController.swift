
//
//  CreateViewController.swift
//  MarubatsuApp
//
//  Created by o.yuki on 2021/11/07.
//
import UIKit

class CreateViewController: UIViewController {
    @IBOutlet weak var addQuestionTextField: UITextField!
    @IBOutlet weak var isAnswerControl: UISegmentedControl!
    var questions: [[String: Any]] = []
    var isAnswer: Bool!
    let userDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "add") != nil{
            questions = userDefaults.object(forKey: "add") as! [[String: Any]]
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        // ①storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // ②遷移先ViewControllerのインスタンス取得
        let exView = storyboard.instantiateViewController(withIdentifier: "View") as! ViewController
        
        // ③画面遷移
        self.present(exView, animated: true, completion: nil)
//        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if addQuestionTextField.text! != "" {
            if isAnswerControl.selectedSegmentIndex == 0 {
                isAnswer = false
            } else {
                isAnswer = true
            }
            questions.append(["question":"\(addQuestionTextField.text!)", "answer": isAnswer])
            userDefaults.set(questions, forKey: "add")
            Alert().showAlert(title: "問題を保存", message: "保存に成功しました", viewController: self)
            addQuestionTextField.text = ""
        } else {
            Alert().showAlert(title: "未入力", message: "問題文を入力してください", viewController: self)
        }
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        let userDefautls = UserDefaults.standard
        questions = []
        userDefautls.set(questions, forKey: "add")
        Alert().showAlert(title: "全問題を消去", message: "問題をすべて削除しました", viewController: self)
    }
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
