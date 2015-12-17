class Fighter{
	PImage fighterImg;
	int x = 0;
	int y = 0;
	int type;
	int speed = 5;
	int hp;
	Fighter(int hp) 
	{
		this.fighterImg = loadImage("img/fighter.png");
		this.x = width - this.fighterImg.width;
		this.y = (height - this.fighterImg.height)/2;
		this.type = FlightType.FIGHTER;
		this.hp = hp;
	}

	void draw() {
		image(fighterImg, this.x, this.y);

		if(upPressed) {
			this.move(Direction.UP);
		}
		if(downPressed) {
			this.move(Direction.DOWN);
		}
		if(rightPressed) {
			this.move(Direction.RIGHT);
		}
		if(leftPressed) {
			this.move(Direction.LEFT);
		}
	}

	void shoot(){
		if(bullets[bullet_tag] == null)
		{	
			bullets[bullet_tag] = new Bullet(this.x - 31, this.y + this.fighterImg.height/2 - 9);
			bullet_tag = (bullet_tag+1) % bulletCount;
		}
	}
	void move(int direct) {
		switch (direct) {
			case Direction.UP:
				if(this.y - speed > 0){
					this.y -= speed;
				}
				break;
			case Direction.DOWN:
				if(this.y + speed < height - this.fighterImg.height){
					this.y += speed;
				}
				break;
			case Direction.RIGHT:
				if(this.x + speed < width - this.fighterImg.width){
					this.x += speed;
				}
				break;
			case Direction.LEFT:
				if(this.x - speed > 0){
					this.x -= speed;
				}
				break;
        }
	}
	void hpValueChange(int change){
		this.hp += change;
		if(this.hp > 100) 
			this.hp = 100;
	}
}
