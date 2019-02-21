import XCTest
import XCTest_Gherkin

class EmotionsUITests: XCTestCase {
    func testFirstView() {
        Given("The app is running")
        Then("I see the text 'How do you feel today?'")
        And("I see the text 'Normal'")
    }
    
    func testEmotionSwiper() {
        Given("The app is running")
        And("I see the text 'Normal'")
        
        When("I swipe left on a card")
        Then("I see the text 'Happy'")
        
        When("I swipe left on a card")
        Then("I see the text 'Sad'")
        
        When("I swipe left on a card")
        Then("I see the text 'Mad'")
        
        When("I swipe left on a card")
        Then("I see the text 'Stressed'")
        
        When("I swipe left on a card")
        Then("I see the text 'Normal'")
    }
}
