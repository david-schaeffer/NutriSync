import UIKit

class LogEventViewController: UIViewController {
    
    var logEventView: LogEventView!
    
    override func loadView() {
        self.logEventView = LogEventView()
        view = logEventView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
