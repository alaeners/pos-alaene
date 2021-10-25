//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = getStatusData()
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
    
    func getStatusData() -> String {
        let currentDate = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.string(from: currentDate)
        
        print("date: \(currentDate)")
        let currentDateString = String(describing: currentDate)
        formattedStringData(date: currentDateString )
        
        return currentDateString
    }
    
     func formattedStringData(date: String) -> String {
        var stringDate = date
        stringDate.removeLast(14)
        
        print("date: \(stringDate)")
        return stringDate.replacingOccurrences(of: "-", with: "/")
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
