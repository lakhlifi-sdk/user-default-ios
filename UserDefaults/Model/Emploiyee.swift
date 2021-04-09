//
//  Emploiyee.swift
//  UserDefaults
//
//  Created by Lakhlifi Essaddiq on 4/6/21.
//

import UIKit

class Emploiyee: NSObject {
    
    let id : Int
    let employee_name : String
    let employee_salary : String
    let employee_age: Int
    let profile_image: String
    
    init( id : Int, employee_name : String, employee_salary : String, employee_age: Int, profile_image: String){
        self.id = id
        self.employee_name = employee_name
        self.employee_salary = employee_salary
        self.employee_age = employee_age
        self.profile_image = profile_image
    }

}
