import UIKit

class EventController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    var items = ["Dog","Cat", "Cow", "Platypus"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.register(UITableViewCell.self, forCellReuseIdentifier:"cell")
        self.table.dataSource=self
        self.table.delegate=self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.table.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel!.text = self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("You tapped on cell # \(indexPath.row)")
    }
}

