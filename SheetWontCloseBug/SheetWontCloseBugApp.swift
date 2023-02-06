// there is a bug
// if you tap "Open Sheet"
// then tap "Select Day"
// then tap "Tap to Dismiss"
// the sheet will not close
// note that this bug doesn't occur when running in Simulator
// it will only happen when running on a device.

import SwiftUI

@main
struct SheetWontCloseBugApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct MyItem: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
  @State private var selection: MyItem? = nil
    var body: some View {
      VStack {
        Button("Open Sheet") {
          self.selection = MyItem(name: "doesn't matter")
        }
        .sheet(item: $selection,
               onDismiss: { print("finished!") },
               content: { MySheet(item: $0) })
      
        }
        .padding()
    }
}

struct MySheet: View {
  let item: MyItem
    @State private var day: String = ""
    @Environment (\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
          Spacer()
          Text("Item: \(item.name)")
          Menu(content: menuContents, label: menuLabel)
            Text("Drag down to dismiss..., or")
          Spacer()
					// won't work if the "Select Day" menu is open
          // and you're running on a device
          // it does work in the Simulator
            Text("Tap to Dismiss")
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
            }
          Spacer()
        }
    }
  @ViewBuilder func menuContents() -> some View {
      Button("Monday") { self.day = "Monday" }
      Button("Tuesday") { self.day = "Tuesday" }
  }
  
  @ViewBuilder func menuLabel() -> some View {
      HStack {
          Image(systemName: "calendar")
          Text("Select Day")
      }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
