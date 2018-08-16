import SDWebImage
import UIKit

class BeersViewController: UIViewController {
    @IBOutlet weak var beersTableView: UITableView!
    private var beers: Beers = [] {
        didSet {
            DispatchQueue.main.async {
                self.beersTableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        self.beersTableView.register(UINib(nibName: "BeersTableViewCell",
                                           bundle: nil), forCellReuseIdentifier: "cell")
    }

    private func loadData() {
        NetworkRequest.load(onComplete: updateBeers)
    }

    private func updateBeers(response: Result<Beers>) {
        switch response {
        case .success(let beers):
            self.beers += beers

        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}

extension BeersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.beers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                       for: indexPath) as? BeersTableViewCell else {
                                                        return UITableViewCell()
        }

        cell.name.text = self.beers[indexPath.row].name
        cell.abv.text = String(describing: Float(self.beers[indexPath.row].abv!))
        cell.img.sd_setImage(with: URL(string: self.beers[indexPath.row].imageURL!), completed: nil)

        return cell
    }
}

extension BeersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beer = self.beers[indexPath.row]
        self.performSegue(withIdentifier: "showDetailsSegue", sender: beer)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsViewController = segue.destination as? DetailsViewController {
            if let beer = sender as? Beer {
                detailsViewController.beer = beer
            }
        }
    }
}
