import UIKit
import MapKit

class TargetEventController: UIViewController {

    var annotation : photoons.customPin!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var displayPhoto: UIImageView!
    @IBOutlet weak var displayDescription: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = NSURL(string : annotation.photo[0].url) {
            if let data = NSData(contentsOf: url as URL) {
                displayPhoto.contentMode = UIViewContentMode.scaleAspectFit
                displayPhoto.image = UIImage(data: data as Data)
            }
        }
        displayLabel.text = annotation.title
        displayDescription.text = annotation.subtitle
    }
}
