import UIKit

class HistoricDataTableViewController: UITableViewController {
    @IBOutlet var historyTableView: UITableView!
    
    let repo = EmotionRepository()
    var emotions: [Emotion] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        emotions = repo.getAllEmotions()
        historyTableView.reloadData()
    }
}

extension HistoricDataTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emotions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellReuseIdentifier")
        cell.textLabel?.text = emotions[indexPath.row].emotionType.rawValue
        return cell
    }
}
