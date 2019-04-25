import XCTest
import XCTest_Gherkin

class EmotionsUITests: XCTestCase {
    func testFirstView() {
        Given("The app is running")
        And("I am on the Emotion Selector view")
        Then("I see the text 'How do you feel today?'")
        And("I see the text 'Normal'")
        And("I see a button with text 'I Feel Normal'")
    }
    
    func testEmotionSwiper() {
        Given("The app is running")
        And("I am on the Emotion Selector view")
        Then("I see the text 'Normal'")
        
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
    
    func testDismissEmotionSelectionView() {
        Given("The app is running")
        And("I am on the Emotion Selector view")
        Then("I see the text 'Normal'")
        When("I tap the submit button")
        Then("I see a button with text 'Dashboard'")
        And("I do not see the text 'Normal'")
        And("I do not see a button with text 'I Feel Normal'")
    }
    
    func testDismissEmotionsSelectionByTappingOutside() {
        Given("The app is running")
        And("I am on the Emotion Selector view")
        When("I tap outside of emotion selector view")
        Then("I see a button with text 'Dashboard'")
        And("I do not see the text 'Normal'")
        And("I do not see a button with text 'I Feel Normal'")
    }
    
    func testSelectedEmotionAppearsInDashboard() {
        Given("The app is running")
        And("I am on the Emotion Selector view")
        And("I see the text 'Normal'")
        When("I tap the submit button")
        Then("I see a table cell with the text: 'Normal'")
    }
}
