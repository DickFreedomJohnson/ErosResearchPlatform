//Corgi
/mob/living/simple_animal/corgi
	name = "\improper corgi"
	real_name = "corgi"
	desc = "It's a corgi."
	icon_state = "corgi"
	icon_living = "corgi"
	icon_dead = "corgi_dead"
	speak = list("YAP", "Woof!", "Bark!", "AUUUUUU")
	speak_emote = list("barks", "woofs")
	emote_hear = list("barks", "woofs", "yaps","pants")
	emote_see = list("shakes its head", "shivers")
	speak_chance = 1
	turns_per_move = 10
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/corgi
	meat_amount = 3
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	see_in_dark = 5
	mob_size = 8

	var/obj/item/inventory_head
	var/obj/item/inventory_back
	var/facehugger

//IAN! SQUEEEEEEEEE~
/mob/living/simple_animal/corgi/Ian
	name = "Ian"
	real_name = "Ian"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "It's a corgi."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"

/mob/living/simple_animal/corgi/Ian/Life()
	..()

	//Feeding, chasing food, FOOOOODDDD
	if(!stat && !resting && !buckled)
		turns_since_scan++
		if(turns_since_scan > 5)
			turns_since_scan = 0
			if((movement_target) && !(isturf(movement_target.loc) || ishuman(movement_target.loc) ))
				movement_target = null
				stop_automated_movement = 0
			if( !movement_target || !(movement_target.loc in oview(src, 3)) )
				movement_target = null
				stop_automated_movement = 0
				for(var/obj/item/weapon/reagent_containers/food/snacks/S in oview(src,3))
					if(isturf(S.loc) || ishuman(S.loc))
						movement_target = S
						break
			if(movement_target)
				stop_automated_movement = 1
				step_to(src,movement_target,1)
				sleep(3)
				step_to(src,movement_target,1)
				sleep(3)
				step_to(src,movement_target,1)

				if(movement_target)		//Not redundant due to sleeps, Item can be gone in 6 decisecomds
					if (movement_target.loc.x < src.x)
						set_dir(WEST)
					else if (movement_target.loc.x > src.x)
						set_dir(EAST)
					else if (movement_target.loc.y < src.y)
						set_dir(SOUTH)
					else if (movement_target.loc.y > src.y)
						set_dir(NORTH)
					else
						set_dir(SOUTH)

					if(isturf(movement_target.loc) )
						UnarmedAttack(movement_target)
					else if(ishuman(movement_target.loc) && prob(20))
						visible_emote("stares at the [movement_target] that [movement_target.loc] has with sad puppy eyes.")

		if(prob(1))
			visible_emote(pick("dances around","chases their tail"))
			spawn(0)
				for(var/i in list(1,2,4,8,4,2,1,2,4,8,4,2,1,2,4,8,4,2))
					set_dir(i)
					sleep(1)

/obj/item/weapon/reagent_containers/food/snacks/meat/corgi
	name = "Corgi meat"
	desc = "Tastes like... well you know..."

/mob/living/simple_animal/corgi/attackby(var/obj/item/O as obj, var/mob/user as mob)  //Marker -Agouri
	if(istype(O, /obj/item/weapon/newspaper))
		if(!stat)
			for(var/mob/M in viewers(user, null))
				if ((M.client && !( M.blinded )))
					M.show_message("\blue [user] baps [name] on the nose with the rolled up [O]")
			spawn(0)
				for(var/i in list(1,2,4,8,4,2,1,2))
					set_dir(i)
					sleep(1)
	else
		..()

