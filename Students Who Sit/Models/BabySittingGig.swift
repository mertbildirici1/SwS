import Foundation

struct BabysittingGig: Identifiable {
    var id: String
    var professorId: String
    var title: String
    var description: String
    var date: Date
    var duration: Int
    var payment: Double
}
