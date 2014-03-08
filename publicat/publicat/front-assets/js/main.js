jQuery(document).ready(function(){
	setSlider();
	setItemClicked();
	setPaginator();
});


function setPaginator(){
	$(".widget_categories div.holder").jPages({
	    containerID : "rubrique",
	    perPage: 5
  	});

  	$("#dnTable div.holder").jPages({
	    containerID : "dtItems",
	    perPage: 10
  	});
}

function setItemClicked(){
	$('#dtItems  li .clickable').unbind('click');
	$('#dtItems  li .clickable').click(function(){
	    window.location = 'http://localhost:3992/uploads/articles/' + $(this).parent().attr('data-id');
	});
}




function setSlider(){
	//Configuration
		  var retour = true;
		  var tempsTransition = 1000;
		  var affichePlayPause = false;
		  var lectureAutomatique = true;
		  	var tempsAttente = 6000;
			
		  var icones = new Array();
		  		icones['play'] = 'img/play_slider.png';
		  		icones['pause'] = 'img/pause_slider.png';	
			
		  var currentPosition = 0;
		  var slideWidth = 450;
		  var slides = $('.slide');
		  var numberOfSlides = slides.length;
		  var interval;
		  var lectureEnCours = false;
  // Supprime la scrollbar en JS
  $('#slidesContainer').css('overflow', 'hidden');

  // Attribue  #slideInner  � toutes les div .slide
  slides
    .wrapAll('<div id="slideInner"></div>')
    // Float left to display horizontally, readjust .slides width
	.css({
      'float' : 'left',
      'width' : slideWidth
    });

  // Longueur de #slideInner �gale au total de la longueur de tous les slides
  $('#slideInner').css('width', slideWidth * numberOfSlides);

  // Insert controls in the DOM
  $('#slideshow')
    .prepend('<span class="control" id="leftControl">Pr�c�dent</span>')
    .append('<span class="control" id="rightControl">Suivant</span>');


  
  // Hide left arrow control on first load
  manageControls(currentPosition);

  //Cr�e un �couteur d'�v�nement de type clic sur les classes .control
  $('.control')
    .bind('click', function(){
		
    // Determine la nouvelle position
	currentPosition = ($(this).attr('id')=='rightControl') ? currentPosition+1 : currentPosition-1;
    
	if(currentPosition == numberOfSlides && retour == false ){
		currentPosition--;
		pause();
	}
	
	// Cache ou montre les controles
    manageControls(currentPosition);
    // Fais bouger le slide
    $('#slideInner').animate({
      'marginLeft' : slideWidth*(-currentPosition)
    },tempsTransition);
  });

  // manageControls: Cache ou montre les fl�ches de controle en fonction de la position courante
  function manageControls(position){
    // Cache la fleche "pr�c�dent" si on est sur le premier slide
	if(position==0){ $('#leftControl').hide() } else{ $('#leftControl').hide() }
	// Cache la fleche "suivant" si on est sur le dernier slide (et que le retour automatique n'est pas activ�)
    if(position==numberOfSlides-1 && retour == false){
		$('#rightControl').hide();
	} else {
		$('#rightControl').hide();
	}
	if(position == numberOfSlides && retour == true){
		currentPosition = 0;
		 $('#leftControl').hide();
	}
  }
  function suivant(){
	$('#rightControl').click();
	}
  function start() {
  	lectureEnCours = true;
    interval = setInterval(suivant, tempsAttente );
  }
  function pause() {
  	lectureEnCours = false;
   clearInterval(interval);
  }
  
 //Si le diapo est activ� 
if(lectureAutomatique == true){
  start();
}
if(affichePlayPause == true){
	$('#slidesContainer').prepend('<img id="navDiapo" src="" alt="Navigation diaporama" />');
	if(lectureAutomatique == true){
		$('#navDiapo').attr('src',icones['pause']);
	}else{
		$('#navDiapo').attr('src',icones['play']);	
	}
	$('#navDiapo').bind('click', function(){
		if(lectureEnCours == true){
			$(this).attr('src',icones['play']);
			pause();
		}else{
			$(this).attr('src',icones['pause']);
			start();
		}
	});
}
}

