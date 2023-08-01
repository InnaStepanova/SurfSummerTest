//
//  Person.swift
//  SurfSummerTest
//
//  Created by Лаванда on 01.08.2023.
//

import Foundation

struct Person {
    let name: String
    let surname: String
    let patronymic: String?
    let photo: Data?
    let position: String?
    let experience: Int?
    let city: String?
    let skills: [String]
    let aboutMe: String?
}

extension Person {
    static func getMockPerson() -> Person {
        return Person(name: "Иван", surname: "Иванов", patronymic: "Иванович", photo: nil, position: "Middle iOS-разработчик", experience: 24, city: "Воронеж", skills: [], aboutMe: "Обо мне очень много информации")
    }
}
