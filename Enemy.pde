class Enemy
{
	int x = 0;
	int y = 0;
	int type;
	int speed = 5;
	PImage enemyImg;
	Enemy(){}
	Enemy(int x, int y, int type){
		this.x = x;
		this.y = y;
		this.type = type;
		enemyImg = loadImage("img/enemy.png");
	}
	void move() {
		this.x += this.speed;
	}

	boolean isCollideWithFighter()
	{
		if(this.x >= fighter.x - this.enemyImg.width && this.x <= fighter.x + fighter.fighterImg.width && this.y >= fighter.y - this.enemyImg.height && this.y <= fighter.y + fighter.fighterImg.height)
		{
			return true;
		}
		return false;
	}
	boolean isOutOfBorder(){
		if(this.x > width) return true;
		return false;
	}
	void draw(){
		image(enemyImg, this.x, this.y);
	}
}

// 0 - straight, 1-slope, 2-dimond
void addEnemy(int type)
{	
	for (int i = 0; i < enemyCount; ++i) {
		enemys[i] = null;
	}
	switch (type) {
		case 0:
			addStraightEnemy();
			break;
		case 1:
			addSlopeEnemy();
			break;
		case 2:
			addDiamondEnemy();
			break;
		case 3:
			addStrongEnemy();
			break;
	}
}

void addStraightEnemy()
{
	float t = random(height - 60);
	int h = int(t);
	for (int i = 0; i < 5; ++i) {
		enemys[i] = new Enemy( (i+1)*(-80), h, FlightType.ENEMY);
	}
}
void addSlopeEnemy()
{
	float t = random(height - 60 * 5);
	int h = int(t);
	for (int i = 0; i < 5; ++i) {
		enemys[i] = new Enemy( (i)*-80, h + i * 50, FlightType.ENEMY);
	}
}
void addDiamondEnemy()
{
	float t = random( 60 * 3 ,height - 60 * 3);
	int h = int(t);
	int x_axis = 1;
	for (int i = 0; i < 8; ++i) {
		if (i == 0 || i == 7) {
			enemys[i] = new Enemy( (x_axis+1) * -80, h, FlightType.ENEMY);
			x_axis++;
		}
		else if (i == 1 || i == 5){
			enemys[i] = new Enemy( (x_axis+1) * -80, h + 1 * 40, FlightType.ENEMY);
			enemys[i+1] = new Enemy( (x_axis+1) * -80, h - 1 * 40, FlightType.ENEMY);
			i++;
			x_axis++;
		}
		else {
			enemys[i] = new Enemy( (x_axis+1) * -80, h + 2 * 40, FlightType.ENEMY);
			enemys[i+1] = new Enemy( (x_axis+1) * -80, h - 2 * 40, FlightType.ENEMY);
			i++;
			x_axis++;
		}
	}
}
void addStrongEnemy()
{
	int h = 60;
	for (int i = 0; i < 5; ++i) {
		boss[i] = new Boss( -60, h + i * 80, FlightType.ENEMYSTRONG);
	}
}
