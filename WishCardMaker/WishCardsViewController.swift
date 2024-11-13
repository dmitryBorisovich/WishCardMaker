import UIKit

final class WishCardsViewController: UIViewController {
    
    private let cardsName: [String] = Array(0..<2).map { "\($0)" }
    
        
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 200
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension WishCardsViewController: UITableViewDelegate {
    
    // метод, отвечающий за действие по нажатию на ячейку
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) { }
    
    // метод, вычисляющий высоту ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let image = UIImage(named: cardsName[indexPath.row]) else { return 0 }
        
        let imageInsets = UIEdgeInsets(top: 36, left: 16, bottom: 4, right: 16)
        
        let imageViewWidth = tableView.bounds.width - imageInsets.left - imageInsets.right
        let scaleFactor = imageViewWidth / image.size.width
        
        return image.size.height * scaleFactor + imageInsets.top + imageInsets.bottom
    }
}

extension WishCardsViewController: UITableViewDataSource {
    
    // метод, определяющий кол-во ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 
        return cardsName.count
    }
    
    // метод, возвращающий ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { 
        
        let cell = tableView.dequeueReusableCell(withIdentifier: WishCardCell.reusedIdentifier, for: indexPath)
        guard let wishCardCell = cell as? WishCardCell else {
            print(">>> cell casting failed")
            return UITableViewCell()
        }
        
        wishCardCell.configureCell(with: indexPath)
        return wishCardCell
    }
    
    func configCell(for cell: WishCardCell) { }
}
