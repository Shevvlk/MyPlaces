//
//  Location data.swift
//  MyPlaces
//
//  Created by Alexandr on 04.09.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//


import RealmSwift

// MARK: - Модель данных 
class Place : Object {
    @objc dynamic var name = ""
    @objc dynamic var location: String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
}
