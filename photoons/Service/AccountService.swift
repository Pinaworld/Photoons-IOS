class AccountService {
    var pseudo : String
    /*var pseudo: String {
        set(newPseudo){
            _pseudo = newPseudo
        }
        get {
            return _pseudo
        }
    }*/
    var age: String
    var email: String
    var password: String
    
    init(_pseudo : String, _age : String, _email : String, _password : String) {
        self.pseudo = _pseudo;
        self.age = _age;
        self.email = _email;
        self.password = _password;
        
    }
    
    func setPseudo(_pseudo : String) {
        self.pseudo = _pseudo;
    }
    
    func setAge(_age : String) {
        self.age = _age;
    }
    
    func setEmail(_email : String) {
        self.email = _email;
    }
    
    func setPassword(_password : String) {
        self.password = _password
    }

    func getPseudo() -> String {
        return self.pseudo;
    }
    
    func getAge() -> String {
        return self.age;
    }
    
    func getEmail() -> String {
        return self.email;
    }
    
    func getPassword() -> String {
        return self.password;
    }
    
}
