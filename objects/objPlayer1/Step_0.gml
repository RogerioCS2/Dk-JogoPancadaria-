#region Declarando variaveis de entrada
var frente = keyboard_check(vk_right);
var traz = keyboard_check(vk_left); 
var cima = keyboard_check(vk_down); 
var baixo = keyboard_check(vk_up); 

var frenteSolto = keyboard_check_released(vk_right);
var trazSolto = keyboard_check_released(vk_left);   
var cimaSolto = keyboard_check_released(vk_up); 
var baixoSolto = keyboard_check_released(vk_down);
#endregion

switch(estado){
	case Player.parado:
		velocidadeHorizontal = 0;
		velocidadeVertical = 0;
		sprite_index = sprPlayer1Parado;
		var acionouSetas = frente || traz || cima || baixo;
		if(acionouSetas){
			estado = Player.andando;
		}
	break;
	
	case Player.andando:
		sprite_index = sprPlayer1Andando;
		var existeMovimentoX = (frente || traz) && (abs(velocidadeHorizontal) <= velocidade);
		if(existeMovimentoX){
			velocidadeHorizontal += (frente - traz) * velocidade;				
		}
		
		var existeMovimentoY = (cima || baixo) && (abs(velocidadeVertical) <= velocidade);				
		if(existeMovimentoY){			
				velocidadeVertical += (cima - baixo) * velocidade;					
		}
		
		if(velocidadeHorizontal != 0){
			image_xscale = sign(velocidadeHorizontal);
		}
		
		var soltouSetas = (frenteSolto || trazSolto || cimaSolto || baixoSolto);
		if(soltouSetas){estado = Player.parado;}		
	break;
	
	case Player.pulando:
	break;
	
	case Player.atacando:
	break;
	
	case Player.dano:
	break;
	
	case Player.morrendo:
	break;
}

x += velocidadeHorizontal;
y += velocidadeVertical;







/*
pulo = keyboard_check_pressed(vk_space);

if(place_meeting(x, y, objChaoCenario)){
	if(y >= posicaoTemporaria){
		movimentoVertical = 0;
	}
	
	if(pulo){
		posicaoTemporaria = y;
		movimentoVertical -= 7.5;
	}
}else{
	movimentoVertical += gravidade;	
	sprite_index = sprPlayer1Pulando;
	image_index = 0;
}

if(movimentoVertical > 0){
	image_index = 2;
}

y += movimentoVertical; 
*/