/mob/living/simple_animal/corgi/regenerate_icons()
	overlays = list()

	if(inventory_head)
		var/head_icon_state = inventory_head.icon_state
		if(health <= 0)
			head_icon_state += "2"

		var/icon/head_icon = image('icons/mob/corgi_head.dmi',head_icon_state)
		if(head_icon)
			overlays += head_icon

	if(inventory_back)
		var/back_icon_state = inventory_back.icon_state
		if(health <= 0)
			back_icon_state += "2"

		var/icon/back_icon = image('icons/mob/corgi_back.dmi',back_icon_state)
		if(back_icon)
			overlays += back_icon

	if(facehugger)
		if(istype(src, /mob/living/simple_animal/corgi/puppy))
			overlays += image('icons/mob/mask.dmi',"facehugger_corgipuppy")
		else
			overlays += image('icons/mob/mask.dmi',"facehugger_corgi")

	return


/mob/living/simple_animal/corgi/puppy
	name = "\improper corgi puppy"
	real_name = "corgi"
	desc = "It's a corgi puppy."
	icon_state = "puppy"
	icon_living = "puppy"
	icon_dead = "puppy_dead"

//pupplies cannot wear anything.
/mob/living/simple_animal/corgi/puppy/Topic(href, href_list)
	if(href_list["remove_inv"] || href_list["add_inv"])
		usr << "\red You can't fit this on [src]"
		return
	..()


//LISA! SQUEEEEEEEEE~
/mob/living/simple_animal/corgi/Lisa
	name = "Lisa"
	real_name = "Lisa"
	gender = FEMALE
	desc = "It's a corgi with a cute pink bow."
	icon_state = "lisa"
	icon_living = "lisa"
	icon_dead = "lisa_dead"
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	var/turns_since_scan = 0
	var/puppies = 0

//Lisa already has a cute bow!
/mob/living/simple_animal/corgi/Lisa/Topic(href, href_list)
	if(href_list["remove_inv"] || href_list["add_inv"])
		usr << "\red [src] already has a cute bow!"
		return
	..()

/mob/living/simple_animal/corgi/Lisa/Life()
	..()

	if(!stat && !resting && !buckled)
		turns_since_scan++
		if(turns_since_scan > 15)
			turns_since_scan = 0
			var/alone = 1
			var/ian = 0
			for(var/mob/M in oviewers(7, src))
				if(istype(M, /mob/living/simple_animal/corgi/Ian))
					if(M.client)
						alone = 0
						break
					else
						ian = M
				else
					alone = 0
					break
			if(alone && ian && puppies < 4)
				if(near_camera(src) || near_camera(ian))
					return
				new /mob/living/simple_animal/corgi/puppy(loc)


		if(prob(1))
			visible_emote(pick("dances around","chases her tail"))
			spawn(0)
				for(var/i in list(1,2,4,8,4,2,1,2,4,8,4,2,1,2,4,8,4,2))
					set_dir(i)
					sleep(1)



//Special Corgis



/mob/living/simple_animal/corgi/corgirainbow
	name = "Rainbow Corgi"
	real_name = "Rainbow Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "It's... beautiful..."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgirainbow"
	icon_living = "corgirainbow"
	icon_dead = "corgirainbow_dead"

/mob/living/simple_animal/corgi/corgighost
	name = "Ghost Corgi"
	real_name = "Ghost Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "Aw...! At least its kept its spirits up."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgighost"
	icon_living = "corgighost"
	icon_dead = "corgighost_dead"

/mob/living/simple_animal/corgi/corgihalo
	name = "Holy Corgi"
	real_name = "Holy Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "Wow. This corgi is glowing with a divine light."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgihalo"
	icon_living = "corgihalo"
	icon_dead = "corgihalo_dead"

/mob/living/simple_animal/corgi/corgiangel
	name = "Angelic Corgi"
	real_name = "Angelic Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi has been blessed by the space gods themselves."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgiangel"
	icon_living = "corgiangel"
	icon_dead = "corgiangel_dead"

/mob/living/simple_animal/corgi/corgievil
	name = "Demonic Corgi"
	real_name = "Demonic Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi emits a downright evil aura...!"
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgievil"
	icon_living = "corgievil"
	icon_dead = "corgievil_dead"

