// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyTileCollision(){
	var _collision = false;
	var _entityList = ds_list_create();
	var _playerList = ds_list_create();
	var _bbox_side;


	//Reapply frac
	hsp += hsp_frac;
	vsp += vsp_frac;

	//Store and remove frac (so no jittery collision effects would raise)
	hsp_frac = hsp - (floor(abs(hsp)) * sign(hsp));
	hsp -= hsp_frac;
	vsp_frac = vsp - (floor(abs(vsp)) * sign(vsp));
	vsp -= vsp_frac;

	
	//Horizontal Tiles
	//Deciding the side
	if (hsp > 0) _bbox_side = ENV_RIGHT; else _bbox_side = ENV_LEFT;
	if (tilemap_get_at_pixel(collisionMap, _bbox_side + hsp, ENV_TOP) != 0) or
		(tilemap_get_at_pixel(collisionMap, _bbox_side + hsp, y) != 0)
	{
		if (hsp > 0) x = x - (x mod TILE_SIZE) + (TILE_SIZE - 1) - (ENV_RIGHT - x);
		else x = x - (x mod TILE_SIZE) - (ENV_LEFT - x);
		hsp = 0;
		_collision = true;
	}
	
	//Horizontal entities
	if (hsp > 0) _bbox_side = ENV_RIGHT; else _bbox_side = ENV_LEFT;
	var _entityCount = instance_place_list(_bbox_side + hsp, y, pEntity, _entityList, false);
	_entityCount += instance_place_list(_bbox_side + hsp, ENV_TOP, pEntity, _entityList, false);
	var _snapX;
	while (_entityCount > 0)
	{
		var _entityCheck = _entityList[| 0];	
		if (_entityCheck.entityCollision == true)
		{
			if (point_in_rectangle(_bbox_side + hsp, y, _entityCheck.x - _entityCheck.collX, _entityCheck.y - _entityCheck.collY, _entityCheck.x + _entityCheck.collX, _entityCheck.y)) or
				(point_in_rectangle(_bbox_side + hsp, ENV_TOP, _entityCheck.x - _entityCheck.collX, _entityCheck.y - _entityCheck.collY, _entityCheck.x + _entityCheck.collX, _entityCheck.y))
			{
				//Move as close as we can
				if (sign(hsp) == -1) _snapX = (_entityCheck.x + _entityCheck.collX) + 1 - (ENV_LEFT - x);
				else _snapX = (_entityCheck.x - _entityCheck.collX) - 1 - (ENV_RIGHT - x);
				x = _snapX;
				hsp = 0;
				_collision = true;
				_entityCount = 0;
			}
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}
	_entityCount = 0;
	
	//Horizontal player
	if (hsp > 0) _bbox_side = ENV_RIGHT; else _bbox_side = ENV_LEFT;
	var _playerCount = instance_place_list(_bbox_side + hsp, y, oPlayer, _playerList, false);
	_playerCount += instance_place_list(_bbox_side + hsp, ENV_TOP, oPlayer, _playerList, false);
	var _snapX;
	while (_playerCount > 0)
	{
		var _playerCheck = _playerList[| 0];	
		if (_playerCheck.state != PLAYERSTATE.DEAD){	
			if (point_in_rectangle(_bbox_side + hsp, y, _playerCheck.x - _playerCheck.collX, _playerCheck.y - _playerCheck.collY, _playerCheck.x + _playerCheck.collX, _playerCheck.y)) or
				(point_in_rectangle(_bbox_side + hsp, ENV_TOP, _playerCheck.x - _playerCheck.collX, _playerCheck.y - _playerCheck.collY, _playerCheck.x + _playerCheck.collX, _playerCheck.y))
			{
				//Move as close as we can
				if (sign(hsp) == -1) _snapX = (_playerCheck.x + _playerCheck.collX) + 1 - (ENV_LEFT - x);
				else _snapX = (_playerCheck.x - _playerCheck.collX) - 1 - (ENV_RIGHT - x);
				x = _snapX;
				hsp = 0;
				_collision = true;
				_playerCount = 0;
			}
		}
		ds_list_delete(_playerList, 0);
		_playerCount--;
	}
	_playerCount = 0;
	
	x += hsp;
	
	//Clear list between axis
	ds_list_clear(_entityList);
	ds_list_clear(_playerList);
	
	//Vertical Tiles
	//Deciding the side
	if (vsp >= 0) _bbox_side = y; else _bbox_side = ENV_TOP;
	if (tilemap_get_at_pixel(collisionMap, ENV_LEFT, _bbox_side + vsp) != 0) or 
		(tilemap_get_at_pixel(collisionMap, ENV_RIGHT, _bbox_side + vsp) != 0)
	{
		if (vsp >= 0) y = y - (y mod TILE_SIZE) + (TILE_SIZE - 1) - (y - y);
		else y = y - (y mod TILE_SIZE) - (ENV_TOP - y);
		vsp = 0;
		_collision = true;
	}
	
	//Vertical entities
	if (vsp >= 0) _bbox_side = y; else _bbox_side = ENV_TOP;
	var _entityCount = instance_place_list(ENV_LEFT, _bbox_side + vsp, pEntity, _entityList, false);
	_entityCount += instance_place_list(ENV_RIGHT, _bbox_side + vsp, pEntity, _entityList, false);
	var _snapY;
	while (_entityCount > 0)
	{
		var _entityCheck = _entityList[| 0];	
		if (_entityCheck.entityCollision == true)
		{
			if (point_in_rectangle(ENV_LEFT, _bbox_side + vsp, _entityCheck.x - _entityCheck.collX, _entityCheck.y - _entityCheck.collY, _entityCheck.x + _entityCheck.collX, _entityCheck.y)) or
				(point_in_rectangle(ENV_RIGHT, _bbox_side + vsp, _entityCheck.x - _entityCheck.collX, _entityCheck.y - _entityCheck.collY, _entityCheck.x + _entityCheck.collX, _entityCheck.y))
			{
				//Move as close as we can
				if (sign(vsp) == -1) _snapY = _entityCheck.y + 1 - (ENV_TOP - y);
				else _snapY = (_entityCheck.y - _entityCheck.collY) - 1 - (y - y);
				y = _snapY;
				vsp = 0;
				_collision = true;
				_entityCount = 0;
			}
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}
	_entityCount = 0;
	
	//Vertical players
	if (vsp >= 0) _bbox_side = y; else _bbox_side = ENV_TOP;
	var _playerCount = instance_place_list(ENV_LEFT, _bbox_side + vsp, oPlayer, _playerList, false);
	_playerCount += instance_place_list(ENV_RIGHT, _bbox_side + vsp, oPlayer, _playerList, false);
	var _snapY;
	while (_playerCount > 0)
	{
		var _playerCheck = _playerList[| 0];	
		if (_playerCheck.state != PLAYERSTATE.DEAD){
			if (point_in_rectangle(ENV_LEFT, _bbox_side + vsp, _playerCheck.x - _playerCheck.collX, _playerCheck.y - _playerCheck.collY, _playerCheck.x + _playerCheck.collX, _playerCheck.y)) or
				(point_in_rectangle(ENV_RIGHT, _bbox_side + vsp, _playerCheck.x - _playerCheck.collX, _playerCheck.y - _playerCheck.collY, _playerCheck.x + _playerCheck.collX, _playerCheck.y))
			{
				//Move as close as we can
				if (sign(vsp) == -1) _snapY = _playerCheck.y + 1 - (ENV_TOP - y);
				else _snapY = (_playerCheck.y - _playerCheck.collY) - 1 - (y - y);
				y = _snapY;
				vsp = 0;
				_collision = true;
				_playerCount = 0;
			}
		}
		ds_list_delete(_playerList, 0);
		_playerCount--;
	}
	_playerCount = 0;
	
	y += vsp;
	
	ds_list_destroy(_entityList);
	ds_list_destroy(_playerList);
	
	return _collision;
}