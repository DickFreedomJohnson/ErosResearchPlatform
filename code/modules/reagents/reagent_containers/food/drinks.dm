////////////////////////////////////////////////////////////////////////////////
/// Drinks.
////////////////////////////////////////////////////////////////////////////////
/obj/item/weapon/reagent_containers/food/drinks
	name = "drink"
	desc = "yummy"
	icon = 'icons/obj/drinks.dmi'
	icon_state = null
	flags = OPENCONTAINER
	amount_per_transfer_from_this = 5
	volume = 50

	on_reagent_change()
		return

	attack_self(mob/user as mob)
		if(!is_open_container())
			open(user)

	proc/open(mob/user)
		playsound(loc,'sound/effects/canopen.ogg', rand(10,50), 1)
		user << "<span class='notice'>You open [src] with an audible pop!</span>"
		flags |= OPENCONTAINER

	attack(mob/M as mob, mob/user as mob, def_zone)
		if(standard_feed_mob(user, M))
			return

		return 0

	afterattack(obj/target, mob/user, proximity)
		if(!proximity) return

		if(standard_dispenser_refill(user, target))
			return
		if(standard_pour_into(user, target))
			return
		return ..()

	standard_feed_mob(var/mob/user, var/mob/target)
		if(!is_open_container())
			user << "<span class='notice'>You need to open [src]!</span>"
			return 1
		return ..()

	standard_dispenser_refill(var/mob/user, var/obj/structure/reagent_dispensers/target)
		if(!is_open_container())
			user << "<span class='notice'>You need to open [src]!</span>"
			return 1
		return ..()

	standard_pour_into(var/mob/user, var/atom/target)
		if(!is_open_container())
			user << "<span class='notice'>You need to open [src]!</span>"
			return 1
		return ..()

	self_feed_message(var/mob/user)
		user << "<span class='notice'>You swallow a gulp from \the [src].</span>"

	feed_sound(var/mob/user)
		playsound(user.loc, 'sound/items/drink.ogg', rand(10, 50), 1)

	examine(mob/user)
		if(!..(user, 1))
			return
		if(!reagents || reagents.total_volume == 0)
			user << "<span class='notice'>\The [src] is empty!</span>"
		else if (reagents.total_volume <= volume * 0.25)
			user << "<span class='notice'>\The [src] is almost empty!</span>"
		else if (reagents.total_volume <= volume * 0.66)
			user << "<span class='notice'>\The [src] is half full!</span>"
		else if (reagents.total_volume <= volume * 0.90)
			user << "<span class='notice'>\The [src] is almost full!</span>"
		else
			user << "<span class='notice'>\The [src] is full!</span>"


////////////////////////////////////////////////////////////////////////////////
/// Drinks. END
////////////////////////////////////////////////////////////////////////////////

/obj/item/weapon/reagent_containers/food/drinks/golden_cup
	desc = "A golden cup"
	name = "golden cup"
	icon_state = "golden_cup"
	item_state = "" //nope :(
	w_class = 4
	force = 14
	throwforce = 10
	amount_per_transfer_from_this = 20
	possible_transfer_amounts = null
	volume = 150
	flags = CONDUCT | OPENCONTAINER

/obj/item/weapon/reagent_containers/food/drinks/golden_cup/tournament_26_06_2011
	desc = "A golden cup. It will be presented to a winner of tournament 26 june and name of the winner will be graved on it."


///////////////////////////////////////////////Drinks
//Notes by Darem: Drinks are simply containers that start preloaded. Unlike condiments, the contents can be ingested directly
//	rather then having to add it to something else first. They should only contain liquids. They have a default container size of 50.
//	Formatting is the same as food.

/obj/item/weapon/reagent_containers/food/drinks/milk
	name = "Space Milk"
	desc = "It's milk. White and nutritious goodness!"
	icon_state = "milk"
	item_state = "carton"
	center_of_mass = list("x"=16, "y"=9)
	New()
		..()
		reagents.add_reagent("milk", 50)

/obj/item/weapon/reagent_containers/food/drinks/soymilk
	name = "SoyMilk"
	desc = "It's soy milk. White and nutritious goodness!"
	icon_state = "soymilk"
	item_state = "carton"
	center_of_mass = list("x"=16, "y"=9)
	New()
		..()
		reagents.add_reagent("soymilk", 50)

/obj/item/weapon/reagent_containers/food/drinks/coffee
	name = "Robust Coffee"
	desc = "Careful, the beverage you're about to enjoy is extremely hot."
	icon_state = "coffee"
	center_of_mass = list("x"=15, "y"=10)
	New()
		..()
		reagents.add_reagent("coffee", 50)

/obj/item/weapon/reagent_containers/food/drinks/tea
	name = "Duke Purple Tea"
	desc = "An insult to Duke Purple is an insult to the Space Queen! Any proper gentleman will fight you, if you sully this tea."
	icon_state = "teacup"
	item_state = "coffee"
	center_of_mass = list("x"=16, "y"=14)
	New()
		..()
		reagents.add_reagent("tea", 50)

