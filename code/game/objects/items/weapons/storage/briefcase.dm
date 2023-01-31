/obj/item/storage/briefcase
	name = "briefcase"
	desc = "A sturdy briefcase made of authentic faux-leather."
	icon_state = "briefcase"
	item_state = "briefcase"
	flags = CONDUCT
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = 1
	throw_range = 4
	w_class = ITEM_SIZE_BULKY //Cant normally bag this
	max_w_class = ITEM_SIZE_NORMAL //We can fit anything smaller then us
	max_storage_space = 20 //Its a big case
	matter = list(MATERIAL_BIOMATTER = 8, MATERIAL_PLASTIC = 4)
	price_tag = 90

/obj/item/storage/briefcase/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Brown"] = "briefcase"
	options["Grey"] = "briefcase_grey"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/*
/obj/item/storage/briefcase/rifle //replaced with the 'duffel' child item
	name = "gun case"
	desc = "A sturdy metal case made for transporting ranged weaponry."
	icon_state = "rifle_case"
	item_state = "rifle_case"
	flags = CONDUCT
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = 1
	throw_range = 4
	max_w_class = null
	max_storage_space = 16
	can_hold = list(/obj/item/gun,
		/obj/item/ammo_magazine
		)
	matter = list(MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 4) */
