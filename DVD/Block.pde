class Block {
  PVector pos;
  PVector vel;
  PVector s;
  
  Block(int x, int y, PVector vel) {
    pos = new PVector(x,y);
    this.vel = vel;
    s = new PVector(100,100/1.6);
  }
  
  void render() {
    rect(pos.x,pos.y,s.x,s.y);
  }
  
  void step(Block b) {
    pos.add(vel);
    int hits = 0;
    
    if(pos.x > b.pos.x && pos.x < b.pos.x + b.s.x || pos.x+s.x > b.pos.x && pos.x+s.x < b.pos.x + b.s.x) {
      if(pos.y > b.pos.y && pos.y < b.pos.y+b.s.y) {
        vel.x = -vel.x;
      }
    } else if(pos.y > b.pos.y && pos.y < b.pos.y + b.s.y || pos.y+s.y > b.pos.y && pos.y+s.y < b.pos.y + b.s.y) {
      vel.y = -vel.y;
    }
    
    if(pos.x < 0 || pos.x+s.x > width) {
      vel.x = -vel.x;
      hits++;
    }
    
    if(pos.y < 0 || pos.y+s.y > height) {
      vel.y = -vel.y;
      hits++;
    }
  }
}