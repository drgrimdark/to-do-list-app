//
//  Post+CoreDataProperties.swift
//  to do list app
//
//  Created by Mike on 8/9/16.
//  Copyright © 2016 Little Lujan LLC. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Post {

    @NSManaged var done: Bool
    @NSManaged var title: String?

}
