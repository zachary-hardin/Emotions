import UIKit

let pages = [
    newViewController(storyboardId: "NormalStoryboardId"),
    newViewController(storyboardId: "HappyStoryboardId"),
    newViewController(storyboardId: "SadStoryboardId"),
    newViewController(storyboardId: "MadStoryboardId"),
    newViewController(storyboardId: "StressedStoryboardId")
]

// 💡 Maybe return EmotionType here instead of a string.
let emotions: [Int: EmotionType] = [
    0: .Normal,
    1: .Happy,
    2: .Sad,
    3: .Mad,
    4: .Stressed,
]

func newViewController(storyboardId: String) -> UIViewController {
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
        withIdentifier: storyboardId
    )
}
