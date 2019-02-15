import UIKit

let pages = [
    newViewController(storyboardId: "NormalStoryboardId"),
    newViewController(storyboardId: "HappyStoryboardId"),
    newViewController(storyboardId: "SadStoryboardId"),
    newViewController(storyboardId: "MadStoryboardId"),
    newViewController(storyboardId: "StressedStoryboardId")
]

func newViewController(storyboardId: String) -> UIViewController {
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
        withIdentifier: storyboardId
    )
}
