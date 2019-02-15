import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
        
        if let firstPageViewController = orderedPageViewControllers.first {
            setViewControllers([firstPageViewController], direction: .forward, animated: true)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedPageViewControllers.index(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return orderedPageViewControllers.last }
        guard orderedPageViewControllers.count > previousIndex else { return nil}
        
        return orderedPageViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedPageViewControllers.index(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllerCount = orderedPageViewControllers.count
        
        guard orderedViewControllerCount != nextIndex else { return orderedPageViewControllers.first }
        guard orderedViewControllerCount > nextIndex else { return nil }
        
        return orderedPageViewControllers[nextIndex]
    }
}
