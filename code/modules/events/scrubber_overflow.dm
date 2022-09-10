/datum/round_event_control/scrubber_overflow
	name = "Scrubber Overflow: Normal"
	typepath = /datum/round_event/scrubber_overflow
	weight = 10
	max_occurrences = 3
	min_players = 10

/datum/round_event/scrubber_overflow
	announce_when = 1
	start_when = 5
	end_when = 35
	/// A list of scrubbers that will have reagents ejected from them
	var/list/scrubbers = list()
	/// The probability that the ejected reagents will be dangerous
	var/danger_chance = 1
	/// Amount of reagents ejected from each scrubber
	var/reagents_amount = 50
	/// The list of chems that scrubbers can produce
	var/list/safer_chems = list(/datum/reagent/water,
		/datum/reagent/carbon,
		/datum/reagent/consumable/flour,
		/datum/reagent/space_cleaner,
		/datum/reagent/carpet/royal/blue,
		/datum/reagent/carpet/orange,
		/datum/reagent/consumable/nutriment,
		/datum/reagent/consumable/condensedcapsaicin,
		/datum/reagent/drug/mushroomhallucinogen,
		/datum/reagent/lube,
		/datum/reagent/glitter/blue,
		/datum/reagent/glitter/pink,
		/datum/reagent/cryptobiolin,
		/datum/reagent/blood,
		/datum/reagent/medicine/c2/multiver,
		/datum/reagent/water/holywater,
		/datum/reagent/consumable/ethanol,
		/datum/reagent/consumable/hot_coco,
		/datum/reagent/consumable/yoghurt,
		/datum/reagent/consumable/tinlux,
		/datum/reagent/hydrogen_peroxide,
		/datum/reagent/bluespace,
		/datum/reagent/pax,
		/datum/reagent/consumable/laughter,
		/datum/reagent/concentrated_barbers_aid,
		/datum/reagent/baldium,
		/datum/reagent/colorful_reagent,
		/datum/reagent/consumable/salt,
		/datum/reagent/consumable/ethanol/beer,
		/datum/reagent/hair_dye,
		/datum/reagent/consumable/sugar,
		/datum/reagent/glitter/white,
		/datum/reagent/gravitum,
		/datum/reagent/growthserum,
		/datum/reagent/yuck,
	)
	//needs to be chemid unit checked at some point

/datum/round_event/scrubber_overflow/announce()
	priority_announce("The scrubbers network is experiencing a backpressure surge. Some ejection of contents may occur.", "Atmospherics alert")

/datum/round_event/scrubber_overflow/setup()
	end_when = rand(25, 100)
	for(var/obj/machinery/atmospherics/components/unary/vent_scrubber/temp_vent in GLOB.machines)
		var/turf/scrubber_turf = get_turf(temp_vent)
		if(scrubber_turf && is_station_level(scrubber_turf.z) && !temp_vent.welded && prob(50))
			scrubbers += temp_vent
	if(!scrubbers.len)
		return kill()

/datum/round_event/scrubber_overflow/start()
	for(var/obj/machinery/atmospherics/components/unary/vent in scrubbers)
		if(!vent.loc)
			CHECK_TICK
			return ..()

		var/datum/reagents/dispensed_reagent = new/datum/reagents(1000)
		dispensed_reagent.my_atom = vent
		if (prob(danger_chance))
			dispensed_reagent.add_reagent(get_random_reagent_id(), reagents_amount)
		else
			dispensed_reagent.add_reagent(pick(safer_chems), reagents_amount)

		dispensed_reagent.create_foam(/datum/effect_system/fluid_spread/foam, 50)

		if (prob(25))
			new /mob/living/basic/cockroach(get_turf(vent))
			new /mob/living/basic/cockroach(get_turf(vent))

		CHECK_TICK

/datum/round_event_control/scrubber_overflow/threatening
	name = "Scrubber Overflow: Threatening"
	typepath = /datum/round_event/scrubber_overflow/threatening
	weight = 4
	min_players = 25
	max_occurrences = 1
	earliest_start = 35 MINUTES

/datum/round_event/scrubber_overflow/threatening
	danger_chance = 10
	reagents_amount = 100

/datum/round_event_control/scrubber_overflow/catastrophic
	name = "Scrubber Overflow: Catastrophic"
	typepath = /datum/round_event/scrubber_overflow/catastrophic
	weight = 2
	min_players = 35
	max_occurrences = 1
	earliest_start = 45 MINUTES

/datum/round_event/scrubber_overflow/catastrophic
	danger_chance = 30
	reagents_amount = 150
