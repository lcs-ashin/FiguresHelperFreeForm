//
//  OutputValueView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct OutputValueView: View {
    
    // MARK: Stored properties
    let value: Double?
    let suffix: String
    
    // MARK: Computed properties

    // When therebis a value to show, present it in a nicely formated manner
    // When there is NO value to show (nil) we will show an appropriATE ERROR MESSAGE
    var output: String {
        
        // Is there valid value to show?
        if let value = value {
            // Create a local string that is the formatted value
            let formattedValue = String(format: "%.1f", value)
            return "\(formattedValue) \(suffix)"
            
        } else{
            return "Cannot currently be computed"
        }
    }

    var body: some View {
        Text(output)
            .font(.title3)
            .bold()
    }
}

struct OutputValueView_Previews: PreviewProvider {
    static var previews: some View {
        OutputValueView(value: 12131.121,
                        suffix: "square units")
        OutputValueView(value: nil,
                        suffix: "square units")
    }
}
