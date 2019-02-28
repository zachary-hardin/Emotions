import XCTest
@testable import Emotions

class EmotionsIntegrationTests: XCTestCase {
    
    var viewController: EmotionSelectorViewController!

    override func setUp() {
        super.setUp()
        
        viewController = instantiateWithoutLoad(fromStoryboard: "Main", withIdentifier: "EmotionSelectorStoryboardId")
    }

    func testExample() {
        viewController.loadView()
//        viewController.render()
        
        XCTAssert(true)
    }
}

extension XCTestCase {
    
    func instantiateWithoutLoad<T>(fromStoryboard name: String, withIdentifier identifier: String) -> T {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! T
        
        return viewController
    }
    
    func instantiateViewController<T>(fromStoryboard name: String, withIdentifier identifier: String) -> T {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! T
        _ = (viewController as! UIViewController).view
        
        return viewController
    }
}
