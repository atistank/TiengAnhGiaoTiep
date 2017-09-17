
//
import  FirebaseAuth
import UIKit
import SafariServices
import Social
class EpisodesTableViewController: UITableViewController
{
    var episodes = [Episode]()
    var tam = 0;
    
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    

    
    @IBAction func nutlike(_ sender: Any) {
        
        
        
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
          print(FIRAuth.auth()?.currentUser?.email)
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        // bo tron cell cua table view
        self.episodes = Episode.downloadAllEpisodes()
        self.tableView.reloadData()
        self.tableView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        // hien thi menu
        btnMenuButton.target = revealViewController()
        btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
    }
    func thongbao(service:String){
        let alert = UIAlertController(title: "Error", message: "Bạn chưa kết nối \(service) hoặc internet có vấn đề!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Đã Hiểu", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    
    }
    func ok(service:String){
        let alert = UIAlertController(title: "Ok", message: "Chia Sẽ \(service) Thành Công !", preferredStyle: .alert)
        let action = UIAlertAction(title: "Thanks", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return episodes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // quang ket qua cho episode hien thi ra mang hinh
        let cell = tableView.dequeueReusableCell(withIdentifier: "Episode Cell", for: indexPath) as! EpisodeTableViewCell
        let episode = self.episodes[indexPath.row]
        
        cell.episode = episode

        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:
        IndexPath)
    {
        let selectedEpisode = self.episodes[indexPath.row]
        
        // import SafariServices
        let safariVC = SFSafariViewController(url: selectedEpisode.url! as URL)
        safariVC.view.tintColor = UIColor(red: 248/255.0, green: 47/255.0, blue: 38/255.0, alpha: 1.0)
        safariVC.delegate = self
        self.present(safariVC, animated: true, completion: nil)
    }
    
    // MARK: - Target / Action
    
    @IBAction func fullBlogDidTap(_ sender: AnyObject)
    {
        let alertController = YBAlertController(title: "Xin Chào !", message: "Liên hệ với tôi qua facebook để biết thêm thông tin về app nhé", style: .actionSheet)
        
        alertController.addButton(UIImage(named: "comment"), title: "Xem Kênh Youtube đầy đủ") {
            // import SafariServices
            let safariVC = SFSafariViewController(url: URL(string: "https://www.youtube.com/channel/UCjsIuhbtDQny5lv4B2b2VOg")!)
            safariVC.view.tintColor = UIColor(red: 248/255.0, green: 47/255.0, blue: 38/255.0, alpha: 1.0)
            safariVC.delegate = self
            self.present(safariVC, animated: true, completion: nil)
        }
        
        alertController.addButton(UIImage(named: "tweet"), title: "Anh Duy Blog") {
            let safariVC = SFSafariViewController(url: URL(string: "https://www.facebook.com/ngo.a.duy")!)
            safariVC.view.tintColor = UIColor(red: 248/255.0, green: 47/255.0, blue: 38/255.0, alpha: 1.0)
            safariVC.delegate = self
            self.present(safariVC, animated: true, completion: nil)
            
        }
        
        alertController.addButton(UIImage(named: "facebook"), title: "Chia sẽ App với bạn bè trên Facebook  😎") {
        /*    let safariVC = SFSafariViewController(url: URL(string: "http://tech.agu.edu.vn")!)
            safariVC.view.tintColor = UIColor(red: 248/255.0, green: 47/255.0, blue: 38/255.0, alpha: 1.0)
            safariVC.delegate = self
            self.present(safariVC, animated: true, completion: nil)
 */
            // kiem tra dang ket noi tai khoan facebook hay chua
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook)
            {
                
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                
                post.setInitialText("Luyện nghe cách phát âm chuẩn với ứng dụng học tiếng anh trên smartphone 😊😎")
                post.add(URL(string: "https://www.youtube.com/watch?v=sWEInq3t96I&t=1474s&list=PLnwkiTgOYjUzqdx7n0z_Jz8GjjATrVqt5&index=1"))

            //    post.add(URL(named "")
                post.add(UIImage(named: "share.png"))
                self.present(post, animated: true, completion: nil)
                self.ok(service: "Facebook")

            }
            else
            {
                self.thongbao(service: "Facebook")
            }
            
            
        }
        
        alertController.touchingOutsideDismiss = true
        alertController.buttonIconColor = UIColor(red: 248/255.0, green: 47/255.0, blue: 38/255.0, alpha: 1.0)
        
        alertController.show()
    }
    
}

extension EpisodesTableViewController : SFSafariViewControllerDelegate
{
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
















