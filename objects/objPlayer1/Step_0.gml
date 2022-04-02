#region Declarando variaveis de entrada
var frente = keyboard_check(vk_right);
var traz = keyboard_check(vk_left); 
var cima = keyboard_check(vk_down); 
var baixo = keyboard_check(vk_up); 

var frenteSolto = keyboard_check_released(vk_right);
var trazSolto = keyboard_check_released(vk_left);   
var cimaSolto = keyboard_check_released(vk_up); 
var baixoSolto = keyboard_check_released(vk_down);

var pulo = keyboard_check_pressed(ord("S"));
var soco = keyboard_check_pressed(ord("A"));
#endregion

switch(estado){
	case Player.parado:
		velocidadeHorizontal = 0;
		velocidadeVertical = 0;
		sprite_index = sprPlayer1Parado;
		image_speed = 1;
		
		var acionouSetas = frente || traz || cima || baixo;
		if(acionouSetas){estado = Player.andando;}
		if(pulo){ 
			estado = Player.pulando;
			pulou = false;
		}
		if(soco){estado = Player.atacando;}		
	break;
	
	case Player.andando:
		sprite_index = sprPlayer1Andando;		
		var existeMovimentoX = (frente || traz) && (abs(velocidadeHorizontal) <= velocidade);
		if(existeMovimentoX){velocidadeHorizontal += (frente - traz) * velocidade;}
		
		var existeMovimentoY = (cima || baixo) && (abs(velocidadeVertical) <= velocidade);				
		if(existeMovimentoY){velocidadeVertical += (cima - baixo) * velocidade;}
		
		if(velocidadeHorizontal != 0){image_xscale = sign(velocidadeHorizontal);}
		
		var soltouSetas = (frenteSolto || trazSolto || cimaSolto || baixoSolto);
		if(soltouSetas){estado = Player.parado;}
		
		if(pulo){ 
			estado = Player.pulando;
			pulou = false;
		}
		
		if(soco){estado = Player.atacando;}		
	break;
	
	case Player.pulando:
		if(movimentoVertical > 0){ image_index = 2;}
				
		if(place_meeting(x, y, objChaoCenario) && !pulou){
			posicaoTemporaria = y;
			movimentoVertical = -7.5;	
			sprite_index = sprPlayer1Pulando
			image_speed = 0;
			image_index = 0;
			pulou = true;
		}else{
			if(y < posicaoTemporaria){
				movimentoVertical += gravidade;
			}else{
				movimentoVertical = 0;
				estado = Player.parado;
			}
		}
		y += movimentoVertical;
	break;
	
	case Player.atacando:
		var acertouInimigo = instance_place(x, y, objInimigoBase);
		if(acertouInimigo != noone){acertouInimigo.estadoI = Inimigo.dano;}				
		sprite_index = sprPlayer1SocoSimples;	
		image_speed = 1;
		if(image_index == image_number){estado = Player.parado;}		
	break;
	
	case Player.dano:
	break;
	
	case Player.morrendo:
	break;
}

if(estado != Player.pulando){y = clamp(y, 363, 458);}	

x += velocidadeHorizontal;
y += velocidadeVertical;