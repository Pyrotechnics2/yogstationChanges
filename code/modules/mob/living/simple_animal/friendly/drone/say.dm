
/////////////
//DRONE SAY//
/////////////
//Drone speach

/mob/living/simple_animal/drone/handle_inherent_channels(message, message_mode)
	if(message_mode == MODE_BINARY)
		drone_chat(message)
		return 1
	else
		..()


/mob/living/simple_animal/drone/proc/alert_drones(msg, dead_can_hear = 0)
	for(var/W in mob_list)
		var/mob/living/simple_animal/drone/M = W
		if(istype(M) && M.stat != DEAD && faction_check(M)) //if it's a living drone with matching factions, it gets a message
			M << msg
		if(dead_can_hear && (M in dead_mob_list))
			var/link = FOLLOW_LINK(M, src)
			M << "[link] [msg]"


/mob/living/simple_animal/drone/proc/drone_chat(msg)
	var/rendered = "<i>DRONE CHAT: <span class='name'>[name]</span>: [msg]</i>"
	alert_drones(rendered, 1)
