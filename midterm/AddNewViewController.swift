//
//  AddNewViewController.swift
//  midterm
//
//  Created by Max Kai on 2020/11/20.
//

import UIKit


class AddNewViewController: UIViewController {

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
    
}
