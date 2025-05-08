object knightRider {
    
    method peso() = 500

    method nivelDePeligro() = 10
}

object bumblebee {

    var esUnRobot = true
  
  method peso() = 800

  method nivelDePeligro() {
        return
            if(esUnRobot) {
                30
            }
            else 15
    }

    method transformarse() {
        esUnRobot = not esUnRobot
    }
}

object paqueteDeLadrillos {

    var cantidadDeLadrillos = 1

    method peso() = cantidadDeLadrillos * 2

    method nivelDePeligro() = 2

    method cantidadDeLadrillos(cantidad) {
        cantidadDeLadrillos = cantidad
    }

}

object arenaGranel {

    var peso = 10

    method peso() = peso

    method nivelDePeligro() = 1

    method peso(pesoNuevo) {
        peso= pesoNuevo
    }

}

object bateriaAntiarea {
  
  var tieneMisiles = false

  method peso() = if (tieneMisiles) 300 else 200

  method nivelDePeligro() = if (tieneMisiles) 100 else 0

  method cambiarMisiles() {
    tieneMisiles = not tieneMisiles
  }
}

object contenedor {

    const cosas = []
    const peso = 100

    method peso() = peso + cosas.sum({c=>c.peso()})

    method nivelDePeligro() {
        return
            if(cosas.isEmpty()) {
                0
            }
            else {
                cosas.max({c=>c.nivelDePeligro()}).nivelDePeligro()
            }
    }

    method cargarCosa(cosa) {
        cosas.add(cosa)
    }
}

object residuos {
    var peso = 10

    method peso() = peso

    method nivelDePeligro() = 200

    method peso(pesoNuevo) {
        peso= pesoNuevo
    }
}

object embalaje {
    var cosaEnvuelta = residuos

    method peso() = cosaEnvuelta.peso()

    method nivelDePeligro() = cosaEnvuelta.nivelDePeligro() / 2

    method envolverOtraCosa(cosaNueva) {
        cosaEnvuelta = cosaNueva
    }

}