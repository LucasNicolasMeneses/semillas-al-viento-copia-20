import plantas.*

class Parcela {
	var property ancho 
	var property largo
	var property solDiario
	var property plantas = [] 
	
	
	method superficie(){
		return self.ancho() * self.largo()
	}
	method cantidadMaxima(){
		if (self.ancho()>self.largo()){
			return self.superficie()/5
		}else { return self.superficie()/ 3 + self.largo()}
	}
	method tieneSangreJoven(){
		return plantas.any({planta=>planta.anioDeObtencion()>2012})
	}

	method  plantarUnaPlanta(planta){
		if (  self.cantidadMaxima() ){
			self.plantar(planta)
		} else { self.error("no se permite plantar en parcela")}
			
	}
	method plantar(planta){
		plantas.add(planta)
	}
}

class ParcelaEcologica inherits Parcela {
	method seAsociaBien(planta){
		return self.tieneSangreJoven() and planta.parcelaIdeal()
	}
	
}

class ParcelaIndustrial inherits Parcela {
		method seAsociaBien(planta){
			return self.cantidadMaxima().size()==2 and planta.esFuerte()
		}
}

