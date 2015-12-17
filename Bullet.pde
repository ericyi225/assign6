class Bullet
{
	int x = 0;
	int y = 0;
	int speed = 4;
	PImage bulletImg;
	Bullet(){}
	Bullet(int x, int y) 
	{
		this.x = x;
		this.y = y;
		this.speed = 4;
		this.bulletImg = loadImage("img/shoot.png");
	}

	void move(){
		this.x -= this.speed;
	}
	void draw(){
		image(bulletImg, this.x, this.y);
	}
	boolean isCollideWithEnemy(){
		for(int i = 0; i < enemyCount; i++)
		{
			if(enemys[i] != null)
			{
				if(this.x >= enemys[i].x - this.bulletImg.width && this.x <= enemys[i].x + enemys[i].enemyImg.width && this.y >= enemys[i].y - this.bulletImg.height && this.y <= enemys[i].y + enemys[i].enemyImg.height)
				{
					flameMgr.addFlame(enemys[i].x, enemys[i].y);
					enemys[i] = null;
					return true;
				}
			}
			if(boss[i] != null)
			{
				if(this.x >= boss[i].x - this.bulletImg.width && this.x <= boss[i].x + boss[i].enemyImg.width && this.y >= boss[i].y - this.bulletImg.height && this.y <= boss[i].y + boss[i].enemyImg.height)
				{
					if(boss[i].BossDead())
					{
						flameMgr.addFlame(boss[i].x, boss[i].y);
						boss[i] = null;
					}
					return true;
				}
			}
		}
		return false;
	}
	boolean isOutOfBorder(){
		if(this.x + this.bulletImg.width < 0) return true;
		return false;
	}
}
