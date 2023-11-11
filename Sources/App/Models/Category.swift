//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//

import Vapor
import Fluent

/// `Category` represents a category for items in the system.
///
/// This class is a model used for organizing items into different categories, such as food or drinks, in a database using Fluent in Vapor. It includes the category's name, position, description, and type.
///
/// Properties:
///   - id: UUID? - A unique identifier for the category. Optional, as it may not be set before the object is saved to the database.
///   - name: String - The name of the category.
///   - position: Int - A numerical position or order for the category, potentially used for sorting or display purposes.
///   - description: String? - An optional description of the category.
///   - type: CategoryType - An enum value representing the type of the category (e.g., food, drinks).
///   - items: [Item] - A children relationship indicating the items that belong to this category.
///   - createdAt: Date? - A timestamp indicating when this category was created. Automatically set on creation.
///   - updatedAt: Date? - A timestamp indicating when this category was last updated. Automatically set on update.
///
/// Initialization:
///   - An empty initializer for Fluent.
///   - An initializer with parameters for manual object creation, allowing the specification of the category's properties.
///
/// CategoryType:
///   - An enum used to specify the types of categories available, such as ``CategoryType/food`` or ``CategoryType/drinks``.
///
/// Example Usage:
/// ```
/// let newCategory = Category(name: "Desserts", position: 2, description: "Sweet treats", type: .food)
/// ```
///
/// - Note: The `items` relationship links ``Category`` to multiple ``Item`` instances, enabling the categorization of items.
final class Category: Model, Content {
    static let schema = "categories"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "position")
    var position: Int
    
    @Field(key: "description")
    var description: String?
    
    @Enum(key: "type")
    var type: CategoryType
    
    @Children(for: \.$category)
    var items: [Item]
    
    // When this Category was created.
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    // When this Category was last updated.
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, name: String, position: Int, description: String?, type: CategoryType) {
        self.id = id
        self.name = name
        self.position = position
        self.description = description
        self.type = type
    }
}

enum CategoryType: String, Codable {
    case food
    case drinks
}

