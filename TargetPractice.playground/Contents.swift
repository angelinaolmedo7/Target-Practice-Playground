import UIKit
import PlaygroundSupport

class ButtonWithCount : UIButton {
    
    var values : [String : Any]!
    
    required init(_ dict: [String : Any]=["count": 0]) {
        super.init(frame: .zero)
        self.values = dict
        self.setTitleColor(.black, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class ButtonViewController : UIViewController {

    var counter = 0

    var label : UILabel!
    var button : ButtonWithCount!
    var button2 : ButtonWithCount!

    override func loadView() {

        // UI
        let view = UIView()
        view.backgroundColor = .white

        label = UILabel()
        label.text = "Counter: \(counter)"

        button = ButtonWithCount(["count": 1])
//        button.tag = 10
        button.setTitle("Increment by 1", for: .normal)
        button.tintColor = .systemPurple
        //Add target
        button.addTarget(self, action: #selector(updateView), for: .touchUpInside)
        
        //second button
        button2 = ButtonWithCount(["count": 10])
//        button.tag = 10
        button2.setTitle("Increment by 10", for: .normal)
        button2.tintColor = .systemPurple
        //Add target
        button2.addTarget(self, action: #selector(updateView), for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(button2)

        // Layout
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20),
            button.firstBaselineAnchor.constraint(equalTo: label.firstBaselineAnchor),
            button2.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20),
            button2.firstBaselineAnchor.constraint(equalTo: label.firstBaselineAnchor, constant: 40)
        ])

        self.view = view
    }
    
    @objc func updateView(_ sender: ButtonWithCount) {
        let otherNumber = sender.values["count"] as! Int
        counter += otherNumber
        label.text = "Counter: \(counter)"
    }
}

PlaygroundPage.current.liveView = ButtonViewController()
