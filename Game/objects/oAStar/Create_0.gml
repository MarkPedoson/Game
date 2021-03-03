collisionMap = layer_tilemap_get_id(layer_get_id("Tile"));
obstructionMap = layer_tilemap_get_id(layer_get_id("Obstruction"));

blockSize = TILE_SIZE;


fieldWidth = ceil(room_width / blockSize);
fieldHeight = ceil(room_height / blockSize);

for(var i = 0; i < fieldWidth; i++){
    for(var j = 0; j < fieldHeight; j++){
		if (tilemap_get_at_pixel(collisionMap, i * blockSize, j * blockSize) > 0) // Gets the center position of the tile cell
	    {
			walkable[i, j] = false;
	    }
		else 
		{	
			walkable[i, j] = true;
		}
		clearence[getKey(i, j)] = 0;
    }
}

for(var i = 0; i < fieldWidth; i++){
	for(var j = 0; j < fieldHeight; j++){
		if (walkable[i, j] == true){
			clearence[getKey(i, j)] += 1;
			var _add = clearenceCheck(i, j, fieldWidth, fieldHeight);
			clearence[getKey(i, j)] += _add;
		}
	}
}




