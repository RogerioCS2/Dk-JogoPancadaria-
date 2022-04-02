switch(estadoI){
	case Inimigo.parado:
	break;
	
	case Inimigo.seguindo:
	break;
	
	case Inimigo.atacando:
	break;
	
	case Inimigo.dano:
		if(!invencibilidade){
			vida--;	
			if(vida <= 0){
				if(place_meeting(x, y, objChaoCenario) && !pulouI){
					posicaoTemporariaI = y;
					velocidadeVerticalI = -7.5;	
					velocidadeHorizontalI = sign(objPlayer1.image_xscale) * 2;
					show_debug_message(velocidadeHorizontalI);
					sprite_index = animacaoInimigos[4];
					//image_speed = 0;
					//image_index = 0
					pulouI = true;
				}else{
					if(y < posicaoTemporariaI){
						velocidadeVerticalI += gravidadeI
					}else{
						velocidadeHorizontalI = 0;
						velocidadeVerticalI = 0;
						image_index = 10;
						alarm[1] = room_speed;
						estadoI = Inimigo.morrendo
					}
				}				
			}else{
				sprite_index = animacaoInimigos[3];
				image_speed = 0;
				image_index = choose(0, 1);
				invencibilidade = true;
				alarm[0] = room_speed / 3;
				estadoI = Inimigo.seguindo;
			}
		}else{
			estadoI = Inimigo.seguindo
		}
		x += velocidadeHorizontalI;
		y += velocidadeVerticalI;
	break;
	
	case Inimigo.morrendo:
	break;
}

