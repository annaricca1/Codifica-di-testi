function gestoreLoad (){
	$("#contienitesto").html("Passa il mouse sopra le scritte colorate riportanti nomi di persone, città e organizzazioni per scoprirne i dettagli").addClass("placeholder");
    $(".nascosto").remove();

	//nascondo le descrizioni
	$(".descOrg").css("display","none");
	$(".descPerson").css("display","none");
	$(".descPlace").css("display","none");


    // Funzione per mostrare la descrizione dell'ORGANIZZAZIONE
    function showOrgDescription(event) {
        var targetOrg = event.target;
        var descOrg = targetOrg.querySelector('.descOrg');
        var contienitesto = document.getElementById('contienitesto');
        contienitesto.innerHTML = descOrg.innerHTML;
    }
    // Funzione per nascondere 
    function hideOrgDescription() {
        var contienitesto = document.getElementById('contienitesto');
        contienitesto.innerHTML = ''; 
    }
    var coloratoOrgElements = document.querySelectorAll('.coloratoOrg');
    coloratoOrgElements.forEach(function(element) {
        element.addEventListener('mouseover', showOrgDescription);
        element.addEventListener('mouseout', hideOrgDescription);
    });



    // Funzione per mostrare la descrizione delle PERSONE
    function showPersonDescription(event) {
        var targetPerson = event.target;
        var descPerson = targetPerson.querySelector('.descPerson');
        var contienitesto = document.getElementById('contienitesto');
        contienitesto.innerHTML = descPerson.innerHTML;
    }
    // Funzione per nascondere 
    function hidePersonDescription() {
        var contienitesto = document.getElementById('contienitesto');
        contienitesto.innerHTML = ''; 
    }
    var coloratoPersonElements = document.querySelectorAll('.coloratoPerson');
    coloratoPersonElements.forEach(function(element) {
        element.addEventListener('mouseover', showPersonDescription);
        element.addEventListener('mouseout', hidePersonDescription);
    });

    // Funzione per mostrare la descrizione dei LUOGHI
    function showPlaceDescription(event) {
        var targetPlace = event.target;
        var descPlace = targetPlace.querySelector('.descPlace');
        var contienitesto = document.getElementById('contienitesto');
        contienitesto.innerHTML = descPlace.innerHTML;
    }
    // Funzione per nascondere
    function hidePlaceDescription() {
        var contienitesto = document.getElementById('contienitesto');
        contienitesto.innerHTML = ''; 
    }
    var coloratoPersonElements = document.querySelectorAll('.coloratoPlace');
    coloratoPersonElements.forEach(function(element) {
        element.addEventListener('mouseover', showPlaceDescription);
        element.addEventListener('mouseout', hidePlaceDescription);
    });


}



//richiamo funzioni al caricamento della pagina
window.onload=gestoreLoad;