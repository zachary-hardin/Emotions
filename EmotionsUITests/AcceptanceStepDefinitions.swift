import XCTest
import XCTest_Gherkin

class AcceptanceStepDefinitions: StepDefiner {
    let app = XCUIApplication()
    
    override func defineSteps() {
        step("The app is running") {
            self.app.launch()
        }
        
        step("I see the text '(.*)'") { (text: String) in
            XCTAssert(self.app.staticTexts[text].firstMatch.waitForExistence(timeout: 1.0))
        }
        
        step("I see a button with text '(.*)'") { (text: String) in
            XCTAssert(self.app.buttons[text].firstMatch.waitForExistence(timeout: 1.0))
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
