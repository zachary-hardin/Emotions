import UIKit

protocol EmotionPageDelegate: class {
    func updateCurrentEmotion(index: Int)
}

class EmotionSelectorViewController: UIViewController {
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentEmotion: EmotionType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = pages.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "emotionPageViewSegue" {
            let viewController = segue.destination as? PageViewController
            viewController?.emotionDelegate = self
        }
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
        
        // 💡 Write user's emotion to Realm here
        // 💡 Use a switch statement here to determine what EmotionType to set.
    }
}

/*
 * Define what emotion is selected
 * Create instance of Emotion
 * Store Emotion
*/

extension EmotionSelectorViewController: EmotionPageDelegate {
    func updateCurrentEmotion(index: Int) {
        currentEmotion = emotions[index]
        pageControl.currentPage = index
        
        guard let emotion = currentEmotion else { return }
        let buttonText = "I Feel \(emotion.rawValue)"
        submitButton.setTitle(buttonText, for: .normal)
    }
}
