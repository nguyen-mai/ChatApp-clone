//
//  TableViewCell.swift
//  ChatAppClone
//
//  Created by Apple on 2022/4/14.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet var ava: UIImageView!
    @IBOutlet var isOnlView: UIView!
    @IBOutlet var name: UILabel!
    @IBOutlet var subMes: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var counter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        name.font = UIFont(name: "Lato-Bold", size: 14)
        
        subMes.font = UIFont(name: "Lato-Regular", size: 12)
        subMes.textColor = UIColor.lightGray
        
        time.font = UIFont(name: "Lato-Regular", size: 12)
        time.textColor = UIColor.lightGray
        
        isOnlView.layer.cornerRadius = isOnlView.frame.size.width / 2
        
        counter.layer.cornerRadius = 8
        counter.layer.masksToBounds = true
        counter.font = UIFont(name: "Lato-Regular", size: 12)
    }
    
    func configure(with user: User) {
        ava.image = UIImage(named: user.ava)
        name.text = user.name
        subMes.text = "bla bla"
        time.text = "12:00"
        counter.text = "100"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
