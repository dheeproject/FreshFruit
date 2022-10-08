

import UIKit

class NewCellCollectionViewCell: UICollectionViewCell, presenterdelegate{

    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var smallImageView: UIImageView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var BigImageView: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    let modeldata=ModelElement()
    func setfinaldata(data:String,dictvalue:String)
    {
        label1.text=data
        BigImageView.image=UIImage(named: data)
        label2.text="Rich in \(dictvalue)"
        label3.text="Buy \(data)"
    }
}
