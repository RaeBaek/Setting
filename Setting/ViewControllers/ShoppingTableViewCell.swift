//
//  ShoppingTableViewCell.swift
//  Setting
//
//  Created by 백래훈 on 2023/07/28.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    
    static let identifier = "ShoppingTableViewCell"
    
    @IBOutlet var topView: UIView!
    @IBOutlet var checkImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bookmarkButton: UIButton!
    
    
    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
        
    }
    
    func configureCell(row: ToDo) {
//        topView.isUserInteractionEnabled = false
        topView.backgroundColor = .systemGray6
        topView.layer.cornerRadius = 5
        
        titleLabel.text = row.title
        
        checkImageView.tintColor = .black
        
        if row.check {
            checkImageView.image = UIImage(systemName: "checkmark.square.fill")
        } else {
            checkImageView.image = UIImage(systemName: "checkmark.square")
        }
        
        bookmarkButton.setTitle("", for: .normal)
        bookmarkButton.tintColor = .black
        
        if row.like {
            bookmarkButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            bookmarkButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
    }
    
}
