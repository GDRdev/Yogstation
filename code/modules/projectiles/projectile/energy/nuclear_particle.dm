//Nuclear particle projectile - a deadly side effect of fusion just kidding fuck that shit rads shouldn`t be a vomit ICBM
/obj/item/projectile/energy/nuclear_particle
	name = "nuclear particle"
	icon_state = "nuclear_particle"
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	damage = 5
	damage_type = BURN
	irradiate = 400
	speed = 0.4
	hitsound = 'sound/weapons/emitter2.ogg'
	impact_type = /obj/effect/projectile/impact/xray
	var/static/list/particle_colors = list(
		"red" = "#FF0000",
		"green" = "#00FF00",
		"blue" = "#0000FF",
		"yellow" = "#FFFF00",
		"cyan" = "#00FFFF",
		"purple" = "#FF00FF"
	)

/obj/item/projectile/energy/nuclear_particle/Initialize()
	. = ..()
	//Random color time!
	var/our_color = pick(particle_colors)
	add_atom_colour(particle_colors[our_color], FIXED_COLOUR_PRIORITY)
	set_light(4, 3, particle_colors[our_color]) //Range of 4, brightness of 3 - Same range as a flashlight

/atom/proc/fire_nuclear_particle(angle = rand(0,360)) //used by fusion to fire random nuclear particles. Fires one particle in a random direction.
	var/obj/item/projectile/energy/nuclear_particle/P = new /obj/item/projectile/energy/nuclear_particle(src)
	P.fire(angle)

/obj/item/projectile/energy/nuclear_particle/wimpy
	irradiate = 100
	damage = 2

/atom/proc/fire_nuclear_particle_wimpy(angle = rand(0,360))
	var/obj/item/projectile/energy/nuclear_particle/wimpy/P = new /obj/item/projectile/energy/nuclear_particle/wimpy(src)
	P.fire(angle)
