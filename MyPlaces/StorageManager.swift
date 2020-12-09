//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Alexandr on 18.09.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import RealmSwift

// MARK: - Сохранение и удаление данных 

let realm = try! Realm()

class StorageManager {
    
 static func save ( _ place : Place) {
        try! realm.write {
            realm.add(place)
        }
    }
    
 static func delete (_ place : Place) {
    try! realm.write {
        realm.delete(place)
    }
    
}
    
}
