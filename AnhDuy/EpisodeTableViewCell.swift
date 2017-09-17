
import UIKit

class EpisodeTableViewCell: UITableViewCell
{
    var episode: Episode! {
        didSet {
            self.updateUI()
        }
    }
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var backgroundCardView: UIView!
    
    func updateUI()
    {
        titleLabel.text = episode.title
        authorImageView.image = UIImage(named: "duc")
        descriptionLabel.text = episode.description
        createdAtLabel.text = "Anh Duy | \(episode.createdAt!)"
        
        let thumbnailURL = episode.thumbnailURL
        let networkService = NetworkService(url: thumbnailURL!)
        networkService.downloadImage { (imageData) in
            let image = UIImage(data: imageData as Data)
            DispatchQueue.main.async(execute: {
                self.thumbnailImageView.image = image
            })
        }
        // bo tron avatar con meo
        authorImageView.layer.cornerRadius = authorImageView.bounds.width / 2.0
        authorImageView.layer.masksToBounds = true
        authorImageView.layer.borderColor = UIColor.white.cgColor
        authorImageView.layer.borderWidth = 1.0
        
        //tao do bong shadow cho background       
        backgroundCardView.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        
        backgroundCardView.layer.cornerRadius = 3.0
        backgroundCardView.layer.masksToBounds = false
        
        backgroundCardView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        
        backgroundCardView.layer.shadowOffset = CGSize(width: 0, height: 0)
        backgroundCardView.layer.shadowOpacity = 0.8

    }
}





















