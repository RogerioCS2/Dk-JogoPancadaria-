#region Visualizando o Player

if(distance_to_object(objPlayer1) < visao && !seguiu){
	estadoI = Inimigo.seguindo;
	seguiu = true;
}

#endregion

switch(estadoI){
	#region legenda animacoes
	/*
	Imagem do inimigo             -> 0
	Animação inimigo andando      -> 1
	Animação inimigo hibernando   -> 2
	Animação inimigo levando dano -> 3
	Animação inimigo morrendo     -> 4
	Animação inimigo parado       -> 5
	Animação inimigo atacando     -> 6	
	*/	
	#endregion
	#region Inimigo Parado
	
	case Inimigo.parado:	
		if(!invencibilidade){
			speed = 0;
			sprite_index = animacaoInimigos[1];
			image_speed = 0;
			if(!alarm[3]){alarm[3] = room_speed *(random_range(1,2));}
		}else{
			estadoI = Inimigo.seguindo;			
		}	
	break;
	
	#endregion
	#region Seguindo Player
	
	case Inimigo.seguindo:	
		sprite_index = animacaoInimigos[1];
		image_speed = 1;
		var playerInst = instance_find(objPlayer1, 0);
		if(playerInst != noone){
			var localPlayer = point_direction(x, y, playerInst.x, playerInst.y); //localizando local do player
			motion_add(localPlayer, 0.5); //movendo o ininigo na direção do player
			if(speed > 0.4){speed = 0.4;}
			if(x > playerInst.x){image_xscale = 1;}else{image_xscale = -1;}			
			
			var podeAtacar = (distance_to_object(playerInst) <= distanciaGolpe) && (estadoI != Inimigo.dano) && (y >= objPlayer1.y);			
			if(podeAtacar){estadoI = Inimigo.atacando;}
			
			if(!alarm[2]){alarm[2] = room_speed * (random_range(2, 5));}						
		}else{
			estadoI = Inimigo.parado;
		}	
	break;
	
	#endregion
	#region Inimigo Atacando
	
	case Inimigo.atacando:
		speed = 0;
		sprite_index = animacaoInimigos[6];
		if(image_index = 1 && instance_place(x, y, objPlayer1)){objPlayer1.estado = Player.dano;}
		if(image_index == image_number){ estadoI = Inimigo.parado;}
	break;
	
	#endregion
	#region Dano Inimigo
	
	case Inimigo.dano:			
		speed = 0;
		if(!invencibilidade){
			vida--;				
			if(vida <= 0){				
				if(place_meeting(x, y, objChaoCenario) && !pulouI){
					posicaoTemporariaI = y;
					velocidadeVerticalI = -7.5;	
					velocidadeHorizontalI = sign(objPlayer1.image_xscale) * 2;					
					image_speed = 1;
					sprite_index = animacaoInimigos[4];					
					//image_index = 0
					pulouI = true;
				}else{
					if(y < posicaoTemporariaI){
						velocidadeVerticalI += gravidadeI;
					}else{
						audio_play_sound(snMorte, 1, false);
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
				alarm[0] = room_speed;				
				estadoI = Inimigo.parado;
				audio_play_sound(snSoco, 1, false);
			}
		}else{
			estadoI = Inimigo.seguindo
		}
		x += velocidadeHorizontalI;
		y += velocidadeVerticalI;	
	break;
	
	#endregion	
	#region Inimigo Morrendo
	
	case Inimigo.morrendo:		
		speed = 0;				
	break;
	
	#endregion
}