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
        
    func configureCell(post: Post) {
        titleLbl.text = post.title
        if post.done == false {
            doneImage.image = UIImage(named: "notDone")
        }else if post.done == true {
            doneImage.image = UIImage(named: "done")
        }
    }
    
    func doneTapped(sender: UITapGestureRecognizer!) {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let entity = NSEntityDescription.entityForName("Post", inManagedObjectContext: context)!
        let post = Post(entity: entity, insertIntoManagedObjectContext: context)

        
        if post.done == false {
            doneImage.image = UIImage(named: "done")
            post.done = true
            do {
                try context.save()
            } catch {
                print("Could not save recipe")
            }

            
        }else if post.done == true {
            doneImage.image = UIImage(named: "notDone")
            post.done = false
            do {
                try context.save()
            } catch {
                print("Could not save recipe")
            }

        }
        
    

    }
}
