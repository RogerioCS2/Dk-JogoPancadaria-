posicaoTemporaria = 0;
gravidade = 0.5;
movimentoVertical = 0;
pulou = false;

velocidade = 1;
velocidadeHorizontal = 0;
velocidadeVertical = 0;
depth = 0;

enum Player{
	parado,
	andando,
	pulando,
	atacando,
	dano,
	morrendo
}

estado = Player.parado;