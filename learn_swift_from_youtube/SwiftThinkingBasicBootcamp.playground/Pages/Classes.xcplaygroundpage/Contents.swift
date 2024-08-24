import Foundation

class ScreenViewModel {
    let title: String
    var showButton: Bool
    
    init(title: String, showButton: Bool) {
        self.title = title
        self.showButton = showButton
    }
    
    deinit {
            
    }
}


let viewModel: ScreenViewModel = ScreenViewModel(title: "Screen 1", showButton: true)
viewModel.showButton = false

print(viewModel.showButton)
