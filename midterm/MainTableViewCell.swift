//
//  MainTableViewCell.swift
//  midterm
//
//  Created by Max Kai on 2020/11/20.
//

import UIKit
import FirebaseFirestore

class MainTableViewCell: UITableViewCell {
    
    
    var showTitle: String = ""
    var showName: String = ""
    var showCategort: String = ""
    var showContent: String = ""
    var showCreatedTime = Date().toMillis()
    let dataModle = DataModle()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func setUi() {
        category.layer.cornerRadius = 5
        category.layer.masksToBounds = true
        nameLabel.textColor = UIColor.darkGray
    }
    
    
    func showMsg() {
        dataModle.readData()
        titleLabel.text = dataModle.saveTitle
//        nameLabel.text = dataModle.saveName
//        timeLabel.text = "\(String(describing: dataModle.saveTime))"
        category.text = dataModle.saveCategort
        contentLabel.text = dataModle.saveContent
    }
    
}



