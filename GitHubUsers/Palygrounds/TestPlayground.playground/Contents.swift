//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

//class MyViewController : UIViewController {
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
//        self.view = view
//    }
//}
// Present the view controller in the Live View window

let contentView = UIView(frame: CGRect(x: 100, y: 100, width: 300, height: 300))
contentView.backgroundColor = .systemBackground

let sut = AEItemInfoView(frame: .zero)
sut.count = 224
sut.title = "Amirreza Eghtedari asle yalghoozabadi to you baraye man"

sut.translatesAutoresizingMaskIntoConstraints = false
contentView.addSubview(sut)

NSLayoutConstraint.activate([
    sut.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
    sut.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
    sut.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
])

PlaygroundPage.current.liveView = contentView
