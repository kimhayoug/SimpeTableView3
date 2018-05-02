

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    var animals = ["Cat", "Dog", "Cow", "Rabbit", "Bird"]
    var year = ["고양이", "강아지", "소", "토끼", "새"]
    var img = ["1.jpg","2.jpg","3.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "RE"
        let cell = myTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        
        let myImage = UIImage(named:"1.jpg")
        cell.imageView?.image = myImage
        cell.textLabel?.text = animals[indexPath.row]
        cell.detailTextLabel?.text = year[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section = \(indexPath.section) row = \(indexPath.row)")
        print(animals[indexPath.row])
        print(year[indexPath.row])
        
        let myAlert = UIAlertController(title: "동물들",message: "동물에대해 알아보자",preferredStyle: .actionSheet)
        
        let ok = UIAlertAction(title: "확인", style: .default) { (action: UIAlertAction) -> Void in
            self.view.backgroundColor = UIColor.red
        }
        
        let cancelAction = UIAlertAction(title: "삭제", style: .cancel, handler: { (action: UIAlertAction) -> Void in
            self.view.backgroundColor = UIColor.green
        })
        
        let testAction = UIAlertAction(title: "취소", style: .default, handler:  nil)
        
        myAlert.addAction(ok)
        myAlert.addAction(cancelAction)
        myAlert.addAction(testAction)
        
        present(myAlert, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  100
    }
    }


