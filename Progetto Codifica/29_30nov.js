//dichiarazione variabili 
var i;
var allspan=document.getElementsByTagName("span","#mostratesto");

function gestoreLoad(){
	$("#contienitesto").html("Passa il mouse sopra l'immagine per leggere il testo estratto").addClass("placeholder");
	$(".nascosto").remove();
	

	//mostra testo di riga 
	$('#mostratesto').html($('#frasi').html().replace(/<br>\\*/g,"</span><span>"));
	$('span:empty').remove();//elimina span vuoti 
	var paragrafi = $('#mostratesto').children('span')
	//assegno id e class agli span contenenti righe di testo 
	var identifica=0;
	var classe="spantooltip";
	for (i=0;i<paragrafi.length;i++){
		paragrafi[i].setAttribute("id", identifica);
		paragrafi[i].setAttribute("class", classe);
		identifica=identifica + 1; }
	
	

	// al mouse over sull'immagine segue la visualizzazione della riga di testo 
	$("area").mouseover(function(){
		var currentID=correctspan(this);
		var correctSpan;
		var id;
		var correctarea=selectarea(currentID);
		for(i=0;i<allspan.length;i++){
			id=allspan[i].getAttribute("id");
			if(id==currentID){
				correctSpan=allspan[i];}
		}
		var spantext=$(correctSpan).html();
		console.log(spantext);
		$("#contienitesto").html(spantext);
	});

	$("area").mouseout(function(){
		$("#contienitesto").text("");
	});
}


//seleziona area
function selectarea(id){
	var allareas=document.getElementsByTagName("area");
	var area=allareas[id];
	return area;}



//funzione associa area dell'immagine - testo riga (span)
function correctspan(area){
	var correctID;
	var currentclass=area.getAttribute("class");
	var idA=area.getAttribute("id");
	var idS;
	if (currentclass=="classearea1"){
		idA=area.getAttribute("id"); }
	else {
		idA=area.getAttribute("id");
		idA=Number(idA);
		idA=idA+21;	}
	for (i=0;i<allspan.length;i++){
		idS=allspan[i].getAttribute("id");
		if(idS==idA){
			correctID=idS;}
	} return(correctID);
}

// utilizzo della libreria maphilight
$(function(){
	$('.map').maphilight();
});

//richiamo funzioni al caricamento della pagina
window.onload=gestoreLoad;






