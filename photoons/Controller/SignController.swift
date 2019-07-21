import UIKit

class SignController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var pseudo: UITextField!
    
    @IBOutlet weak var age: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func creeCompte(_ sender: Any) {
        UserDefaults.standard.set(pseudo.text, forKey: "pseudo")
        UserDefaults.standard.set(age.text, forKey: "age")
        UserDefaults.standard.set(email.text, forKey: "email")
        UserDefaults.standard.set(password.text, forKey: "password")
        
        performSegue(withIdentifier: "Connection", sender: self)
    }

}
