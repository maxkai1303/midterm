//
//  ViewController.swift
//  midterm
//
//  Created by Max Kai on 2020/11/19.
//

import UIKit
import FirebaseFirestore


class ViewController: UIViewController {
    
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        add()
//        dele()

    }
    
    
    func add() {
        let aaa = db.collection("hello").document("world")
        aaa.setData(["msg":"Good night"]) { (error) in
            print("Success!")
            if let error = error {
                print("=======Oops!!!!!!\(error)=============")
            }
            
        }
    }
    
    func dele() {
        db.collection("hello").document("world").delete() {
            (error) in
            if let error = error {
                print("=======Oops!!!!!!\(error)=============")
            }
        }
    }
    
    
}

