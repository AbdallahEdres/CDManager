# CDManager

CDManager is a lightweight, generic, and highly clean-architecture–friendly Core Data manager built to simplify CRUD operations, filtering, and predicate building.

It aims to eliminate repetitive boilerplate and provide a clean, expressive, and scalable API for handling Core Data in iOS & macOS apps.

---

## ✨ Features

- Generic Repository (CRUD) using `CDDataSource<T>`
- Clean & testable Core Data layer
- `ManagedEntity` protocol for clean entity setup
- Powerful `NSPredicate` extensions (contains, beginsWith, in, between, any/all…)
- Supports sorting, dynamic filtering, and get-by-id
- Fully compatible with SwiftUI, MVVM, Clean Architecture, and Combine
- Designed for modular and large-scale apps
- Zero dependencies — pure Swift + Core Data

---

## 👨‍💻 About the Author

**Created by: Abdallah Edres**  
iOS Developer specializing in Swift, SwiftUI, Clean Architecture, Combine, and Networking.

Focused on:
- High-performance architectures
- Reusable Swift Packages
- Clean, maintainable Core Data layers
- Production-grade modular iOS development

---

## 📦 Installation (Swift Package Manager)

Add the package to your Xcode project:

```
https://github.com/AbdallahEdres/CDManager.git
```

Or inside `Package.swift`:

```swift
.package(url: "https://github.com/AbdallahEdres/CDManager.git", from: "1.0.0")
```

---

# 📚 Usage Guide
Below is a complete explanation of how to use CDManager.

---

## 🏛 1. Define Your Entities

```swift
import CoreData
import CDManager

@objc(TodoEntity)
public class TodoEntity: NSManagedObject, ManagedEntity {
    @NSManaged public var id: UUID
    @NSManaged public var title: String
    @NSManaged public var date: Date
}
```

---
Or simply let Xcode generate the entities, and then just extend them to conform to ManagedEntity
```swift

extension TodoEntity: ManagedEntity {}

```

---

## 🗃 2. Initialize the Repository

```swift
let container = NSPersistentContainer(name: "MyModel")
container.loadPersistentStores { _, _ in }

let repo = CDDataSource<TodoEntity>(context: container.viewContext)
```

---

## ✍️ 3. Create Item

```swift
let newItem = try? repo.create { item in
    item.id = UUID()
    item.title = "Buy Groceries"
    item.date = Date()
}
```

---

## ✏️ 4. Edit Item

```swift
try? repo.edit(existingItem) { item in
    item.title = "Buy Groceries + Vegetables"
}
```

---

## 🗑 5. Delete Item

```swift
try? repo.delete(existingItem)
```

---

## 📥 6. Fetch All Items

```swift
let all = try? repo.getAll(
    sort: [NSSortDescriptor(key: "date", ascending: true)]
)
```

---

## 🔍 7. Fetch by UUID

```swift
let item = try? repo.get(by: someUUID)
```

---

## 🧪 8. Filtering with Predicates

### Contains
```swift
repo.filter(.contains("title", "buy"))
```

### Between
```swift
repo.filter(.between("date", startDate, endDate))
```

### IN list
```swift
repo.filter(.in("id", listOfIDs))
```

### ANY relationship
```swift
repo.filter(
    .any("tags", satisfies: .where("name", isEqual: "urgent"))
)
```

### AND
```swift
repo.filter(
    .and(
        .contains("title", "task"),
        .greaterThan("date", yesterday)
    )
)
```

---

# 🧩 Clean Architecture Usage Example

```swift
final class TodoViewModel: ObservableObject {

    private let repo: CDDataSource<TodoEntity>
    @Published var todos: [TodoEntity] = []

    init(repo: CDDataSource<TodoEntity>) {
        self.repo = repo
        fetchTodos()
    }

    func fetchTodos() {
        todos = (try? repo.getAll()) ?? []
    }
}
```

---

# 🧪 Unit Testing (In-memory Core Data)

```swift
func makeTestContainer() -> NSPersistentContainer {
    let container = NSPersistentContainer(name: "MyModel")
    let desc = NSPersistentStoreDescription()
    desc.type = NSInMemoryStoreType
    container.persistentStoreDescriptions = [desc]
    container.loadPersistentStores { _, _ in }
    return container
}
```

---

# ❤️ Contributing
Pull requests are welcome! If you’d like to enhance the package, feel free to contribute.

---

# 📄 License
MIT License
