import SwiftUI

struct GigDetailView: View {
    var gig: BabysittingGig  // This gig data will be passed in
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(gig.title)
                .font(.largeTitle)
                .bold()
            
            Text("Description:")
                .font(.headline)
            Text(gig.description)
                .font(.body)
            
            Text("Date:")
                .font(.headline)
            Text(gig.date, style: .date)
            
            Text("Duration: \(gig.duration) hours")
            
            Text("Payment: $\(gig.payment, specifier: "%.2f")")
            
            Spacer()
        }
        .padding()
        .navigationTitle("Gig Details")
    }
}
