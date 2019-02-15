import XCTest
import XCTest_Gherkin

class AcceptanceStepDefinitions: StepDefiner {
    let app = XCUIApplication()
    
    override func defineSteps() {
        step("The app is running") {
            self.app.launch()
        }
        
        step("I see the text '(.*)'") { (text: String) in
            XCTAssert(self.app.staticTexts[text].exists)
        }
        
        step("I swipe left on a card") {
            let emotionElement = self.app.otherElements.containing(
                .staticText, identifier:"How do you feel today?")
                .children(matching: .other).element
                .children(matching: .other).element
                .children(matching: .other).element
                .children(matching: .other).element
                .children(matching: .other).element
            
            emotionElement.swipeLeft()
        }
    }
}
