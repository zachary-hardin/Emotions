import UIKit

let pages = [
    newViewController(storyboardId: "NormalStoryboardId"),
    newViewController(storyboardId: "HappyStoryboardId"),
    newViewController(storyboardId: "SadStoryboardId"),
    newViewController(storyboardId: "MadStoryboardId"),
    newViewController(storyboardId: "StressedStoryboardId")
]

let emotions: [Int: (index: Int, type: String)] = [
    0: (index: 0, type: "Normal"),
    1: (index: 1, type: "Happy"),
    2: (index: 2, type: "Sad"),
    3: (index: 3, type: "Mad"),
    4: (index: 4, type: "Stressed"),
]

func newViewController(storyboardId: String) -> UIViewController {
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
        withIdentifier: storyboardId
    )
}
