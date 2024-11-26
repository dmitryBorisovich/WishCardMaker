import UIKit

struct BackgroundPhoto {
    let imageSource: ImageSource
    let animal: Animal?
    let apiURL: String?
    let image: UIImage?
}

enum ImageSource {
    case url
    case system
}

enum Animal {
    case cat
    case dog
    case fox
    case duck
}
