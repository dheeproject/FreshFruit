

import UIKit

class ViewController: UIViewController {
//  let dataArray=["Apple","Banana","Orange","WaterMelon","Grapes","Kiwi","Peach"]
    let data=ModelElement()
    var eswidth=160
    var cellmargin=10.0
    var presentit:Presenter?
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.collectionView.dataSource=self
        self.collectionView.delegate=self
        self.collectionView.register(UINib(nibName: "NewCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewItemCell")
        self.setupgridview()
    }
    func setupgridview(){
        let flow=collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing=CGFloat(self.cellmargin)
        flow.minimumLineSpacing=CGFloat(self.cellmargin)

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupgridview()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

}
extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "NewItemCell", for: indexPath) as! NewCellCollectionViewCell
        presentit=Presenter(view: cell, model: data, datanew:data.dataArray[indexPath.row])
        presentit?.setting()
        return cell
    }
}
extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width=self.claculatewidth()
        return CGSize(width: width, height: width+50)
    }
    func claculatewidth()->CGFloat{
        let estimatewidth=CGFloat(eswidth)
        let cellcount=floor(CGFloat(self.view.frame.size.width/estimatewidth))
        let margin=CGFloat(cellmargin*2)
        let width=(self.view.frame.size.width-CGFloat(cellmargin)*(cellcount-1)-margin)/cellcount
        return width
    }
}
