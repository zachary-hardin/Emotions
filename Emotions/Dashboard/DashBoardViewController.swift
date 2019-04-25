import UIKit

protocol ModalDelegate {
    func modalDismissed()
}

class DashboardViewController: UIViewController, ModalDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func modalDismissed() {
        print("Modal Was Dismissed.")
    }
}

extension DashboardViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "dashboardToSelectorSegue":
            let viewController = segue.destination as? EmotionSelectorViewController
            viewController?.selectorDelegate = self
        default:
            print("⚠️ Unable to find segue.")
        }
    }
}

// https://medium.com/@augusteo/reactive-way-to-handle-dismissing-modal-view-controller-81af09f886f6
// https://stackoverflow.com/questions/32161119/reload-tableviewcontroller-from-parent
// ~/Library/Developer/CoreSimulator/Devices/170BA669-730F-4600-9BA0-E065DA196693/data/Containers/Data/Application/0B99B470-B088-411F-B564-ED6A9F82CE2E/Documents/default.realm

