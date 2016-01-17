/obj/item/weapon/melee/chainofcommand
	name = "chain of command"
	desc = "A tool used by great men to placate the frothing masses."
	icon_state = "chain"
	item_state = "chain"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 10
	throwforce = 7
	w_class = 3
	origin_tech = "combat=4"
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")

	suicide_act(mob/user)
		viewers(user) << "\red <b>[user] is strangling \himself with the [src.name]! It looks like \he's trying to commit suicide.</b>"
		return (OXYLOSS)

/obj/item/weapon/melee/fluff/holochain
	name = "Holographic Chain"
	desc = "A High Tech solution to simple perversions."
	icon = 'icons/obj/custom_items_obj.dmi'
	icon_state = "holochain"
	item_state = "holochain"
	flags = CONDUCT | NOBLOODY
	no_attack_log = 1
	slot_flags = SLOT_BELT
	force = 10
	throwforce = 3
	w_class = 3
	damtype = HALLOSS
	attack_verb = list("flogged", "whipped", "lashed", "disciplined", "chastised", "flayed")


/obj/item/weapon/melee/fluff/dildos/metal_dildo
	name = "metal dildo"
	desc = "For when the real thing just doesn't cut it."
	icon = 'icons/obj/adult_toy.dmi'
	icon_state = "metal_dildo"
	item_state = "metal_dildo"
	slot_flags = SLOT_BELT
	attack_verb = list("fucked", "probed", "violated", "teased", "prodded")

/obj/item/weapon/melee/fluff/dildos/bigblackdick
	name = "big black dick"
	desc = "For when the real thing just doesn't cut it."
	icon = 'icons/obj/adult_toy.dmi'
	icon_state = "bigblackdick"
	item_state = "bigblackdick"
	slot_flags = SLOT_BELT
	attack_verb = list("fucked", "probed", "violated", "teased", "prodded")

/obj/item/weapon/melee/fluff/dildos/purple_dong
	name = "purple dong"
	desc = "For when the real thing just doesn't cut it."
	icon = 'icons/obj/adult_toy.dmi'
	icon_state = "purple-dong"
	item_state = "purple-dong"
	slot_flags = SLOT_BELT
	attack_verb = list("fucked", "probed", "violated", "teased", "prodded")

/obj/item/weapon/melee/fluff/dildos/canine
	name = "canine dildo"
	desc = "For when the real thing just doesn't cut it."
	icon = 'icons/obj/adult_toy.dmi'
	icon_state = "canine"
	item_state = "canine"
	slot_flags = SLOT_BELT
	attack_verb = list("fucked", "probed", "violated", "teased", "prodded")

/obj/item/weapon/melee/fluff/dildos/floppydick
	name = "floppy dick"
	desc = "For when the real thing just doesn't cut it."
	icon = 'icons/obj/adult_toy.dmi'
	icon_state = "floppydick"
	item_state = "floppydick"
	slot_flags = SLOT_BELT
	attack_verb = list("fucked", "probed", "violated", "teased", "prodded")

/obj/item/weapon/melee/fluff/bulletvibe
	name = "floppy dick"
	desc = "For when the real thing just doesn't cut it."
	icon = 'icons/obj/adult_toy.dmi'
	icon_state = "floppydick"
	item_state = "floppydick"
	slot_flags = SLOT_BELT
	attack_verb = list("pleasured", "vibrated", "violated", "teased", "poked")

/obj/item/weapon/melee/fluff/hardlightXL
	name = "hardlightXL panties"
	desc = "For when the real thing just doesn't cut it."
	icon = 'icons/obj/adult_toy.dmi'
	icon_state = "hardlight"
	item_state = "hardlight_xl"
	slot_flags = SLOT_BELT
	attack_verb = list("pleasured", "vibrated", "violated", "teased", "poked")

/obj/item/weapon/melee/fluff/hardlight
	name = "hardlight panties"
	desc = "For when the real thing just doesn't cut it."
	icon = 'icons/obj/adult_toy.dmi'
	icon_state = "hardlight"
	item_state = "hardlight"
	slot_flags = SLOT_BELT
	attack_verb = list("pleasured", "vibrated", "violated", "teased", "poked")