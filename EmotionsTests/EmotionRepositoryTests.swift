import XCTest
import RealmSwift
@testable import Emotions

class EmotionsTests: XCTestCase {
    let sixtySeconds = 60.0
    
    var testRealm: Realm!
    var repository: EmotionRepository!
    
    var happyEmotion: Emotion!
    var sadEmotion: Emotion!
    var olderTime: Date!
    var newerTime: Date!
    
    override func setUp() {
        testRealm = try! Realm(
            configuration: Realm.Configuration(inMemoryIdentifier: "emotion-repository-spec")
        )
        repository = EmotionRepository(realm: testRealm)
        
        olderTime = Date()
        newerTime = olderTime.addingTimeInterval(sixtySeconds)
        happyEmotion = createEmotionWith(type: .Happy, date: olderTime)
        sadEmotion = createEmotionWith(type: .Sad, date: newerTime)
    }

    override func tearDown() {
        try! testRealm.write {
            testRealm.deleteAll()
        }
    }

    func testAddEmotionStoresEmotion() {
        XCTAssertEqual(testRealm.objects(Emotion.self).count, 0)

        let date = Date()
        let emotion = createEmotionWith(type: .Happy, date: date, notes: "foo")
        
        repository.add(emotion: emotion)
        XCTAssertEqual(testRealm.objects(Emotion.self).count, 1)
        
        let firstEmotion: Emotion = testRealm.objects(Emotion.self).first!
        XCTAssertEqual(firstEmotion.emotionType, .Happy)
        XCTAssertEqual(firstEmotion.timestamp, date)
        XCTAssertEqual(firstEmotion.notes, "foo")
    }
    
    func testGetEmotionsRetrievesEmotion() {
        setUpRealm([sadEmotion, happyEmotion])
        let emotions = repository.getEmotions()
        
        XCTAssertEqual(emotions.count, 2)
    }
    
    func testGetEmotionsSortsChronologically() {
        setUpRealm([sadEmotion, happyEmotion])
        let emotions = repository.getEmotions()
        
        XCTAssertEqual(emotions.first!.emotionType, .Happy)
        XCTAssertEqual(emotions.last!.emotionType, .Sad)
    }
    
    

    func setUpRealm(_ emotions: [Emotion]) {
        for emotion in emotions {
            try! testRealm.write {
                self.testRealm.add(emotion)
            }
        }
        
        XCTAssertEqual(testRealm.objects(Emotion.self).count, emotions.count)
    }
    
    func createEmotionWith(type: EmotionType? = .Normal, date: Date? = Date(), notes: String? = "") -> Emotion {
        let emotion = Emotion()
        
        emotion.emotionType = type!
        emotion.notes = notes!
        emotion.timestamp = date!
        
        return emotion
    }
}
