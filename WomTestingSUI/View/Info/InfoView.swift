//
//  InfoView.swift
//  WomTestingSUI
//
//  Created by Jose David Bustos H on 22-07-24.
//
import SwiftUI

struct InfoView: View {
    // Información de la aplicación
    let appName = "Wom-testing"
    let appType = "Testing"
    let language = "SwiftUI"
    let creationDate = "22-07-24"
    let email = "kor@hotmail.com"

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("App Information")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            Group {
                Text("Nombre de la App:")
                    .font(.headline)
                Text(appName)
                    .font(.body)
                
                Text("Tipo de App:")
                    .font(.headline)
                Text(appType)
                    .font(.body)
                
                Text("Lenguaje de la App:")
                    .font(.headline)
                Text(language)
                    .font(.body)
                
                Text("Fecha de Creación:")
                    .font(.headline)
                Text(creationDate)
                    .font(.body)
                
                Text("Correo Electrónico:")
                    .font(.headline)
                Text(email)
                    .font(.body)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
