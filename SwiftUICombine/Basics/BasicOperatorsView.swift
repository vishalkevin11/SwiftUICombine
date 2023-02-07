//
//  BasicOperatorsView.swift
//  SwiftUICombine
//
//  Created by Kevin.Saldanha on 06/02/23.
//

import SwiftUI

struct BasicOperatorsView: View {
    
    func printNonNull() {
        let alphas = ["A",nil,"B","C","D","E", nil]
        
        //With nil
//        alphas.publisher.sink { alpha in
//            print("\(alpha)")
//        }
        
        alphas.publisher.replaceNil(with: "").map({$0!}).sink { alpha in
               print("\(alpha)")
        }
    }
    
    var body: some View {
        return Text("Basic Operators")
            .onAppear {
             printNonNull()
            }
    }
}


struct BasicOperatorsView_Previews: PreviewProvider {
    static var previews: some View {
        BasicOperatorsView()
    }
}
