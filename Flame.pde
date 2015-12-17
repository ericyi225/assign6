class FlameMgr
{
	int currentFrame = 0;
	int Nowframe = 0;
	PImage[] flameImg = new PImage[5];
	int[] x = new int[8];
	int[] y = new int[8];
	int print_tag = 0;
	FlameMgr()
	{
		currentFrame = 0;
		Nowframe = 0;
		for(int i = 0; i < 5; i++){
			flameImg[i] = loadImage("img/flame" + (i+1) + ".png");
		}
		for(int i = 0; i < 8; i++){
			x[i] = -1;
			y[i] = -1;
			print_tag = 0;
		}
	}

	void draw()
	{
		for(int i = 0; i < 8; i++)
		{
			if(x[i] > 0)
			{
				image(flameImg[currentFrame % 5], x[i], y[i]);
		        if((frameCount - Nowframe) % (60/10) == 5){
		          currentFrame ++;
		        }
		        if((frameCount - Nowframe) % 30 == 0 && (frameCount - Nowframe) != 0)
		        {
		          x[i] = -1;
		          y[i] = -1;
		          Nowframe = 0;
		        }
		    }
	    }
	}
	void addFlame(int x, int y)
	{
		this.x[print_tag] = x;
		this.y[print_tag] = y;
		print_tag = (print_tag + 1) % 8;
	}
}
