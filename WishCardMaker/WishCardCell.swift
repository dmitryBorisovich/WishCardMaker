import UIKit

final class WishCardCell: UITableViewCell {
    
    static let reusedIdentifier = "cardCell"
    
    @IBOutlet private weak var cellImageView: UIImageView!
    @IBOutlet private weak var cellCardNameLabel: UILabel!
    
    func configureCell(with index: IndexPath) {
        
        guard let cellImage = UIImage(named: "\(index.row)") else { return }
        cellImageView.image = cellImage
        
        self.selectionStyle = .none
    }
}
