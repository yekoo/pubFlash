package  
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author yekoo
	 */
	public class AtlasTest extends MovieClip 
	{
		private var aPic:BitmapClip;
		private var cc:BitmapClip;
		
		
		public function AtlasTest() 
		{
			cc = testAtlas("bendedBlueMan.png");
			addChild(cc);
			st.buttonMode = st.useHandCursor = true;
			pl.buttonMode = pl.useHandCursor = true;
			plRe.buttonMode = pl.useHandCursor = true;
			tost.buttonMode = tost.useHandCursor = true;
			topl.buttonMode = topl.useHandCursor = true;
						
			st.addEventListener(MouseEvent.CLICK, ccStop);
			pl.addEventListener(MouseEvent.CLICK, ccPlay);
			plRe.addEventListener(MouseEvent.CLICK, ccReplay);
			tost.addEventListener(MouseEvent.CLICK, ccGotoStop);
			topl.addEventListener(MouseEvent.CLICK, ccGotoPlay);
			
			typeOnce.buttonMode = typeOnce.useHandCursor = true;
			typeLoop.buttonMode = typeLoop.useHandCursor = true;
			typePend.buttonMode = typePend.useHandCursor = true;
			
			typeOnce.addEventListener(MouseEvent.CLICK, toOnce);
			typeLoop.addEventListener(MouseEvent.CLICK, toLoop);
			typePend.addEventListener(MouseEvent.CLICK, toPend);
		}
		
		
		private function imageLoaded(e:Event):void
		{
			trace(e.target.content);
			var img:Bitmap = e.target.content as Bitmap;
			trace(img.width);
			
			aPic = testAtlas(img);
			addChild(aPic);
		}

		private function testAtlas(bm:*):BitmapClip
		{
			var bClip:BitmapClip = new BitmapClip(bm, true,150);
			bClip.x = 48;
			bClip.y = 48;
			
			return bClip;
			
		}
		
		
		private function ccStop(e:MouseEvent):void
		{
			cc.stop();
		}
		private function ccPlay(e:MouseEvent):void
		{
			cc.play();
		}
		private function ccReplay(e:MouseEvent):void
		{
			cc.play(true);
		}
		private function ccGotoStop(e:MouseEvent):void
		{
			cc.gotoStop(Number(tostxt.text));
		}
		private function ccGotoPlay(e:MouseEvent):void
		{
			cc.gotoPlay(Number(toptxt.text));
		}
		private function toOnce(e:MouseEvent):void
		{
			cc.loopType = BitmapClip.PLAY_ONCE;
		}
		private function toLoop(e:Event):void
		{
			cc.loopType = BitmapClip.PLAY_LOOP;
		}
		private function toPend(e:Event):void
		{
			cc.loopType = BitmapClip.PLAY_PENDULUM;
		}
	}
}