jQuery(document).ready(function(){
	setSlider();
	setItemClicked();
	setPaginator();
	addToPannel();
	goPannel();
	rmFromPannel();
	rmAllFromPannel();
	updateQteProduct();
	continueShopping();

});

function continueShopping(){
	$("#btn-continue-shopping").unbind('click');
	$("#btn-continue-shopping").bind('click',function(){

		window.location = "http://e-commerce.ma/home";
		return ;

	});
}


function updateQteProduct(){
	$(".btn-update").unbind('click');
	$(".btn-update").bind('click',function(){
		var ref = $(this).attr('data-ref'); 
		var input = $('input[name='+ref+']');
		var qte = $(input).val();

		qte = parseInt(qte);
		if(isNaN(qte) || (qte == 0)){
			alert('veuillez saisir une qte valide!!');
			return;
		}

		$(input).val(qte)
		
		$.ajax({
			        url: "http://e-commerce.ma/ajax/add-product/"+ref+"/"+qte,
			        dataType: "json",
			        success: function( data ) {
			            if(data.result == "success"){
			            	$('.cart_mini_right').empty();
			            	$('.cart_mini_right').append("<span class='price'>"+data.total+" DH</span> ("+data.items+" items)");

			            	$('span[data-name = total-ht]').empty();
			            	$('span[data-name = total-ht]').append(data.total+' DH');

			            	$('span[data-name = total-taxe]').empty();
			            	taxe = (data.total*0.2);
			            	taxe = parseFloat(taxe).toFixed(2);
			            	$('span[data-name = total-taxe]').append(taxe+' DH');

			            	$('span[data-name = total-net]').empty();
			            	netp =  ((data.total*0.2)+data.total);
			            	netp = parseFloat(netp).toFixed(2);
			            	$('span[data-name = total-net]').append(netp+' DH');

			            	newtotal = qte*parseFloat($(input).attr('data-unitp'));
			            	newtotal = parseFloat(newtotal).toFixed(2);
			            	$('.cart-price span[data-columnname = '+ref+']').empty();
			            	$('.cart-price span[data-columnname = '+ref+']').append(newtotal+' DH');

			            }else{
			            	alert('ops, error!!');
			            }
			        }
			    });
	});
}

function rmAllFromPannel(){
	$("#remove-all-product").unbind('click');
	$("#remove-all-product").bind('click',function(){
		$.ajax({
			        url: "http://e-commerce.ma/ajax/delete-all-product",
			        dataType: "json",
			        success: function( data ) {
			            if(data.result == "success"){

			            	window.location = "http://e-commerce.ma/home";
			            	
			            	return;

			            }else{
			            	alert('ops, error!!');
			            	return;
			            }
			        }
			    });
	});
}

function rmFromPannel(){
	$(".btn-remove").unbind('click');
	$(".btn-remove").bind('click',function(){

		var ref = $(this).attr('data-column');
		var obj = this;
		$.ajax({
			        url: "http://e-commerce.ma/ajax/delete-product/"+ref,
			        dataType: "json",
			        success: function( data ) {
			            if(data.result == "success"){

			            	$('.cart_mini_right').empty();
			            	$('.cart_mini_right').append("<span class='price'>"+data.total+" DH</span> ("+data.items+" items)");

			            	$('span[data-name = total-ht]').empty();
			            	$('span[data-name = total-ht]').append(data.total+' DH');

			            	$('span[data-name = total-taxe]').empty();
			            	$('span[data-name = total-taxe]').append((data.total*0.2)+' DH');

			            	$('span[data-name = total-net]').empty();
			            	$('span[data-name = total-net]').append(((data.total*0.2)+data.total)+' DH');

			            	var tr = $(obj).parent().parent();
			            	$(tr).fadeOut(700, function() { $(this).remove(); });
			            	return;

			            }else{
			            	alert('ops, error!!');
			            	return;
			            }
			        }
			    });

	});
}

function goPannel(){
	$('.cart_mini_right').unbind('click')
	$('.cart_mini_right').bind('click',function(){

		window.location = "http://e-commerce.ma/client/checkout";
	});
}

function addToPannel(){
	$("#dtItems .cardAdd .add-to-card").unbind('click');
	$("#dtItems .cardAdd .add-to-card").bind('click',function(){
		var parent = $(this).parent();
		var ref = $(parent).attr('data-ref');
		var qte = $(parent).find('input[type=text]').val();
		
		qte = parseInt(qte);
		if(isNaN(qte) || (qte == 0)){
			alert('veuillez saisir une qte valide!!');
			return;
		}

		$(parent).find('input[type=text]').val(qte)
		
		$.ajax({
			        url: "http://e-commerce.ma/ajax/add-product/"+ref+"/"+qte,
			        dataType: "json",
			        success: function( data ) {
			            if(data.result == "success"){
			            	$('.cart_mini_right').empty();
			            	$('.cart_mini_right').append("<span class='price'>"+data.total+" DH</span> ("+data.items+" items)");
			            }else{
			            	alert('ops, error!!');
			            }
			        }
			    });

	});
}




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
		window.location = 'http://e-commerce.ma/article/details/'+$(this).parent().attr('data-id');
	});
}

function addToPanel(){
	$('#dtItems  li input[type=button]').unbind('click');
	$('#dtItems  li input[type=button]').click(function(){
		alert('hello');
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

  // Attribue  #slideInner  à toutes les div .slide
  slides
    .wrapAll('<div id="slideInner"></div>')
    // Float left to display horizontally, readjust .slides width
	.css({
      'float' : 'left',
      'width' : slideWidth
    });

  // Longueur de #slideInner égale au total de la longueur de tous les slides
  $('#slideInner').css('width', slideWidth * numberOfSlides);

  // Insert controls in the DOM
  $('#slideshow')
    .prepend('<span class="control" id="leftControl">Précédent</span>')
    .append('<span class="control" id="rightControl">Suivant</span>');


  
  // Hide left arrow control on first load
  manageControls(currentPosition);

  //Crée un écouteur d'évènement de type clic sur les classes .control
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

  // manageControls: Cache ou montre les flêches de controle en fonction de la position courante
  function manageControls(position){
    // Cache la fleche "précédent" si on est sur le premier slide
	if(position==0){ $('#leftControl').hide() } else{ $('#leftControl').hide() }
	// Cache la fleche "suivant" si on est sur le dernier slide (et que le retour automatique n'est pas activé)
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
  
 //Si le diapo est activé 
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

