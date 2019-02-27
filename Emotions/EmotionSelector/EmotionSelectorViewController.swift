import UIKit

protocol EmotionPageDelegate: class {
    func updateCurrentEmotion(index: Int)
}

class EmotionSelectorViewController: UIViewController {
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentEmotion: String!
    
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
    }
}

extension EmotionSelectorViewController: EmotionPageDelegate {
    func updateCurrentEmotion(index: Int) {
        currentEmotion = emotions[index]
        pageControl.currentPage = index
        
        guard let emotion = currentEmotion else { return }
        let buttonText = "I Feel \(emotion)"
        submitButton.setTitle(buttonText, for: .normal)
    }
}
