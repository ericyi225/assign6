class BackGround
{
	PImage start1,start2;
	PImage end1,end2;
	PImage bg1,bg2;
	int playingBg1x = 0;
	int playingBg2x = -640;
	BackGround() 
	{
		this.bg1 = loadImage("img/bg1.png");
		this.bg2 = loadImage("img/bg2.png");

		this.start1 = loadImage("img/start1.png");
		this.start2 = loadImage("img/start2.png");

		this.end1 = loadImage("img/end1.png");
		this.end2 = loadImage("img/end2.png");	
	}
	void draw()
	{
		if (state == GameState.START)
		{
			if(second() % 2 == 1)
			{
				image(start1, 0, 0);
			}
			else{
				image(start2, 0, 0);
			}
			if(mouseX > 205 && mouseX <455){
				if(mouseY >380 && mouseY <415){
						if(mousePressed)
						{
							state = GameState.PLAYING;
							//enemyType=0;
							//reset();
						}
				}
			}
		}

		else if (state == GameState.PLAYING)
		{
			playingBg1x++;
			playingBg2x++;

			if(playingBg1x == 640) {
				playingBg1x = -640;
			}
			if(playingBg2x == 640) {
				playingBg2x = -640;
			}
			image(bg1, playingBg1x, 0);
			image(bg2, playingBg2x, 0);
		}

		else if (state == GameState.END)
		{
			image(end2,0,0);
				if(mouseX > 205 && mouseX <440){
					if(mouseY >305 && mouseY <350){
						image(end1,0,0);
							if(mousePressed){
								state = GameState.PLAYING;
								//reset();
							}
					 }
				}
		}
	}


}
