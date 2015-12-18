class GameState
{
	static final int START = 0;
	static final int PLAYING = 1;
	static final int END = 2;
}
class Direction
{
	static final int LEFT = 0;
	static final int RIGHT = 1;
	static final int UP = 2;
	static final int DOWN = 3;
}
class EnemysShowingType
{
	static final int STRAIGHT = 0;
	static final int SLOPE = 1;
	static final int DIAMOND = 2;
	static final int STRONGLINE = 3;
}
class FlightType
{
	static final int FIGHTER = 0;
	static final int ENEMY = 1;
	static final int ENEMYSTRONG = 2;
}
int state = GameState.START;
int currentType = EnemysShowingType.STRAIGHT;
int enemyCount = 8;
int bulletCount = 5;
int bullet_tag = 0;
Enemy[] enemys = new Enemy[enemyCount];
Boss[] boss = new Boss[enemyCount];
Fighter fighter;
BackGround bg;
FlameMgr flameMgr;
Treasure treasure;
HPDisplay hpDisplay;
Bullet[] bullets = new Bullet[bulletCount];

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

int time;
int wait = 6000;


int speed=5;
int score=0;

void setup () {
	size(640, 480) ;
	flameMgr = new FlameMgr();
	bg = new BackGround();
	treasure = new Treasure();
	hpDisplay = new HPDisplay();
	fighter = new Fighter(20);
	frameRate(60);
}

void draw(){
	switch(state){
		case GameState.START:
			bg.draw();
			break;
		case GameState.PLAYING:
			bg.draw();
			treasure.draw();
			flameMgr.draw();
			fighter.draw();
			//enemys
			if(millis() - time >= wait){
				addEnemy(currentType++);
				currentType = currentType % 4;
				time = millis();
			}
			if(currentType == 0)
			{
				for(int i = 0; i < enemyCount; ++i)
				{
					if(boss[i] != null)
					{
						boss[i].move();
						boss[i].draw();
						if(boss[i].isCollideWithFighter())
						{
							fighter.hpValueChange(-50);
							flameMgr.addFlame(boss[i].x, boss[i].y);
							boss[i] = null;
						}
						else if (boss[i].isOutOfBorder())
						{
							boss[i] = null;
						}
					}
				}
			}
			else 
			{	
				for(int i = 0; i < enemyCount; ++i)
				{
					if(enemys[i] != null)
					{
						enemys[i].move();
						enemys[i].draw();
						if(enemys[i].isCollideWithFighter())
						{
							fighter.hpValueChange(-20);
							flameMgr.addFlame(enemys[i].x, enemys[i].y);
							enemys[i] = null;
						}
						else if (enemys[i].isOutOfBorder())
						{
							enemys[i] = null;
						}
					}
				}
			}
			//bullet judge
			for(int i = 0; i < bulletCount; ++i)
			{
				if(bullets[i] != null)
				{
					bullets[i].move();
					bullets[i].draw();
					if(bullets[i].isCollideWithEnemy())
					{
						score += 10;
						bullets[i] = null;
					}
					else if (bullets[i].isOutOfBorder())
					{
						bullets[i] = null;
					}
				}
			}
			//hp
			hpDisplay.updateWithFighterHP(fighter.hp);
			if(fighter.hp <= 0) state = GameState.END;
			//score
			fill(255);
			textSize(32);
			text("score:"+score, 20, 450); 
			break;
		case GameState.END:
			bg.draw();
			reset();
			break;
	}
}

void reset(){
	fighter = new Fighter(20);
	score=0;
	currentType = EnemysShowingType.STRAIGHT;
 flameMgr = new FlameMgr(); 
 for(int i = 0; i < bulletCount; i++)
  {
    bullets[i] = null;
  }for(int i = 0; i < bulletCount; i++)
  {
    bullets[i] = null;
  }
	for(int i = 0; i < enemyCount; i++)
	{
		enemys[i] = null;
		boss[i] = null;
	}
}
//*******************************************************************************
void keyPressed(){
	if(key == CODED){
		switch(keyCode){
			case UP:
				upPressed = true;
				break;
			case DOWN:
				downPressed = true;
				break;
			case LEFT:
				leftPressed = true;
				break;
			case RIGHT:
				rightPressed = true;
				break;
		}
	}
	if(key==' ')
	{
		fighter.shoot();
	} 
}
void keyReleased(){
	if(key == CODED){
		switch(keyCode){
			case UP:
				upPressed = false;
				break;
			case DOWN:
				downPressed = false;
				break;
			case LEFT:
				leftPressed = false;
				break;
			case RIGHT:
				rightPressed = false;
				break;
		}
	}
}
void scoreChange(int value){
	score = score + value;
}

boolean isHit(float ax,float ay,float aw,float ah,float bx,float by,float bw,float bh){
	if (ax >= bx - aw && ax <= bx + bw && ay >= by - ah && ay <= by + bh){
		return true;
	}
	return false;	
}
