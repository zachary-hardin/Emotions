import UIKit

protocol EmotionPageDelegate: class {
    func updateCurrentPageIndex(index: Int)
}

class ViewController: UIViewController, EmotionPageDelegate {
    var currentPageIndex = 0
    var currentEmotionSet: (index: Int, type: String)!
    
    func updateCurrentPageIndex(index: Int) {
        currentPageIndex = index
        currentEmotionSet = emotions[index]
        pageControl.currentPage = currentEmotionSet.0
    }
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = pages.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "emotionPageViewSegue" {
            let vc = segue.destination as! PageViewController
            vc.emotionDelegate = self
        }
    }
}
