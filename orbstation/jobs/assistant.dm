
/// Currently uncalled proc for when I refactor sec officer dept code
/datum/job/assistant/proc/setup_departent(mob/living/carbon/human/target)
	var/department = target.client?.prefs?.read_preference(/datum/preference/choiced/assistant_department)

	switch(department)
		if(ASS_DEPT_ENGINEERING)
			title = "Tech Support"
			supervisors = "The Chief Engineer and everyone else in the Engineering Department"
		if(ASS_DEPT_MEDICAL)
			title = "Nurse"
			supervisors = "The Chief Medical Officer and everyone else in the Medical Department"
		if(ASS_DEPT_SCIENCE)
			title = "Lab Assistant"
			supervisors = "The Research Director and everyone else in the Science Department"
		if(ASS_DEPT_SECURITY)
			title = "Brig Clerk"
			supervisors = "The Head of Security and everyone else in the Security Department"
		if(ASS_DEPT_SERVICE)
			title = "Waitron"
			supervisors = "The Head of Personell and everyone else in the Service Department"
		if(ASS_DEPT_SUPPLY)
			title = "Postie"
			supervisors = "The Quartermaster and everyone else in the Supply Department"

	if(department)
		to_chat(target.client, "<b>You have been assigned to epic [department]!</b>")
	else
		to_chat(target.client, "<b>You have not been assigned to any department. Wander around and help where needed.</b>")


/datum/outfit/job/assistant/pre_equip(mob/living/carbon/human/target)
	..()
	give_jumpsuit(target)
	setup_department_clothing(target)

/// Sets up the proper ID trim and clothing of an assistant department
/datum/outfit/job/assistant/proc/setup_department_clothing(mob/living/carbon/human/target)
	var/department = target.client?.prefs?.read_preference(/datum/preference/choiced/assistant_department)

	var/obj/item/clothing/under/worn_suit = null
	var/obj/item/clothing/under/worn_skirt = null

	switch(department)
		if(ASS_DEPT_ENGINEERING)
			ears = /obj/item/radio/headset/headset_eng
			id_trim = /datum/id_trim/job/assistant/engineering
			worn_suit = /obj/item/clothing/under/color/orange
			worn_skirt = /obj/item/clothing/under/color/jumpskirt/orange
		if(ASS_DEPT_MEDICAL)
			ears = /obj/item/radio/headset/headset_med
			id_trim = /datum/id_trim/job/assistant/medical
			worn_suit = /obj/item/clothing/under/color/blue
			worn_skirt = /obj/item/clothing/under/color/jumpskirt/blue
		if(ASS_DEPT_SCIENCE)
			ears = /obj/item/radio/headset/headset_sci
			id_trim = /datum/id_trim/job/assistant/science
			worn_suit = /obj/item/clothing/under/color/pink
			worn_skirt = /obj/item/clothing/under/color/jumpskirt/pink
		if(ASS_DEPT_SECURITY)
			ears = /obj/item/radio/headset/headset_sec
			id_trim = /datum/id_trim/job/assistant/security
			worn_suit = /obj/item/clothing/under/color/red
			worn_skirt = /obj/item/clothing/under/color/jumpskirt/red
		if(ASS_DEPT_SERVICE)
			ears = /obj/item/radio/headset/headset_srv
			id_trim = /datum/id_trim/job/assistant/service
			worn_suit = /obj/item/clothing/under/suit/waiter
			worn_skirt = /obj/item/clothing/under/suit/waiter
		if(ASS_DEPT_SUPPLY)
			ears = /obj/item/radio/headset/headset_cargo
			id_trim = /datum/id_trim/job/assistant/supply
			worn_suit = /obj/item/clothing/under/misc/mailman
			worn_skirt = /obj/item/clothing/under/misc/mailman

	if (worn_suit && worn_skirt)
		if (target.jumpsuit_style == PREF_SUIT)
			uniform = worn_suit
		else
			uniform = worn_skirt
