//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Talita Groppo on 04/03/2021.
//
import CoreData
import SwiftUI

struct FilteredList<Country: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<Country>
    var countries: FetchedResults<Country> { fetchRequest.wrappedValue }
    let content: (Country) -> Content
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { countries in
            self.content(countries)
            }
        }
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (Country) -> Content) {
        fetchRequest = FetchRequest<Country>(entity: Country.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
    }
