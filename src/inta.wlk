import plantas.*
import parcelas.*
object inta {
	var property parcelas= []
	
	method agregarParcela(parcela){
		parcelas.add(parcela)
	}
	method promedioParcelas(){
		return self.sumPar()/self. parcelasQueHay()
	}
	method sumPar(){
		return parcelas.sum({planta=>planta})
	}
	method parcelasQueHay(){
		return parcelas.size()
	}
	
	method masAutosustentable(){
		return self.parcelasQueHay()>4 and self.plastasbienMax()
	}
	
	method plastasbienMax(){
		return parcelas.max({planta=>planta.contains({parcela=>parcela.seAsociaBien(planta)})})
	}
}
