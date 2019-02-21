import UIKit

/*
 https://learnappmaking.com/pass-data-between-view-controllers-swift-how-to/
 https://www.swiftbysundell.com/posts/delegation-in-swift
 https://medium.com/@nimjea/delegation-pattern-in-swift-4-2-f6aca61f4bf5
*/

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    var currentPageIndex = 0
    var emotionDelegate: EmotionPageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self

        if let firstPageViewController = pages.first {
            setViewControllers([firstPageViewController], direction: .forward, animated: true)
        }
    }
        
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
                        emotionDelegate?.updateCurrentPageIndex(index: index)
                    }

                    print("📄 \(index)")
                    self.currentPageIndex = index
                }
            }
        }
    }
}
