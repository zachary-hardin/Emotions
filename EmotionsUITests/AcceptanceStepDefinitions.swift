import XCTest
import XCTest_Gherkin

class AcceptanceStepDefinitions: StepDefiner {
    let app = XCUIApplication()
    
    override func defineSteps() {
        step("The app is running") {
            self.app.launch()
        }
        
        step("I am on the Emotion Selector view") {
            let button = self.app.buttons["Dashboard"].firstMatch
            XCTAssertTrue(button.exists)
            button.tap()
        }
        
        step("I see the text '(.*)'") { (text: String) in
            XCTAssert(self.app.staticTexts[text].firstMatch.waitForExistence(timeout: 1.0))
        }
        
        step("I see a table cell with the text: '(.*)'") { (text: String) in
            XCTAssert(
                self.app.tables.cells.staticTexts[text].firstMatch.waitForExistence(timeout: 1.0)
            )
        }
        
        step("I do not see the text '(.*)'") { (text: String) in
            XCTAssertFalse(self.app.staticTexts[text].exists)
        }
        
        step("I see a button with text '(.*)'") { (text: String) in
            XCTAssert(self.app.buttons[text].firstMatch.waitForExistence(timeout: 1.0))
        }
        
        step("I do not see a button with text '(.*)'") { (text: String) in
            XCTAssertFalse(self.app.buttons[text].exists)
        }
        
        step("I swipe left on a card") {
            let emotionElement = self.app.children(matching: .window)
                .element(boundBy: 0).children(matching: .other)
                .element(boundBy: 1).children(matching: .other)
                .element.children(matching: .other)
                .element.children(matching: .other)
                .element.children(matching: .other)
                .element.children(matching: .other)
                .element.children(matching: .other)
                .element.children(matching: .other)
                .element
            
            emotionElement.swipeLeft()
        }

        step("I tap the submit button") {
            let button = self.app.buttons["submitButton"].firstMatch
            XCTAssertTrue(button.exists)
            button.tap()
        }
        
        step("I tap outside of emotion selector view") {
            let button = self.app.buttons["outsideViewButton"].firstMatch
            XCTAssertTrue(button.exists)
            button.tap()
        }
    }
}
