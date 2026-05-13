object camion {
    const cosasCargadas = []

    method cargarCosa(cosa) {
      cosasCargadas.add(cosa)
    }

    method descargarCosa(cosa) {
      cosasCargadas.remove(cosa)
    }

    method cargarCosas(lista) {
      cosasCargadas.addAll(lista)
    }

    method peso() {
      return 1000 + cosasCargadas.sum({c => c.peso()})
    }

    method todosLosPesosSonPares() {
      return cosasCargadas.all({ c => c.peso().even()})
    }

    method hayALgunaCargaQuePesa(peso) {
      return cosasCargadas.any({c => c.peso() == peso})
    }

    method primeraConNivelIgualA(peligrosidad) {
      return cosasCargadas.findOrDefault({c => c.nivelDePeligrosidad() == peligrosidad}, "No hay cosa")
    }

    method cosasMasPeligrosasQue(peligrosidad) {
      return cosasCargadas.filter({c => c.nivelDePeligrosidad() > peligrosidad})
    }

    method cosasQueSuperanPeligrosidadDe(cosa) {
      return self.cosasMasPeligrosasQue(cosa.nivelDePeligrosidad())
    }

    method estaExcedidoDePeso() {
      return self.peso() > 2500
    }

    method puedeCircular(nivelMaximo) {
      return !self.estaExcedidoDePeso() and self.cosasMasPeligrosasQue(nivelMaximo).isEmpty()
    }

    method algunaCargaPesaEntre(min, max) {
      return cosasCargadas.any({c => c.peso().between(min, max)})
    }

    method laCosaMasPesada() {
      return cosasCargadas.max({ c => c.peso()})
    }

}