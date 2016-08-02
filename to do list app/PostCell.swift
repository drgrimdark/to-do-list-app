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
    @IBOutlet weak var doneImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(PostCell.doneTapped(_:)))
        tap.numberOfTapsRequired = 1
        doneImage.addGestureRecognizer(tap)
        doneImage.userInteractionEnabled = true

        
        }
    func doneTapped(sender: UITapGestureRecognizer!) {
        if doneImage.image == UIImage(named: "notDone") {
            doneImage.image = UIImage(named: "done")
            
        }else if doneImage.image == UIImage(named: "done"){
            doneImage.image = UIImage(named: "notDone")
        }
    }
    
    func configureCell(post: Post) {
        titleLbl.text = post.title
        doneImage.image = UIImage(named: "notDone")
        
        
    }

}
