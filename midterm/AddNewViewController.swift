//
//  AddNewViewController.swift
//  midterm
//
//  Created by Max Kai on 2020/11/20.
//

import UIKit



class AddNewViewController: UIViewController {
    
    let dataModle = DataModle()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUi()
    }
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    func setUi() {
        contentTextView.layer.borderWidth = 1
        contentTextView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func sendButton(_ sender: Any) {
        if titleTextField.text == "" || categoryTextField.text == "" || contentTextView.text == "" {
            let alert = UIAlertController(title: "錯誤！", message: "欄位不得為空", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            dataModle.addData(title: titleTextField.text!, category: categoryTextField.text!, content: contentTextView.text)
            print("新增資料成功")
        }
        dataModle.readData()
        navigationController?.popViewController(animated: true)
    }
}
