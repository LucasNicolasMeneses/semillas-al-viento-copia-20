import parcelas.*

class Planta {
	  var property anioDeObtencion 
	  var property altura 
	  var property toleranciaPromedio =7
	  var property parcela 
	  method toleranciaAlSolHS(){
	  	return toleranciaPromedio
	  }
	  
	  method esFuerte(){
	  return self.toleranciaAlSolHS()>9}
	  
	  method daNuevasSemillas(){
	  	return self.esFuerte()
	  }
	  
	  method espacio()
}

class Menta inherits Planta {
	 
	 override  method espacio(){
	 	return self.altura()*3	 }
	 
	 override method daNuevasSemillas(){
	 	return super() or self.espacio()>1
	 }
	 method parcelaIdeal(){
	 	return parcela.superficie()>6
	 }
}

class Soja inherits Planta {
	override method toleranciaAlSolHS(){
		return self.condicionSoja() 
		         		
	}
	
	method condicionSoja(){
		if (self.altura()<0.5){
			 return 6
		}
		if (self.altura().between(0.5,1)){
			return 8
		}
		else { return 12}
	}
	
	override method daNuevasSemillas(){
		return super() or self .anioDeObtencion()>2007 and self.altura().between(0.75 , 0.9)
	}
	
	override method espacio(){
		return self.altura()/2
	}
	
	method parcelaIdeal(){
		return self.toleranciaAlSolHS()== parcela.solDiario()
	}
	
}

class Quinoa inherits Planta {
	var property espacioQ 
	
	override method toleranciaAlSolHS() {
		if (self.espacio()< 0.3){
			return 10
		}else {return self.toleranciaPromedio()}
	}
	
	override method  daNuevasSemillas(){
	return	super() or self.anioDeObtencion().between(2001,2008)
	}
	override method espacio() {
		return self.espacioQ()
	}
	method parcelaIdeal(){
		return parcela.plantas({planta=>planta.altura()<1.5})
	}
}
//2 Variedades
class SojaTrans inherits Soja{
	override method  daNuevasSemillas(){
		return false
	}
	override method parcelaIdeal(){
		return parcela.plantas().size()==1
	}
}

class Hierbabuena inherits Menta {
	override method  espacio(){
		 return super()*2
	}
}
 
