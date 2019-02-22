import XCTest
import XCTest_Gherkin

class EmotionsUITests: XCTestCase {
    func testFirstView() {
        Given("The app is running")
        Then("I see the text 'How do you feel today?'")
        And("I see the text 'Normal'")
        And("I see a button with text 'I Feel Normal'")
    }
    
    func testEmotionSwiper() {
        Given("The app is running")
        And("I see the text 'Normal'")
        
        When("I swipe left on a card")
        Then("I see the text 'Happy'")
        And("I see a button with text 'I Feel Happy'")

        When("I swipe left on a card")
        Then("I see the text 'Sad'")
        And("I see a button with text 'I Feel Sad'")

        When("I swipe left on a card")
        Then("I see the text 'Mad'")
        And("I see a button with text 'I Feel Mad'")
        
        When("I swipe left on a card")
        Then("I see the text 'Stressed'")
        And("I see a button with text 'I Feel Stressed'")

        When("I swipe left on a card")
        Then("I see the text 'Normal'")
        And("I see a button with text 'I Feel Normal'")
    }
}
