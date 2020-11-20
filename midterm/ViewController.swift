//
//  ViewController.swift
//  midterm
//
//  Created by Max Kai on 2020/11/19.
//

import UIKit
import EasyRefresher
import FirebaseFirestore


class ViewController: UIViewController, UITableViewDelegate {
    
    let dataModle = DataModle()
    let yellow = UIColor(red: 255/255, green: 218/255, blue: 119/255, alpha: 1)
    var allData = [String]()
    var db = Firestore.firestore()
    
    
    @IBOutlet weak var publishButton: UIButton!
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataModle.readData()
        getCount()
        
        // 換 navigationBar顏色
        self.navigationController?.navigationBar.backgroundColor = .yellow
        // 下拉更新
        mainTableView.refresh.header.addRefreshClosure {
            self.dataModle.readData()
            self.mainTableView.refresh.header.endRefreshing()
            self.mainTableView.reloadData()
        }
        publishButton.layer.cornerRadius = 35

    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.dataModle.readData()
        self.mainTableView.reloadData()
        getCount()
    }
    

    
    var cellCount = 2
    func getCount() {
        db.collection("articles").getDocuments() { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
               for document in querySnapshot.documents {
//                self.cellCount = document.documentID.count
                  print(document.data()["title"])
               }
            }
         }
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.titleLabel.text = dataModle.saveTitle
        cell.category.text = dataModle.saveCategort
        cell.contentLabel.text = dataModle.saveContent
        cell.timeLabel.text = "\(dataModle.saveTime)"
        
//        cell.nameLabel.text = dataModle.saveName
        cell.setUi()
//        cell.showMsg()
        return cell
    }
    
    
}

extension Date {
    func toMillis() -> Int64! {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}

