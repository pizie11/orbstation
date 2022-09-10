/datum/id_trim/job/assistant
	assignment = "Assistant"
	trim_state = "trim_assistant"
	sechud_icon_state = SECHUD_ASSISTANT
	minimal_access = list()
	extra_access = list(
		ACCESS_MAINT_TUNNELS,
		)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_HOP,
		)
	job = /datum/job/assistant
	/// List of bonus departmental accesses that departmental assistants get by default.
	var/department_access = list()
	/// List of bonus departmental accesses that departmental assistants get when CONFIG_GET(flag/jobs_have_minimal_access) is FALSE.
	var/dep_extra_access = list()

/datum/id_trim/job/assistant/refresh_trim_access()
	. = ..()

	if(!.)
		return

	// Config has assistant maint access set.
	if(CONFIG_GET(flag/assistants_have_maint_access))
		access |= list(
			ACCESS_MAINT_TUNNELS)

	// Add department access (if no department is selected, nothing happens here)
	access |= department_access

	// Add extra department access if minimal access is enabled
	if(CONFIG_GET(flag/jobs_have_minimal_access))
		access = minimal_access |= dep_extra_access

/datum/id_trim/job/assistant/engineering
	assignment = "Tech Support"
	subdepartment_color = COLOR_ENGINEERING_ORANGE
	department_access = list(
		ACCESS_CONSTRUCTION,
		ACCESS_ENGINEERING,
		ACCESS_MAINT_TUNNELS,
	)
	dep_extra_access = list(
		ACCESS_ATMOSPHERICS,
		ACCESS_AUX_BASE,
		ACCESS_ENGINE_EQUIP,
	)

/datum/id_trim/job/assistant/medical
	assignment = "Nurse"
	subdepartment_color = COLOR_MEDICAL_BLUE
	department_access = list(
		ACCESS_MEDICAL,
		ACCESS_MORGUE,
		ACCESS_SURGERY,
	)
	dep_extra_access = list(
		ACCESS_PHARMACY,
	)

/datum/id_trim/job/assistant/science
	assignment = "Lab Assistant"
	subdepartment_color = COLOR_SCIENCE_PINK
	department_access = list(
		ACCESS_RESEARCH,
		ACCESS_SCIENCE,
	)
	dep_extra_access = list(
		ACCESS_AUX_BASE,
		ACCESS_GENETICS,
		ACCESS_ROBOTICS,
		ACCESS_XENOBIOLOGY,
	)

/datum/id_trim/job/assistant/security
	assignment = "Brig Clerk"
	subdepartment_color = COLOR_SECURITY_RED
	department_access = list(
		ACCESS_BRIG_ENTRANCE,
		ACCESS_COURT,
	)
	dep_extra_access = list()

/datum/id_trim/job/assistant/service
	assignment = "Server"
	subdepartment_color = COLOR_SERVICE_LIME
	department_access = list(
		ACCESS_SERVICE,
	)
	dep_extra_access = list(
		ACCESS_BAR,
		ACCESS_HYDROPONICS,
		ACCESS_KITCHEN,
		ACCESS_THEATRE,
	)

/datum/id_trim/job/assistant/supply
	assignment = "Postie"
	subdepartment_color = COLOR_CARGO_BROWN
	department_access = list(
		ACCESS_CARGO,
		ACCESS_SHIPPING,
	)
	dep_extra_access = list()
