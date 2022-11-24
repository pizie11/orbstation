/datum/species/human/felinid
	mutant_bodyparts = list("ears" = "Cat", "limb_fur" = "None", "wings" = "None")

	disliked_food = GROSS | CLOTH | CUCUMBER
	liked_food = SEAFOOD | ORANGES | BUGS | GORE

/datum/species/human/felinid/get_scream_sound(mob/living/carbon/human/human)
	return pick(
		'orbstation/sound/voice/felinid/scream1.ogg',
		'orbstation/sound/voice/felinid/scream2.ogg',
	)

/datum/preference/choiced/limb_fur
	savefile_key = "feature_limb_fur"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	main_feature_name = "Limb Fur"
	relevant_mutant_bodypart = "limb_fur"

/datum/preference/choiced/limb_fur/init_possible_values()
	return assoc_to_keys(GLOB.limb_fur_list)

/datum/preference/choiced/limb_fur/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["limb_fur"] = value

/datum/preference/choiced/limb_fur/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "facial_hair_color"

	return data

/// Orb modified nekomimetic to felimimetic, anything dealing with the language in flavourtext is overriden here if possible
/datum/language/nekomimetic
	name = "Felimimetic"
	desc = "The common language of felinds. To a casual observer, it sounds like cat noises."
	space_chance = 35
	syllables = list(
		"a", "e", "i", "o", "u", "y",
		"ao", "aou", "au", "aw", "auw", "ehk", "eow", "iam", "ow", "ew", "wa", "uwa",
		"ma", "me", "mj", "mi", "mi", "mn", "mo", "mr", "mu",
		"na", "ne", "ng", "ni", "no", "nu",
		"nya", "nya", "nye", "nyo", "nyu",
		"pa", "pe", "pff", "pi", "po", "pu",
		"ka", "ke", "ki", "ko", "ku",
		"ra", "re", "ri", "ro", "rr", "ru",
		"ha", "an", "hss", "chr", "rp",
	)

/datum/supply_pack/goody/felinid_encryption_key
	desc = "A hi-tech radio encryption key that allows the wearer to understand felimimetic when the radio is worn."

/obj/item/encryptionkey/felinid
	desc = "An encryption key that automatically encodes felimimetic heard through the radio into common. The signal's rather scratchy."


// Felind sprite accessories go down here

/datum/sprite_accessory/limb_fur
	icon = 'orbstation/icons/mob/species/felind/bodyparts.dmi'

/datum/sprite_accessory/limb_fur
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/limb_fur/fade
	name = "Limb Fur"
	icon_state = "fade"

/datum/sprite_accessory/tails/human/cat/short
	name = "Short Cat"
	icon = 'orbstation/icons/mob/species/felind/bodyparts.dmi'
	icon_state = "cat_short"
