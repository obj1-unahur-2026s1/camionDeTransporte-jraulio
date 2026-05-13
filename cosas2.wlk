object knightRider {
    
    method peso() {
      return 500
    }

    method nivelDePeligrosidad() {
      return 10
    }
}

object bumblebee {

    var formaActual = auto

     method peso() {
      return 800
    }

    method nivelDePeligrosidad() {
      return formaActual.nivel()
    }

    method cambiarForma(forma) {
      formaActual = forma
    }
  
}

object auto {
  method nivel() {
    return 15
  }
}
object robot {
    method nivel() {
      return 30
    }
}

object paqueteDeLadrillos {

    var cantidad = 10

     method peso() {
      return 2 * cantidad
    }

    method nivelDePeligrosidad() {
      return 2
    }

    method cambiarCantidad(cantLad) {
      cantidad = cantLad
    }
  
}

object arenaAGranel {

    var property peso = 10


    method nivelDePeligrosidad() {
      return 1
    }
  
}

object bateria {

    var estaConMisiles = false
    
    method peso() = if (estaConMisiles) 300 else 200

    method nivelDePeligrosidad() {
      return  (if (estaConMisiles) 300 else 200)
    }

    method cargarYDescargarMisiles() {
      estaConMisiles = !estaConMisiles
    }
}

object contenedor {

    const cosasContenidas = []

    method peso() {
      return 100 + self.pesoDeCosasContenidas()
    }

    method pesoDeCosasContenidas() {
      return cosasContenidas.sum({c => c.peso()})
    }

    method nivelDePeligrosidad() {
      return (if (cosasContenidas.isEmpty()) 0 else cosasContenidas.max({c => c.nivelDePeligrosidad()}).nivelDePeligrosidad())
    }

    method meterCosa(listaDeCosas) {
      cosasContenidas.addAll(listaDeCosas)
    }
  
}

object residuos {
    var property peso = 10

    method nivelDePeligrosidad() {
      return 200
    }
  
}

object embalaje {

    var cosaQueEnvuelve = residuos

    method peso() {
      return cosaQueEnvuelve.peso()
    }

    method nivelDePeligroisdad() {
      return cosaQueEnvuelve.nivelDePeligroisdad() * 0.5
    }

    method cambiarCosa(nuevaCosa) {
      cosaQueEnvuelve = nuevaCosa
    }
  
}