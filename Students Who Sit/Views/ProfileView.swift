import SwiftUI

struct ProfileView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var userType: UserType = .student
    
    var body: some View {
        Form {
            Section(header: Text("User Information")) {
                TextField("Name", text: $name)
                TextField("Email", text: $email)
                Picker("Role", selection: $userType) {
                    Text("Professor").tag(UserType.professor)
                    Text("Student").tag(UserType.student)
                }
            }
            
            Button(action: {
                // Save profile changes
            }) {
                Text("Save Changes")
            }
        }
        .navigationTitle("Profile")
    }
}
