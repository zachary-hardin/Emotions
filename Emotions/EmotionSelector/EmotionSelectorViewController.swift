import UIKit
import RealmSwift

protocol EmotionPageDelegate: class {
    func updateCurrentEmotion(index: Int)
}

class EmotionSelectorViewController: UIViewController {
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentEmotionType = emotions[0]
    var selectorDelegate: ModalDelegate?
    
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
        self.dismiss(animated: true) {
            if self.selectorDelegate != nil {
                self.selectorDelegate?.modalDismissed()
            }
        }
        
        guard let emotionType = currentEmotionType else { return }
        let emotion = createEmotionWith(type: emotionType)
        let repo = EmotionRepository()
        repo.add(emotion: emotion)
    }
}

extension EmotionSelectorViewController: EmotionPageDelegate {
    func updateCurrentEmotion(index: Int) {
        currentEmotionType = emotions[index]
        pageControl.currentPage = index
        
        guard let emotion = currentEmotionType else { return }
        submitButton.setTitle("I Feel \(emotion.rawValue)", for: .normal)
    }
}
