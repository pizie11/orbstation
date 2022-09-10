/// Which department to put assistant officers in, when the config is enabled
/datum/preference/choiced/assistant_department
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	can_randomize = FALSE
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "assistant_department"

// This is what that #warn wants you to remove :)
/datum/preference/choiced/assistant_department/deserialize(input, datum/preferences/preferences)
	if (!(input in GLOB.assistant_depts_prefs))
		return ASS_DEPT_NONE
	return ..(input, preferences)

/datum/preference/choiced/assistant_department/init_possible_values()
	return GLOB.assistant_depts_prefs

/datum/preference/choiced/assistant_department/apply_to_human(mob/living/carbon/human/target, value)
	return

/datum/preference/choiced/assistant_department/create_default_value()
	return ASS_DEPT_NONE


