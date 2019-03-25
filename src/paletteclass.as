package {
	import flash.display.*;
	import flash.geom.*;
  import flash.events.*;
  import flash.net.*;
	
	public class paletteclass  {
		public function paletteclass():void {
			r = 0; g = 0; b = 0; a = 255;
		}
		
		public function setto(r1:int, g1:int, b1:int, a1:int=255):void {
			r = r1; g = g1; b = b1; a = a1;
			fixbounds();
		}
		
		public function transition(r1:int, g1:int, b1:int, speed:int=5, a1:int=-1):void {
			if (a1 < 0) { a1 = a; }
			
			if (r < r1) {	r += speed;	if (r > r1) r = r1;	}
			if (g < g1) {	g += speed;	if (g > g1) g = g1;	}
			if (b < b1) {	b += speed;	if (b > b1) b = b1;	}
			if (a < a1) {	a += speed;	if (a > a1) a = a1;	}
			
			if (r > r1) {	r -= speed;	if (r < r1) r = r1;	}
			if (g > g1) {	g -= speed;	if (g < g1) g = g1;	}
			if (b > b1) {	b -= speed;	if (b < b1) b = b1;	}
			if (a > a1) {	a -= speed;	if (a < a1) a = a1;	}
			
			fixbounds();
		}
		
		public function fixbounds():void {
			if (a <= 0) a = 0;    if (r <= 0) r = 0;    if (g <= 0) g = 0;    if (b <= 0) b = 0; 
			if (a > 255) a = 255;	if (r > 255) r = 255;	if (g > 255) g = 255;	if (b > 255) b = 255;
		}
		
		public var r:int, g:int, b:int, a:int;
	}
}
