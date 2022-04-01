posicaoTemporaria = 0;
gravidade = 0.5;
movimentoVertical = 0;
pulo = false;

velocidade = 2;
velocidadeHorizontal = 0;
velocidadeVertical = 0;

enum Player{
	parado,
	andando,
	pulando,
	atacando,
	dano,
	morrendo
}

estado = Player.parado;