import UIKit

class LoginController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let e_email = UserDefaults.standard.string(forKey: "e_mail");
        let e_pseudo = UserDefaults.standard.string(forKey: "e_pseudo");
        let e_age = UserDefaults.standard.string(forKey: "e_age");
        
        if (e_email != nil && e_pseudo != nil && e_age != nil) {
            performSegue(withIdentifier: "Map", sender: self)
        }
    }
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func connectGoogle(_ sender: Any) {
    }
    
    @IBAction func connectFaceBook(_ sender: Any) {
    }
    
    @IBAction func connection(_ sender: Any) {
        let _email = UserDefaults.standard.string(forKey: "email");
        let _password = UserDefaults.standard.string(forKey: "password");
        
        if (password.text, email.text) == (_email, _password) {
            UserDefaults.standard.set(UserDefaults.standard.string(forKey: "email"), forKey: "e_mail")
            UserDefaults.standard.set(UserDefaults.standard.string(forKey: "pseudo"), forKey: "e_pseudo")
            UserDefaults.standard.set(UserDefaults.standard.string(forKey: "age"), forKey: "e_age")
            performSegue(withIdentifier: "Map", sender: self)
        }
        
    }
}
