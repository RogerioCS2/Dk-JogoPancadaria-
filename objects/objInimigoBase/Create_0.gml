invencibilidade = false;
vida = 5;
velocidadeHorizontalI = 0;
velocidadeVerticalI = 0;
gravidadeI = 0.5;
posicaoTemporariaI = 0;
pulouI = false;

animacaoInimigos = [
	sprInimigo0, 
	sprInimigo0Andando, 
	sprInimigo0Hibernando, 
	sprInimigo0LevandoDano, 
	sprInimigo0Morrendo, 
	sprInimigo0Parado
]

enum Inimigo{
	parado,
	seguindo,
	atacando,
	dano,	
	morrendo	
}

estadoI = Inimigo.parado;