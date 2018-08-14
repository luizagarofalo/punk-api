import UIKit

class BeersViewController: UIViewController {
    @IBOutlet weak var beersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.beersTableView.register(UINib(nibName: "BeersTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}

extension BeersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                       for: indexPath) as? BeersTableViewCell else {
                                                        return UITableViewCell()
        }

        return cell
    }
}

extension BeersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       self.performSegue(withIdentifier: "showDetailsSegue", sender: nil)
    }
}
