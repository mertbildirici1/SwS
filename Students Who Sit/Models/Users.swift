import Foundation

struct User: Identifiable {
    var id: String
    var name: String
    var email: String
    var userType: UserType
    var rating: Double?
    var isVerified: Bool
}

enum UserType {
    case professor
    case student
}
