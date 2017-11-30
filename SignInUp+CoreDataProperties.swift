//
//  SignInUp+CoreDataProperties.swift
//  LoginAndRegister
//
//  Created by Sharad on 27/11/17.
//  Copyright © 2017 Sharad. All rights reserved.
//
//

import Foundation
import CoreData


extension SignInUp {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SignInUp> {
        return NSFetchRequest<SignInUp>(entityName: "SignInUp")
    }

    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var terms: Bool

}
