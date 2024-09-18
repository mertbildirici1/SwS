import Firebase

class FirebaseService {
    static let shared = FirebaseService()
    
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let result = result {
                // Fetch user from Firestore
                let db = Firestore.firestore()
                db.collection("users").document(result.user.uid).getDocument { snapshot, error in
                    if let error = error {
                        completion(.failure(error))
                        return
                    }
                    
                    if let data = snapshot?.data() {
                        let user = User(id: result.user.uid, name: data["name"] as? String ?? "", email: result.user.email ?? "", userType: UserType(rawValue: data["userType"] as? String ?? "student") ?? .student, isVerified: data["isVerified"] as? Bool ?? false)
                        completion(.success(user))
                    }
                }
            }
        }
    }
}
