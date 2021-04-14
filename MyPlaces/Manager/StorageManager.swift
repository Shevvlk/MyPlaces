
import RealmSwift

final class StorageManager {
    
    private var realm: Realm? {
        do {
            let realm = try Realm()
            return realm
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func save (_ place: Place) {
        try! realm?.write {
            realm?.add(place)
        }
    }
    
    func overstore(_ editableObject: Place, _ auxiliaryObject: Place) {
        try! realm?.write {
            editableObject.name = auxiliaryObject.name
            editableObject.location = auxiliaryObject.location
            editableObject.type = auxiliaryObject.type
            editableObject.imageData = auxiliaryObject.imageData
        }
    }
    
    func delete (_ place: Place, _ token: [NotificationToken]) {
        try! realm?.write(withoutNotifying: token) {
            realm?.delete(place)
        }
    }
    
}
