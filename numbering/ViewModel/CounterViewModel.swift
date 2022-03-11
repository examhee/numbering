import Combine

enum CheckResults {
    case lower, equal, heigher
}
final class CounterViewModel: ObservableObject {
    @Published var count: Int = 0
    @Published var secret = Int.random(in: -100...100)
    var checkResults: CheckResults {
        if count > secret { return .heigher }
        else if count < secret { return .lower }
        return .equal
    }
    
    enum Input {
        case incresement
        case decresement
        case restart
    }
    
    func apply(_ input: Input) {
        switch input {
        case .incresement:
            count += 1
        case .decresement:
            count -= 1
        case .restart:
            secret = Int.random(in: -100...100)
        }
    }
}
