import RealmSwift

enum EmotionType: String {
    case Normal, Happy, Sad, Mad, Stressed
}

class Emotion: Object {
    @objc dynamic var timestamp = Date()
    @objc dynamic var notes = ""
    @objc dynamic private var _emotionType = ""
    var emotionType: EmotionType {
        get {
            guard let type = EmotionType(rawValue: _emotionType) else {
                return EmotionType.Normal
            }
            return type
        }
        set { _emotionType = newValue.rawValue }
    }
}