/obj/item/weapon/reagent_containers/food/drinks/ice
	name = "Ice Cup"
	desc = "Careful, cold ice, do not chew."
	icon_state = "coffee"
	center_of_mass = list("x"=15, "y"=10)
	New()
		..()
		reagents.add_reagent("ice", 50)

/obj/item/weapon/reagent_containers/food/drinks/h_chocolate
	name = "Dutch Hot Coco"
	desc = "Made in Space South America."
	icon_state = "hot_coco"
	item_state = "coffee"
	center_of_mass = list("x"=15, "y"=13)
	New()
		..()
		reagents.add_reagent("hot_coco", 50)

/obj/item/weapon/reagent_containers/food/drinks/dry_ramen
	name = "Cup Ramen"
	desc = "Just add 10ml water, self heats! A taste that reminds you of your school years."
	icon_state = "ramen"
	center_of_mass = list("x"=16, "y"=11)
	New()
		..()
		reagents.add_reagent("dry_ramen", 30)


/obj/item/weapon/reagent_containers/food/drinks/sillycup
	name = "Paper Cup"
	desc = "A paper water cup."
	icon_state = "water_cup_e"
	possible_transfer_amounts = null
	volume = 10
	center_of_mass = list("x"=16, "y"=12)
	New()
		..()
	on_reagent_change()
		if(reagents.total_volume)
			icon_state = "water_cup"
		else
			icon_state = "water_cup_e"


/obj/item/weapon/reagent_containers/food/drinks/groans
	name = "Groans Soda"
	desc = "Groans Soda: We'll make you groan"
	icon_state = "groans"
	center_of_mass = list("x"=15, "y"=13)
	New()
/obj/item/weapon/reagent_containers/food/drinks/groans/New()
	..()
	switch(pick(1,2,3,4,5))
		if(1)
			name = "Groans Soda: Cuban Spice Flavor"
			desc = "Warning: Long exposure to liquid inside may cause you to follow the rumba beat."
			icon_state += "_hot"
			reagents.add_reagent("condensedcapsaicin", 10)
			reagents.add_reagent("rum", 10)
		if(2)
			name = "Groans Soda: Icey Cold Flavor"
			desc = "Cold in a can. Er, bottle."
			icon_state += "_cold"
			reagents.add_reagent("frostoil", 10)
			reagents.add_reagent("ice", 10)
		if(3)
			name = "Groans Soda: Zero Calories"
			desc = "Zero Point Calories. That's right, we fit even MORE nutriment in this thing."
			icon_state += "_nutriment"
			reagents.add_reagent("nutriment", 20)
		if(4)
			name = "Groans Soda: Energy Shot"
			desc = "Warning: The Groans Energy Blend(tm), may be toxic to those without constant exposure to chemical waste. Drink responsibly."
			icon_state += "_energy"
			reagents.add_reagent("sugar", 10)
			reagents.add_reagent("chemical_waste", 10)
		if(5)
			name = "Groans Soda: Double Dan"
			desc = "Just when you thought you've had enough Dan, The 'Double Dan' strikes back with this wonderful mixture of too many flavors. Bring a barf bag, Drink responsibly."
			icon_state += "_doubledew"
			reagents.add_reagent("discount", 20)
	reagents.add_reagent("discount", 10)


/obj/item/weapon/reagent_containers/food/drinks/filk
	name = "Filk"
	desc = "Only the best Filk for your crew."
	icon_state = "filk"
	center_of_mass = list("x"=16, "y"=11)
	New()
/obj/item/weapon/reagent_containers/food/drinks/filk/New()
	..()
	switch(pick(1,2,3,4,5))
		if(1)
			name = "Filk: Chocolate Edition"
			reagents.add_reagent("hot_coco", 10)
		if(2)
			name = "Filk: Scripture Edition"
			reagents.add_reagent("holywater", 30)
		if(3)
			name = "Filk: Carribean Edition"
			reagents.add_reagent("rum", 30)
		if(4)
			name = "Filk: Sugar Blast Editon"
			reagents.add_reagent("sugar", 30)
			reagents.add_reagent("radium", 10) // le epik fallout may mays
			reagents.add_reagent("toxicwaste", 10)
		if(5)
			name = "Filk: Pure Filk Edition"
			reagents.add_reagent("discount", 20)
	reagents.add_reagent("discount", 10)

/obj/item/weapon/reagent_containers/food/drinks/grifeo
	name = "Grifeo"
	desc = "A quality drink."
	icon_state = "griefo"
	center_of_mass = list("x"=16, "y"=11)
	New()
