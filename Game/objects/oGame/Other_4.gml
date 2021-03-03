//layer management
layer_set_visible("Tile", false);
layer_set_visible("Obstruction", false);

instance_create_layer(0, 0, "Instance", oAStar);

//Transition between rooms
TransitionScript();