
import Foundation
protocol presenterdelegate{
    func setfinaldata(data:String, dictvalue:String)
}
class Presenter{
   let delegate:presenterdelegate
    private let model:ModelElement
    let data:String
    init(view: presenterdelegate, model: ModelElement,datanew:String) {
        self.delegate = view
        self.model = model
        self.data=datanew
    }
    var dictelement:String{
        get{
            if let see=model.someDict[data]{
            return see
            }
            return "nothing"
        }
    }
    func setting(){
        delegate.setfinaldata(data: data, dictvalue: dictelement)
    }
    
}
