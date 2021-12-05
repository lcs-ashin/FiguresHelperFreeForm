//
//  ParallelogramView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct ParallelogramView: View {
    
    // MARK: Stored properties
    @State var providedBase = ""
    @State var h = 10.0
    @State var c = 10.0

    // MARK: Computed properties
    // Base
    var base: Double? {
        guard let base = Double(providedBase),
                base > 0
        else {
            return nil
            
        }
        return base
    }
    
    var area: Double {
        return b * h
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                DiagramView(image: "parallelogram",
                            horizontalPadding: 50)
                
                
                // Base
                Group {
                    
                    SectionLabelView(text: "Base", variable: "b")

                    // Input: Base
                    TextField("Base",
                              text: $providedBase,
                              prompt: Text("Numeric value greater than 0"))
                        .foregroundColor(base == nil ? Color.red : Color.primary)
                    
//                    // Output: Base
//                    SliderValueView(value: base)

                }
                
                // Height
                Group {
                    
                    SectionLabelView(text: "Height", variable: "h")

                    // Input: Height
                    Slider(value: $h,
                           in: 0.0...100.0,
                           step: 0.1,
                           label: {
                        Text("Height")
                    },
                           minimumValueLabel: {
                        Text("0")
                    },
                           maximumValueLabel: {
                        Text("100")
                    })
                    
                    // Output: Base
                    SliderValueView(value: h)

                }

                // Diagonal
                Group {
                    
                    SectionLabelView(text: "Diagonal", variable: "c")

                    // Input: Height
                    Slider(value: $c,
                           in: 0.0...100.0,
                           step: 0.1,
                           label: {
                        Text("Height")
                    },
                           minimumValueLabel: {
                        Text("0")
                    },
                           maximumValueLabel: {
                        Text("100")
                    })
                    
                    // Output: Base
                    SliderValueView(value: c)

                }

                SectionLabelView(text: "Area", variable: "a")
                
                // Output: Area
                OutputValueView(value: area, suffix: "square units")
                
            }
            
        }
        .navigationTitle("Parallelogram")
        .padding()
    }
}

struct ParallelogramView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ParallelogramView()
        }
    }
}
