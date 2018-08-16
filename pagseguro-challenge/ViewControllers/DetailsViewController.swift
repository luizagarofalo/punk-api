import SDWebImage
import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tagline: UILabel!
    @IBOutlet weak var abv: UILabel!
    @IBOutlet weak var ibu: UILabel!
    @IBOutlet weak var bDescription: UILabel!

    var beer: Beer?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.populate()
    }

    private func populate() {
        self.name.text = beer?.name
        self.tagline.text = beer?.tagline
        self.abv.text = "ABV: \(Float((beer?.abv)!))"
        self.ibu.text = "IBU: \(Float((beer?.ibu)!))"
        self.bDescription.text = beer?.description
        self.img.sd_setImage(with: URL(string: (beer?.imageURL!)!), completed: nil)
    }
}
