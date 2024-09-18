import SwiftUI

struct HomeView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            List(homeViewModel.gigs) { gig in
                NavigationLink(destination: GigDetailView(gig: gig)) {
                    GigRowView(gig: gig)
                }
            }
            .navigationTitle("Available Gigs")
            .onAppear {
                homeViewModel.fetchGigs()
            }
        }
    }
}
