import RealmSwift

class EmotionRepository {
    
    let realm: Realm!
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    convenience init() {
        self.init(realm: try! Realm())
    }
    
    func add(emotion: Emotion) {
        do {
            try realm.write {
                self.realm.add(emotion)
            }
        } catch let error as NSError {
            print("Error: \(error)")
        }
    }
    
    func getEmotions() -> [Emotion] {
        let emotions = realm.objects(Emotion.self)
        return Array(emotions.sorted(by: {$0.timestamp < $1.timestamp}))
    }
}
