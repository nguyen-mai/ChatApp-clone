//
//  CollectionViewCell.swift
//  ChatAppClone
//
//  Created by Apple on 2022/4/14.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var ava: UIImageView!
    @IBOutlet var name: UILabel!
        
    override func draw(_ rect: CGRect) {
        containerView.layer.cornerRadius = ava.frame.size.width / 2
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.mainColor.cgColor
        
        name.font = UIFont(name: "Lato-Black", size: 12)
    }
    
    func configure(with user: User) {
        self.ava.image = UIImage(named: user.ava)
        self.name.text = user.name
    }
}
