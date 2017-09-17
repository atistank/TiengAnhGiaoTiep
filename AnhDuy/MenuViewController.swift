

import UIKit

class MenuViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
  
    
    var menuName:Array = [String]()
    var iconeImage:Array = [UIImage]()
    
    
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuName = ["Home","Thông Tin","Địa Điểm Học","Cài Đặt"]
        iconeImage = [UIImage(named: "home")!, UIImage(named: "message")!, UIImage(named: "map")!,UIImage(named: "setting")!]
        
        // bo tron avatar
        imgProfile.layer.borderWidth = 2
        imgProfile.layer.borderColor = UIColor.white.cgColor
        imgProfile.layer.cornerRadius = 50
        
        imgProfile.layer.masksToBounds = false
        imgProfile.clipsToBounds = true
        
              // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.imgicon.image = iconeImage[indexPath.row]
        cell.label.text! = menuName[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewcontroller: SWRevealViewController = self.revealViewController()
        let cell:TableViewCell = tableView.cellForRow(at: indexPath) as! TableViewCell
         print(cell.label.text!)
        // nut home
        
        if cell.label.text! == "Home"
        {
            let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryboard.instantiateViewController(withIdentifier: "EpisodesTableViewController") as! EpisodesTableViewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            revealViewcontroller.pushFrontViewController(newFrontViewController, animated: true)
        }
        //nut thong tin
        
         if cell.label.text! == "Thông Tin"
        {
            print("loi ngay cho nay")
            let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            revealViewcontroller.pushFrontViewController(newFrontViewController, animated: true)
        }
        
        
        

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
