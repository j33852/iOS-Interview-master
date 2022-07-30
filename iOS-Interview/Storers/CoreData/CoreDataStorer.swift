//
//  CoreDataStorer.swift
//  iOS-Interview
//
//  Created by Harry Li on 2022/6/30.
//

import Foundation
import UIKit
import CoreData

final class CoreDataStorer {
    
    var users = [User]()
    
    private let coreDateService: CoreDataService
    
    init(coreDateService: CoreDataService) {
        self.coreDateService = coreDateService
    }
}

extension CoreDataStorer {
    enum CoreDataStorerError: Error {
        case notFound
    }
}

extension CoreDataStorer {
    // TODO:
    // Step 1. Convert User to UserTable
    // Step 2. Save UserTable to CoreDataService (with .store(UserTable))
    func save(user: User) {
        
        let userTable = UserTable(id: user.id, field_name: user.name, field_email: user.email, field_is_designer: user.isDesigner, created_at: Date())

        coreDateService.store(userTable)
        
    }
    
    // TODO:
    // Step 1. Fetch user with specifically User.id
    // Step 1-1. if User.id is not exists in coreDateService than completion with notFound Failure
    // Step 1-2. if User.id is exists in coreDateService than convert it to User and completion with User Success
    func fetch(user: User, completion: @escaping (Result<User, CoreDataStorerError>) -> Void) {

        
        guard user.id != "" else {
            completion(Result.failure(.notFound))
            return
        }
        
        
        users.append(User(id: user.id, name: user.name, email: user.email, isDesigner: user.isDesigner))
        
    }
}