/obj/item/weapon/reagent_containers/food/drinks/grifeo/New()
	..()
	switch(pick(1,2,3,4,5))
		if(1)
			name = "Grifeo: Spicy"
			reagents.add_reagent("condensedcapsaicin", 30)
		if(2)
			name = "Grifeo: Frozen"
			reagents.add_reagent("frostoil", 30)
		if(3)
			name = "Grifeo: Crystallic"
			reagents.add_reagent("sugar", 20)
			reagents.add_reagent("ice", 20)
			reagents.add_reagent("space_drugs", 20)
		if(4)
			name = "Grifeo: Rich"
			reagents.add_reagent("tequila", 10)
			reagents.add_reagent("chemical_waste", 10)
		if(5)
			name = "Grifeo: Pure"
			reagents.add_reagent("discount", 20)
	reagents.add_reagent("discount", 10)


/obj/item/weapon/reagent_containers/food/drinks/groansbanned
	name = "Groans: Banned Edition"
	desc = "Banned literally everywhere."
	icon_state = "groansevil"
	center_of_mass = list("x"=16, "y"=11)
	New()
/obj/item/weapon/reagent_containers/food/drinks/groansbanned/New()
	..()
	switch(pick(1,2,3,4,5))
		if(1)
			name = "Groans Banned Soda: Fish Suprise"
			reagents.add_reagent("carpotoxin", 10)
		if(2)
			name = "Groans Banned Soda: Bitter Suprise"
			reagents.add_reagent("toxin", 20)
		if(3)
			name = "Groans Banned Soda: Sour Suprise"
			reagents.add_reagent("pacid", 20)
		if(4)
			name = "Groans Banned Soda: Sleepy Suprise"
			reagents.add_reagent("stoxin", 10)
		if(5)
			name = "Groans Banned Soda: Quadruple Dan"
			reagents.add_reagent("discount", 40)
	reagents.add_reagent("discount", 10)


/obj/item/weapon/reagent_containers/food/drinks/sportdrink
	name = "Brawndo"
	icon_state = "brawndo"
	desc = "It has what plants crave! Electrolytes!"
	center_of_mass = list("x"=16, "y"=11)
	New()
/obj/item/weapon/reagent_containers/food/drinks/sportdrink/New()
	..()
	reagents.add_reagent("sportdrink", 30)

/obj/item/weapon/reagent_containers/food/drinks/mannsdrink
	name = "Mann's Drink"
	desc = "The only thing a <B>REAL MAN</B> needs."
	icon_state = "mannsdrink"
	center_of_mass = list("x"=16, "y"=11)
	New()
/obj/item/weapon/reagent_containers/food/drinks/mannsdrink/New()
	..()
	reagents.add_reagent("discount", 30)
	reagents.add_reagent("water", 20)



//////////////////////////drinkingglass and shaker//
//Note by Darem: This code handles the mixing of drinks. New drinks go in three places: In Chemistry-Reagents.dm (for the drink
//	itself), in Chemistry-Recipes.dm (for the reaction that changes the components into the drink), and here (for the drinking glass
//	icon states.

/obj/item/weapon/reagent_containers/food/drinks/shaker
	name = "Shaker"
	desc = "A metal shaker to mix drinks in."
	icon_state = "shaker"
	amount_per_transfer_from_this = 10
	volume = 120
	center_of_mass = list("x"=17, "y"=10)

/obj/item/weapon/reagent_containers/food/drinks/teapot
	name = "teapot"
	desc = "An elegant teapot. It simply oozes class."
	icon_state = "teapot"
	item_state = "teapot"
	amount_per_transfer_from_this = 10
	volume = 120
	center_of_mass = list("x"=17, "y"=7)

/obj/item/weapon/reagent_containers/food/drinks/flask
	name = "Captain's Flask"
	desc = "A metal flask belonging to the captain"
	icon_state = "flask"
	volume = 60
	center_of_mass = list("x"=17, "y"=7)

/obj/item/weapon/reagent_containers/food/drinks/flask/shiny
	name = "shiny flask"
	desc = "A shiny metal flask. It appears to have a Greek symbol inscribed on it."
	icon_state = "shinyflask"

/obj/item/weapon/reagent_containers/food/drinks/flask/lithium
	name = "lithium flask"
	desc = "A flask with a Lithium Atom symbol on it."
	icon_state = "lithiumflask"

/obj/item/weapon/reagent_containers/food/drinks/flask/detflask
	name = "Detective's Flask"
	desc = "A metal flask with a leather band and golden badge belonging to the detective."
	icon_state = "detflask"
	volume = 60
	center_of_mass = list("x"=17, "y"=8)

/obj/item/weapon/reagent_containers/food/drinks/flask/barflask
	name = "flask"
	desc = "For those who can't be bothered to hang out at the bar to drink."
	icon_state = "barflask"
	volume = 60
	center_of_mass = list("x"=17, "y"=7)

/obj/item/weapon/reagent_containers/food/drinks/flask/vacuumflask
	name = "vacuum flask"
	desc = "Keeping your drinks at the perfect temperature since 1892."
	icon_state = "vacuumflask"
	volume = 60
	center_of_mass = list("x"=15, "y"=4)

/obj/item/weapon/reagent_containers/food/drinks/britcup
	name = "cup"
	desc = "A cup with the British flag emblazoned on it."
	icon_state = "britcup"
	volume = 30
	center_of_mass = list("x"=15, "y"=13)