/mob/living/simple_animal/corgi/corgizombie
	name = "Zombie Corgi"
	real_name = "Zombie Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "Well, at least it's still alive... kind of?"
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgizombie"
	icon_living = "corgizombie"
	icon_dead = "corgizombie_dead"

/mob/living/simple_animal/corgi/corgipurple
	name = "Purple Corgi"
	real_name = "Purple Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi has purple fur."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgipurple"
	icon_living = "corgipurple"
	icon_dead = "corgipurple_dead"

/mob/living/simple_animal/corgi/corgidblue
	name = "Dark Blue Corgi"
	real_name = "Dark Blue Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi has dark blue fur."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgidblue"
	icon_living = "corgidblue"
	icon_dead = "corgidblue_dead"

/mob/living/simple_animal/corgi/corgidred
	name = "Dark Red Corgi"
	real_name = "Dark Red Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi has dark red fur."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgidred"
	icon_living = "corgidred"
	icon_dead = "corgidred_dead"

/mob/living/simple_animal/corgi/corgigreen
	name = "Green Corgi"
	real_name = "Green Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi has green fur."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgigreen"
	icon_living = "corgigreen"
	icon_dead = "corgigreen_dead"

/mob/living/simple_animal/corgi/corgimagenta
	name = "Magenta Corgi"
	real_name = "Magenta Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi has magenta fur."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgimagenta"
	icon_living = "corgimagenta"
	icon_dead = "corgimagenta_dead"

/mob/living/simple_animal/corgi/corgidyellow
	name = "Dark Yellow Corgi"
	real_name = "Dark Yellow Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi has dark yellow fur."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgidyellow"
	icon_living = "corgidyellow"
	icon_dead = "corgidyellow_dead"

/mob/living/simple_animal/corgi/corgiblue
	name = "Blue Corgi"
	real_name = "Blue Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi has blue fur."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgiblue"
	icon_living = "corgiblue"
	icon_dead = "corgiblue_dead"

/mob/living/simple_animal/corgi/corgiblack
	name = "Black Corgi"
	real_name = "Black Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi has black fur."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgiblack"
	icon_living = "corgiblack"
	icon_dead = "corgiblack_dead"

/mob/living/simple_animal/corgi/corgired
	name = "Red Corgi"
	real_name = "Red Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi has red fur."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgired"
	icon_living = "corgired"
	icon_dead = "corgired_dead"

/mob/living/simple_animal/corgi/corgiyellow
	name = "Yellow Corgi"
	real_name = "Yellow Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi has yellow fur."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgiyellow"
	icon_living = "corgiyellow"
	icon_dead = "corgiyellow_dead"

/mob/living/simple_animal/corgi/corgilime
	name = "Lime Green Corgi"
	real_name = "Lime Green Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi has lime green fur."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgilime"
	icon_living = "corgilime"
	icon_dead = "corgilime_dead"

/mob/living/simple_animal/corgi/corgicyan
	name = "Cyan Corgi"
	real_name = "Cyan Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi has cyan fur."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgicyan"
	icon_living = "corgicyan"
	icon_dead = "corgicyan_dead"

/mob/living/simple_animal/corgi/corgilblue
	name = "Light Blue Corgi"
	real_name = "Light Blue Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi has light blue fur."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgilblue"
	icon_living = "corgilblue"
	icon_dead = "corgilblue_dead"

/mob/living/simple_animal/corgi/corgilpurple
	name = "Light Purple Corgi"
	real_name = "Light Purple Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi has light purple fur."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgilpurple"
	icon_living = "corgilpurple"
	icon_dead = "corgilpurple_dead"

/mob/living/simple_animal/corgi/corgipink
	name = "Pink Corgi"
	real_name = "Pink Corgi"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "This corgi has pink fur."
	var/turns_since_scan = 0
	var/obj/movement_target
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	icon_state = "corgipink"
	icon_living = "corgipink"
	icon_dead = "corgipink_dead"

