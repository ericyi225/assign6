class Boss extends Enemy
{
	int shoot_by_bullet = 5;
	Boss(int x, int y, int type)
	{
		this.shoot_by_bullet = 5;
		this.x = x;
		this.y = y;
		this.type = type;
		this.speed = 2;
		this.enemyImg = loadImage("img/enemy2.png");
	}
	boolean BossDead()
	{
		this.shoot_by_bullet -= 1;
		if(this.shoot_by_bullet <= 0)
		{
			return true;
		}
		return false;
	}
}
