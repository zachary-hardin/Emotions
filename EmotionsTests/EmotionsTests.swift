import XCTest
import RealmSwift
@testable import Emotions

class EmotionsTests: XCTestCase {
    var testRealm: Realm!
    var repository: EmotionRepository!
    
    override func setUp() {
        testRealm = try! Realm(
            configuration: Realm.Configuration(inMemoryIdentifier: "emotion-repository-spec")
        )
        repository = EmotionRepository(realm: testRealm)
    }

    override func tearDown() {
        try! testRealm.write {
            testRealm.deleteAll()
        }
    }

    func testAddEmotionStoresEmotion() {
        XCTAssertEqual(testRealm.objects(Emotion.self).count, 0)

        let date = Date()
        let emotion = Emotion()
        emotion.emotionType = .Happy
        emotion.timestamp = date
        emotion.notes = "bar"
        
        repository.add(emotion: emotion)
        
        XCTAssertEqual(testRealm.objects(Emotion.self).count, 1)
        
        let firstEmotion: Emotion = testRealm.objects(Emotion.self).first!
        XCTAssertEqual(firstEmotion.emotionType, .Happy)
        XCTAssertEqual(firstEmotion.timestamp, date)
        XCTAssertEqual(firstEmotion.notes, "bar")
    }
}
