with (instance_create_layer(x, y, "Skill_effects", oCerberusSignExplosion)){
	ownerChar = other.ownerChar;
	
}
instance_destroy(other);
instance_destroy();