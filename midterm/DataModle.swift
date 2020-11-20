//
//  DataModle.swift
//  midterm
//
//  Created by Max Kai on 2020/11/20.
//

import Foundation
import FirebaseFirestore

class DataModle {
    
    var db = Firestore.firestore()
    
    let timestamp = Date().toMillis()

    var saveTitle: String = ""
    var saveName: Any?
    var saveCategort: String = ""
    var saveContent: String = ""
    var saveTime = FirebaseFirestore.FieldValue.serverTimestamp()
    
    var passEmail: String = ""
    var passId: String = ""
    var passName: String = ""
    
    
    func addData(title: String, category: String, content: String) {
        let articles = Firestore.firestore().collection("articles")
        let document = articles.document()
        guard passEmail != "" && passId != "" && passName != ""  else { return }
        let data:[String: Any] = [
            "author": [
                "email": passEmail,
                "id": passId,
                "name": passName
            ],
            "title": title,
            "content": content,
            "createdTime": FirebaseFirestore.FieldValue.serverTimestamp(),
            "id": document.documentID,
            "category": category
        ]
        document.setData(data)
    }
    
    func listen() {
        db.collection("articles").addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            let friendWhoSend = document.documentChanges.map {$0.document.data()}
            print("資料有變動：\(friendWhoSend)")
        }
    }
    
    func readData() {
        db.collection("articles").getDocuments() { [self] querySnapshot, err in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    saveTitle = document.data()["title"] as! String
                    saveCategort = document.data()["category"] as! String
                    saveContent = document.data()["content"] as! String
//                    saveTime = document.data()["createdTime"] as!
//                    saveName = document.data()["author"]["name"] as! String
                }
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
