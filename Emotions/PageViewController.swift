import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    var emotionDelegate: EmotionPageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self

        if let firstPageViewController = pages.first {
            setViewControllers([firstPageViewController], direction: .forward, animated: true)
        }
    }
}

extension PageViewController {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return pages.last }
        guard pages.count > previousIndex else { return nil}
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllerCount = pages.count
        
        guard orderedViewControllerCount != nextIndex else { return pages.first }
        guard orderedViewControllerCount > nextIndex else { return nil }
        
        return pages[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed {
            if let viewController = pageViewController.viewControllers?.first {
                if let index = pages.index(of: viewController) {
                    if emotionDelegate != nil {
                        emotionDelegate?.updateCurrentEmotion(index: index)
                    }
                }
            }
        }
    }
}
