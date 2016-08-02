//
//  ViewController.swift
//  to do list app
//
//  Created by Mike on 7/26/16.
//  Copyright © 2016 Little Lujan LLC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var postField: MaterialTextField!
    
    var posts = [Post]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        onPostsLoaded(self)
    }
    
    
    override func viewDidAppear(animated: Bool) {
      fetchAndSetResults()
      tableView.reloadData()

    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest  = NSFetchRequest(entityName: "Post")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.posts = results as! [Post]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    
    @IBAction func addTapped (sender: AnyObject!) {
            if let title = postField.text where title != "" {
                
                let app = UIApplication.sharedApplication().delegate as! AppDelegate
                let context = app.managedObjectContext
                let entity = NSEntityDescription.entityForName("Post", inManagedObjectContext: context)!
                let post = Post(entity: entity, insertIntoManagedObjectContext: context)
                
                post.title = title
                
                context.insertObject(post)
                
                do {
                    try context.save()
                } catch {
                    print("Could not save recipe")
                }
              fetchAndSetResults()
                tableView.reloadData()
                postField.text = ""
        }
    
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            // remove the deleted item from the model
            let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let context:NSManagedObjectContext = appDel.managedObjectContext
            context.deleteObject(posts[indexPath.row] )
            posts.removeAtIndex(indexPath.row)
            do {
                try context.save()
            } catch _ {
            }
            
            // remove the deleted item from the `UITableView`
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        default:
            return
        }
    }
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            let post = posts[indexPath.row]
            cell.configureCell(post)
            return cell
        } else {
            
            return PostCell()
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 80.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func onPostsLoaded(notif: AnyObject) {
        tableView.reloadData()
    }
    
}

