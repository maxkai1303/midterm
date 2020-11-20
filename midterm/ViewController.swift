//
//  ViewController.swift
//  midterm
//
//  Created by Max Kai on 2020/11/19.
//

import UIKit
import FirebaseFirestore
import EasyRefresher


class ViewController: UIViewController, UITableViewDelegate {
    
    var db: Firestore!
    let yellow = UIColor(red: 255/255, green: 218/255, blue: 119/255, alpha: 1)
    
    @IBOutlet weak var publishButton: UIButton!
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        // 換 navigationBar顏色
        self.navigationController?.navigationBar.backgroundColor = .yellow
        // 下拉更新
        mainTableView.refresh.header.addRefreshClosure {
            self.readData()
            self.mainTableView.refresh.header.endRefreshing()
        }
        publishButton.layer.cornerRadius = 35
        
    }
    

    func addData() {
        let articles = Firestore.firestore().collection("articles")
        let document = articles.document()
        
        let data:[String: Any] = [
            "author": [
                "email": "wayne@school.appworks.tw"
                ],
            "title": "IU「亂穿」竟美出新境界!笑稱自己品味奇怪 網笑:靠顏值撐住女神氣場​",
            "content": "南​韓歌手IU(李知恩)無論在歌唱方面或是近期的戲劇作品都有亮眼的成績，但俗話說人無完美、美玉微瑕，曾再跟工作人員的互動影片中坦言自己品味很奇怪，近日在IG上分享了宛如「媽媽們青春時代的玉女歌手」超復古穿搭造型，卻意外美出新境界。",
            "createdTime": NSDate().timeIntervalSince1970,
            "id": document.documentID,
            "category": "Beauty"
            ]
        document.setData(data)
    }
    
//    func add() {
//        let aaa = db.collection("hello").document("world")
//        aaa.setData(["msg":"Good night"]) { (error) in
//            print("Success!")
//            if let error = error {
//                print("=======Oops!!!!!!\(error)=============")
//            }
//
//        }
//    }
    
    
    func readData() {
        db.collection("articles").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
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

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableViewCell", for: indexPath) as! MainTableViewCell
        return cell
    }
    
    
}

