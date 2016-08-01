//
//  Post.swift
//  to do list app
//
//  Created by Mike on 7/26/16.
//  Copyright © 2016 Little Lujan LLC. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Post: NSManagedObject {
    
    @NSManaged var title: String?
    
}