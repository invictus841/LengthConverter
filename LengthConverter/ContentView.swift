//
//  ContentView.swift
//  LengthConverter
//
//  Created by Alexandre Talatinian on 23/05/2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var lengthToConvert = 0.00
    @State private var currentUnit = "m"
    @State private var chosenUnit = "km"
    @FocusState private var lengthIsFocused : Bool
    
    let listOfUnits = ["ft", "yds", "m", "km", "mi"]
    
    var convertedLength : Double {
        // convert units
        let distanceToConvert = lengthToConvert
        
        var convertedResult = 0.00
        
        let conversionToMeter : Double
        
        if currentUnit == "ft" {
            conversionToMeter = distanceToConvert * 0.3048
        } else if currentUnit == "yds" {
            conversionToMeter = distanceToConvert * 0.9144
        } else if currentUnit == "m" {
            conversionToMeter = distanceToConvert
        } else if currentUnit == "km" {
            conversionToMeter = distanceToConvert * 1000
        } else if currentUnit == "mi" {
            conversionToMeter = distanceToConvert * 1609
        } else {
            return distanceToConvert
        }
        
        if chosenUnit == currentUnit {
            convertedResult = distanceToConvert
        } else if chosenUnit == "ft" {
            convertedResult = conversionToMeter * 3.280
        } else if chosenUnit == "yds" {
            convertedResult = conversionToMeter * 1.093
        } else if chosenUnit == "m" {
            convertedResult = conversionToMeter
        } else if chosenUnit == "km" {
            convertedResult = conversionToMeter * 0.001
        } else if chosenUnit == "mi" {
            convertedResult = conversionToMeter * 0.00062
        }
        
        return convertedResult
    }
    
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Current Unit", selection: $currentUnit) {
                        ForEach(listOfUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("WHAT IS YOUR CURRENT UNIT?")
                }//: SECTION 1
                
                Section {
                    Picker("Current Unit", selection: $chosenUnit) {
                        ForEach(listOfUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("CHOOSE YOUR CONVERSION UNIT:")
                }//: SECTION 2
                
                Section {
                    TextField("Length", value: $lengthToConvert, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($lengthIsFocused)
                } header: {
                    Text("Amount to convert:")
                } //: SECTION 3
                
                Section {
                    // DISPLAY RESULT
                    Text(convertedLength.formatted())
                } header: {
                    Text("CONVERTED RESULT:")
                } //: SECTION 4
            } //: FORM
            .navigationTitle("LengthConverter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    //Spacer()
                    
                    Button("Done") {
                        lengthIsFocused = false
                    }
                }
            }
        } //: NAVIGATION
    }
}



// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
