import XCTest
import XCTest_Gherkin

class AcceptanceStepDefinitions: StepDefiner {
    override func defineSteps() {
        step("The app is running") {
            XCUIApplication().launch()
        }
        
        step("I see the text: Hello World") {
            XCTAssert(XCUIApplication().staticTexts["Hello World"].exists)
        }
    }
}
