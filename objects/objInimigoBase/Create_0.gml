invencibilidade = false;
vida = 6;
velocidadeHorizontalI = 0;
velocidadeVerticalI = 0;
gravidadeI = 0.5;
posicaoTemporariaI = 0;
pulouI = false;
depth = 1;
seguiu = false;
visao = 50;
distanciaGolpe = 0.80;

animacaoInimigos = [
	sprInimigo0, 
	sprInimigo0Andando, 
	sprInimigo0Hibernando, 
	sprInimigo0LevandoDano, 
	sprInimigo0Morrendo, 
	sprInimigo0Parado,
	sprInimigoAtacando
]

enum Inimigo{
	parado,
	seguindo,
	atacando,
	dano,	
	morrendo	
}

estadoI = noone;