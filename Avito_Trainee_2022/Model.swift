//
//  Model.swift
//  Avito_Trainee_2022
//
//  Created by Евгений колесников on 07.04.2024.
//

import Foundation


struct Model: Codable {
    let company: Company
}

struct Company: Codable {
    let name: String
    let employees: [Employees]
}

struct Employees: Codable {
    let name: String
    let phone_number: String
    let skills: [String]
}




/* JSON data
 {
     "company": {
         "name":"Avito",
     "employees": [{
             "name": "John",
             "phone_number": "769453",
             "skills": ["Swift", "iOS"]
         }, {
             "name": "Diego",
             "phone_number": "987924",
             "skills": ["Kotlin", "Android"]
         }, {
             "name": "Alfred",
             "phone_number": "452533",
             "skills": ["Objective-C", "Android", "Photoshop"]
         }, {
             "name": "John",
             "phone_number": "212456",
             "skills": ["Java", "Python"]
         }, {
             "name": "Mat",
             "phone_number": "778975",
             "skills": ["Android", "MovieMaker"]
         }, {
             "name": "Bob",
             "phone_number": "456468",
             "skills": ["Groovy", "Kotlin"]
         }, {
             "name": "Marty",
             "phone_number": "321789",
             "skills": ["Android", "PHP", "C#"]
         }]
     }
 }
 */
