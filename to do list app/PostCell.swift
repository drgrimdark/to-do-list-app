//
//  PostCell.swift
//  my-hood-devslopes
//
//  Created by Mark Price on 8/18/15.
//  Copyright © 2015 devslopes. All rights reserved.
//

import UIKit
import CoreData

class PostCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var deleteImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.deleteTapped(_:)))
        tap.numberOfTapsRequired = 1
        deleteImage.addGestureRecognizer(tap)
        deleteImage.userInteractionEnabled = true

        
        }
    
    func configureCell(post: Post) {
        titleLbl.text = post.title
        
        
        
    }

}
