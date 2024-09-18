import Foundation
import FirebaseFirestore

class HomeViewModel: ObservableObject {
    @Published var gigs: [BabysittingGig] = []
    
    private var db = Firestore.firestore()
    
    func fetchGigs() {
        db.collection("gigs").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching gigs: \(error)")
                return
            }
            
            if let snapshot = snapshot {
                self.gigs = snapshot.documents.compactMap { doc -> BabysittingGig? in
                    let data = doc.data()
                    guard let title = data["title"] as? String,
                          let description = data["description"] as? String,
                          let date = (data["date"] as? Timestamp)?.dateValue(),
                          let duration = data["duration"] as? Int,
                          let payment = data["payment"] as? Double,
                          let professorId = data["professorId"] as? String else { return nil }
                    
                    return BabysittingGig(id: doc.documentID, professorId: professorId, title: title, description: description, date: date, duration: duration, payment: payment)
                }
            }
        }
    }
}
