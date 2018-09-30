local old_unit_cat = GroupAITweakData._init_unit_categories
local old_spawn_group = GroupAITweakData._init_enemy_spawn_groups
local old_task_data = GroupAITweakData._init_task_data

function GroupAITweakData:_init_unit_categories(difficulty_index)
	old_unit_cat(self, difficulty_index)
	local access_type_walk_only = {walk = true}
	local access_type_all = {
		acrobatic = true,
		walk = true
	}
	self.special_unit_spawn_limits = {
		tank = 2,
		taser = 4,
		boom = 2,
		spooc = 4,
		shield = 6,
		medic = 4,
		ass_sniper = 3
	}
	self.unit_categories.deathvox_guard = {
		unit_types = {
			cop = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_guard/ene_deathvox_guard")
			},
			fbi = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_guard/ene_deathvox_guard")
			},
			gensec = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_guard/ene_deathvox_guard")
			},
			zeal = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_guard/ene_deathvox_guard")
			}		
		},
		unit_type_spawner = {
			cop = "units/pd2_mod_gageammo/characters/ene_deathvox_guard/ene_deathvox_guard",
			fbi = "units/pd2_mod_gageammo/characters/ene_deathvox_guard/ene_deathvox_guard",
			gensec = "units/pd2_mod_gageammo/characters/ene_deathvox_guard/ene_deathvox_guard",
			zeal = "units/pd2_mod_gageammo/characters/ene_deathvox_guard/ene_deathvox_guard"
		},
		access = access_type_all
	}
	self.unit_categories.deathvox_grenadier = {
		unit_types = {
			cop = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_grenadier/ene_deathvox_grenadier")
			},
			fbi = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_grenadier/ene_deathvox_grenadier")
			},
			gensec = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_grenadier/ene_deathvox_grenadier")
			},
			zeal = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_grenadier/ene_deathvox_grenadier")
			}		
		},
		unit_type_spawner = {
			cop = "units/pd2_mod_gageammo/characters/ene_deathvox_grenadier/ene_deathvox_grenadier",
			fbi = "units/pd2_mod_gageammo/characters/ene_deathvox_grenadier/ene_deathvox_grenadier",
			gensec = "units/pd2_mod_gageammo/characters/ene_deathvox_grenadier/ene_deathvox_grenadier",
			zeal = "units/pd2_mod_gageammo/characters/ene_deathvox_grenadier/ene_deathvox_grenadier"
		},
		access = access_type_all,
		special_type = "boom"
	}
	self.unit_categories.deathvox_lightar = {
		unit_types = {
			cop = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar")
			},
			fbi = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar")
			},
			gensec = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar")
			},
			zeal = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar")
			}
		},
		unit_type_spawner = {
			cop = "units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar",
			fbi = "units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar",
			gensec = "units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar",
			zeal = "units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar"
		},
		access = access_type_all
	}
	self.unit_categories.deathvox_heavyar = {
		unit_types = {
			cop = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_heavyar/ene_deathvox_heavyar")
			},
			fbi = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_heavyar/ene_deathvox_heavyar")
			},
			gensec = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_heavyar/ene_deathvox_heavyar")
			},
			zeal = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_heavyar/ene_deathvox_heavyar")
			}			
		},
		unit_type_spawner = {
			cop = "units/pd2_mod_gageammo/characters/ene_deathvox_heavyar/ene_deathvox_heavyar",
			fbi = "units/pd2_mod_gageammo/characters/ene_deathvox_heavyar/ene_deathvox_heavyar",
			gensec = "units/pd2_mod_gageammo/characters/ene_deathvox_heavyar/ene_deathvox_heavyar",
			zeal = "units/pd2_mod_gageammo/characters/ene_deathvox_heavyar/ene_deathvox_heavyar"
		},
		access = access_type_all
	}
	self.unit_categories.deathvox_lightshot = {
		unit_types = {
			cop = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_lightshot/ene_deathvox_lightshot")
			},
			fbi = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_lightshot/ene_deathvox_lightshot")
			},
			gensec = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_lightshot/ene_deathvox_lightshot")
			},
			zeal = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_lightshot/ene_deathvox_lightshot")
			}						
		},
		unit_type_spawner = {
			cop = "units/pd2_mod_gageammo/characters/ene_deathvox_lightshot/ene_deathvox_lightshot",
			fbi = "units/pd2_mod_gageammo/characters/ene_deathvox_lightshot/ene_deathvox_lightshot",
			gensec = "units/pd2_mod_gageammo/characters/ene_deathvox_lightshot/ene_deathvox_lightshot",
			zeal = "units/pd2_mod_gageammo/characters/ene_deathvox_lightshot/ene_deathvox_lightshot"
		},
		access = access_type_all
	}
	self.unit_categories.deathvox_heavyshot = {
		unit_types = {
			cop = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_heavyshot/ene_deathvox_heavyshot")
			},
			fbi = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_heavyshot/ene_deathvox_heavyshot")
			},
			gensec = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_heavyshot/ene_deathvox_heavyshot")
			},
			zeal = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_heavyshot/ene_deathvox_heavyshot")
			}					
		},
		unit_type_spawner = {
			cop = "units/pd2_mod_gageammo/characters/ene_deathvox_heavyshot/ene_deathvox_heavyshot",
			fbi = "units/pd2_mod_gageammo/characters/ene_deathvox_heavyshot/ene_deathvox_heavyshot",
			gensec = "units/pd2_mod_gageammo/characters/ene_deathvox_heavyshot/ene_deathvox_heavyshot",
			zeal = "units/pd2_mod_gageammo/characters/ene_deathvox_heavyshot/ene_deathvox_heavyshot"
		},
		access = access_type_all
	}
	self.unit_categories.deathvox_shield = {
		unit_types = {
			cop = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_shield/ene_deathvox_shield")
			},
			fbi = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_shield/ene_deathvox_shield")
			},
			gensec = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_shield/ene_deathvox_shield")
			},
			zeal = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_shield/ene_deathvox_shield")
			}				
		},
		unit_type_spawner = {
			cop = "units/pd2_mod_gageammo/characters/ene_deathvox_shield/ene_deathvox_shield",
			fbi = "units/pd2_mod_gageammo/characters/ene_deathvox_shield/ene_deathvox_shield",
			gensec = "units/pd2_mod_gageammo/characters/ene_deathvox_shield/ene_deathvox_shield",
			zeal = "units/pd2_mod_gageammo/characters/ene_deathvox_shield/ene_deathvox_shield"
		},
		access = access_type_all,
		special_type = "shield"
	}
	self.unit_categories.deathvox_medic = {
		unit_types = {
			cop = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_cop_medic/ene_deathvox_cop_medic")
			},
			fbi = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_fbi_medic/ene_deathvox_fbi_medic")
			},
			gensec = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_gensec_medic/ene_deathvox_gensec_medic")
			},
			zeal = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_medic/ene_deathvox_medic")
			}	
		},
		unit_type_spawner = {
			cop = "units/pd2_mod_gageammo/characters/ene_deathvox_cop_medic/ene_deathvox_cop_medic",
			fbi = "units/pd2_mod_gageammo/characters/ene_deathvox_fbi_medic/ene_deathvox_fbi_medic",
			gensec = "units/pd2_mod_gageammo/characters/ene_deathvox_gensec_medic/ene_deathvox_gensec_medic",
			zeal = "units/pd2_mod_gageammo/characters/ene_deathvox_medic/ene_deathvox_medic"
		},
		access = access_type_all,
		special_type = "medic"
	}
	self.unit_categories.deathvox_taser = {
		unit_types = {
			cop = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_cop_taser/ene_deathvox_cop_taser")
			},
			fbi = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_fbi_taser/ene_deathvox_fbi_taser")
			},
			gensec = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_gensec_taser/ene_deathvox_gensec_taser")
			},
			zeal = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_taser/ene_deathvox_taser")
			}				
		},
		unit_type_spawner = {
			cop = "units/pd2_mod_gageammo/characters/ene_deathvox_cop_taser/ene_deathvox_cop_taser",
			fbi = "units/pd2_mod_gageammo/characters/ene_deathvox_fbi_taser/ene_deathvox_fbi_taser",
			gensec = "units/pd2_mod_gageammo/characters/ene_deathvox_gensec_taser/ene_deathvox_gensec_taser",
			zeal = "units/pd2_mod_gageammo/characters/ene_deathvox_taser/ene_deathvox_taser"
		},
		access = access_type_all,
		special_type = "taser"
	}
	self.unit_categories.deathvox_greendozer = {
		unit_types = {
			cop = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_greendozer/ene_deathvox_greendozer")
			},
			fbi = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_greendozer/ene_deathvox_greendozer")
			},
			gensec = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_greendozer/ene_deathvox_greendozer")
			},
			zeal = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_greendozer/ene_deathvox_greendozer")
			}		
		},
		unit_type_spawner = {
			cop = "units/pd2_mod_gageammo/characters/ene_deathvox_greendozer/ene_deathvox_greendozer",
			fbi = "units/pd2_mod_gageammo/characters/ene_deathvox_greendozer/ene_deathvox_greendozer",
			gensec = "units/pd2_mod_gageammo/characters/ene_deathvox_greendozer/ene_deathvox_greendozer",
			zeal = "units/pd2_mod_gageammo/characters/ene_deathvox_greendozer/ene_deathvox_greendozer"
		},
		access = access_type_all,
		special_type = "tank"
	}
	self.unit_categories.deathvox_medicdozer = {
		unit_types = {
			cop = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_medicdozer/ene_deathvox_medicdozer")
			},
			fbi = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_medicdozer/ene_deathvox_medicdozer")
			},
			gensec = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_medicdozer/ene_deathvox_medicdozer")
			},
			zeal = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_medicdozer/ene_deathvox_medicdozer")
			}					
		},
		unit_type_spawner = {
			cop = "units/pd2_mod_gageammo/characters/ene_deathvox_medicdozer/ene_deathvox_medicdozer",
			fbi = "units/pd2_mod_gageammo/characters/ene_deathvox_medicdozer/ene_deathvox_medicdozer",
			gensec = "units/pd2_mod_gageammo/characters/ene_deathvox_medicdozer/ene_deathvox_medicdozer",
			zeal = "units/pd2_mod_gageammo/characters/ene_deathvox_medicdozer/ene_deathvox_medicdozer"
		},
		access = access_type_all,
		special_type = "tank"
	}
	self.unit_categories.deathvox_blackdozer = {
		unit_types = {
			cop = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_blackdozer/ene_deathvox_blackdozer")
			},
			fbi = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_blackdozer/ene_deathvox_blackdozer")
			},
			gensec = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_blackdozer/ene_deathvox_blackdozer")
			},
			zeal = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_blackdozer/ene_deathvox_blackdozer")
			}					
		},
		unit_type_spawner = {
			cop = "units/pd2_mod_gageammo/characters/ene_deathvox_blackdozer/ene_deathvox_blackdozer",
			fbi = "units/pd2_mod_gageammo/characters/ene_deathvox_blackdozer/ene_deathvox_blackdozer",
			gensec = "units/pd2_mod_gageammo/characters/ene_deathvox_blackdozer/ene_deathvox_blackdozer",
			zeal = "units/pd2_mod_gageammo/characters/ene_deathvox_blackdozer/ene_deathvox_blackdozer"
		},
		access = access_type_all,
		special_type = "tank"
	}
	self.unit_categories.deathvox_lmgdozer = {
		unit_types = {
			cop = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_lmgdozer/ene_deathvox_lmgdozer")
			},
			fbi = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_lmgdozer/ene_deathvox_lmgdozer")
			},
			gensec = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_lmgdozer/ene_deathvox_lmgdozer")
			},
			zeal = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_lmgdozer/ene_deathvox_lmgdozer")
			}				
		},
		unit_type_spawner = {
			cop = "units/pd2_mod_gageammo/characters/ene_deathvox_lmgdozer/ene_deathvox_lmgdozer",
			fbi = "units/pd2_mod_gageammo/characters/ene_deathvox_lmgdozer/ene_deathvox_lmgdozer",
			gensec = "units/pd2_mod_gageammo/characters/ene_deathvox_lmgdozer/ene_deathvox_lmgdozer",
			zeal = "units/pd2_mod_gageammo/characters/ene_deathvox_lmgdozer/ene_deathvox_lmgdozer"
		},
		access = access_type_all,
		special_type = "tank"
	}
	self.unit_categories.deathvox_cloaker = {
		unit_types = {
			cop = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_cloaker/ene_deathvox_cloaker")
			},
			fbi = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_cloaker/ene_deathvox_cloaker")
			},
			gensec = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_cloaker/ene_deathvox_cloaker")
			},
			zeal = {
				Idstring("units/pd2_mod_gageammo/characters/ene_deathvox_cloaker/ene_deathvox_cloaker")
			}
		},
		unit_type_spawner = {
			cop = "units/pd2_mod_gageammo/characters/ene_deathvox_cloaker/ene_deathvox_cloaker",
			fbi = "units/pd2_mod_gageammo/characters/ene_deathvox_cloaker/ene_deathvox_cloaker",
			gensec = "units/pd2_mod_gageammo/characters/ene_deathvox_cloaker/ene_deathvox_cloaker",
			zeal = "units/pd2_mod_gageammo/characters/ene_deathvox_cloaker/ene_deathvox_cloaker"
		},
		access = access_type_all,
		special_type = "spooc"
	}
end


function GroupAITweakData:_init_enemy_spawn_groups(difficulty_index)
	old_spawn_group(self, difficulty_index)
	self._tactics = {
			deathvox_grenad_follow = {
				"shield_cover",
				"ranged_fire",
				"provide_coverfire",
				"provide_support",
				"deathguard",
				"flash_grenade",
				"smoke_grenade"
				},
			deathvox_grenad_lead = {
				"ranged_fire",
				"provide_coverfire",
				"deathguard",
				"flash_grenade",
				"smoke_grenade"
				},
			deathvox_grenad_pinch = {
				"ranged_fire",
				"provide_coverfire",
				"provide_support",
				"deathguard",
				"flash_grenade",
				"smoke_grenade"
				},
			deathvox_medic = {
				"shield_cover",
				"charge",
				"provide_coverfire",
				"provide_support"
				},
			deathvox_shield_lead = {
				"shield",
				"charge",
				"provide_coverfire",
				"provide_support"
				},
			deathvox_shield_support = {
				"shield",
				"provide_coverfire",
				"provide_support",
				"charge",
				"deathguard"
				},
			deathvox_spooc_lead = {
				"charge",
				"flash_grenade",
				"provide_coverfire",
				"smoke_grenade",
				"deathguard"
				},
			deathvox_spooc_pinch = {
				"flank",
				"smoke_grenade",
				"charge",
				"provide_coverfire",
				"provide_support",
				"deathguard",
				"flash_grenade"
				},
			deathvox_spooc_shield = {
				"shield_cover",
				"charge",
				"provide_coverfire",
				"provide_support",
				"smoke_grenade",
				"deathguard",
				"flash_grenade"
				},
			deathvox_swat_charge = {
				"charge",
				"provide_coverfire",
				"provide_support",
				"flash_grenade",
				"smoke_grenade"
				},
			deathvox_swat_flank = {
				"flank",
				"provide_coverfire",
				"provide_support"
				},	
			deathvox_swat_ranged = {
				"ranged_fire",
				"provide_coverfire",
				"provide_support",
				},
			deathvox_tank_cover = {
				"shield_cover",
				"provide_coverfire",
				"provide_support",
				"charge",
				"murder",
				"deathguard"
				},
			deathvox_tank_lead = {
				"charge",
				"provide_coverfire",
				"provide_support",
				"murder",
				"deathguard"
				},
			deathvox_tank_pinch = {
				"flank",
				"charge",
				"provide_coverfire",
				"provide_support",
				"deathguard",
				"murder"
				},
			deathvox_tazer_follow = {
				"shield_cover",
				"charge",
				"provide_coverfire",
				"provide_support",
				"deathguard"
				},
			deathvox_tazer_lead = {
				"flash_grenade",
				"smoke_grenade",
				"charge",
				"provide_coverfire",
				"provide_support"
				},
			deathvox_sniper = {
				"shield_cover",
				"ranged_fire",
				"provide_coverfire",
				"provide_support",
				"murder",
				"deathguard"
				},
			deathvox_supportflash = {
				"charge",
				"flash_grenade",
				"smoke_grenade",
				"provide_coverfire",
				"provide_support"
				},
			deathvox_supportsmoke = {
				"flank",
				"smoke_grenade",
				"flash_grenade",
				"provide_coverfire",
				"provide_support"
				},	
			swat_shotgun_rush = { --vanilla tactics begin here.
				"charge",
				"provide_coverfire",
				"provide_support",
				"deathguard",
				"flash_grenade"
				},
			swat_shotgun_flank = {
				"charge",
				"provide_coverfire",
				"provide_support",
				"flank",
				"deathguard"
				},
			swat_rifle = {
				"ranged_fire",
				"provide_coverfire",
				"provide_support"
				},
			swat_rifle_flank = {
				"ranged_fire",
				"provide_coverfire",
				"provide_support",
				"flank"
				},
			shield_wall_ranged = {
				"shield",
				"ranged_fire",
				"provide_support "
				},
			shield_support_ranged = {
				"shield_cover",
				"ranged_fire",
				"provide_coverfire"
				},
			shield_wall_charge = {
				"shield",
				"charge",
				"provide_support"
				},
			shield_support_charge = {
				"shield_cover",
				"charge",
				"provide_coverfire",
				"flash_grenade"
				},
			shield_wall = {
				"shield",
				"ranged_fire",
				"provide_support",
				"murder",
				"deathguard"
				},
			tazer_flanking = {
				"flank",
				"charge",
				"provide_coverfire",
				"smoke_grenade",
				"murder"
				},
			tazer_charge = {
				"charge",
				"provide_coverfire",
				"murder"
				},
			tank_rush = {
				"charge",
				"provide_coverfire",
				"murder"
				},
			spooc = {
				"charge",
				"shield_cover",
				"smoke_grenade"
				}
	}
	self.enemy_spawn_groups.gorgon = {
		amount = {3, 3},
		spawn = {
			{
				unit = "deathvox_taser",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_tazer_lead,
				rank = 3
			},
			{
				unit = "deathvox_taser",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_tazer_follow,
				rank = 2
			},
			{
				unit = "deathvox_medic",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_medic,
				rank = 1
			}
		}
	}

	self.enemy_spawn_groups.atlas = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_shield",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_shield_lead,
				rank = 3
			},
			{
				unit = "deathvox_lmgdozer",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_tank_cover,
				rank = 2
			},
			{
				unit = "deathvox_medic",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_medic,
				rank = 1
			}
		}
	}

	self.enemy_spawn_groups.chimera = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_taser",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_tazer_lead,
				rank = 4
			},
			{
				unit = "deathvox_blackdozer",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_tank_lead,
				rank = 3
			},
			{
				unit = "deathvox_medic",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_medic,
				rank = 2
			},
			{
				unit = "deathvox_cloaker",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_spooc_pinch,
				rank = 1
			}
		}
	}

	self.enemy_spawn_groups.zeus = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_greendozer",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_tank_lead,
				rank = 3
			},
			{
				unit = "deathvox_taser",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_tazer_follow,
				rank = 2
			},
			{
				unit = "deathvox_grenadier",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_grenad_follow,
				rank = 1
			}
		}
	}

	self.enemy_spawn_groups.janus = {
		amount = {2, 2},
		spawn = {
			{
				unit = "deathvox_blackdozer",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_tank_lead,
				rank = 2
			},
			{
				unit = "deathvox_medicdozer",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_medic,
				rank = 1
			}
		}
	}

	self.enemy_spawn_groups.epeius = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_shield",
				freq = 1,
				amount_min = 3,
				amount_max = 3,
				tactics = self._tactics.deathvox_shield_lead,
				rank = 2
			},
			{
				unit = "deathvox_lmgdozer",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_tank_cover,
				rank = 1
			}
		}
	}

	self.enemy_spawn_groups.damocles = {
		amount = {3, 3},
		spawn = {
			{
				unit = "deathvox_cloaker",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_spooc_lead,
				rank = 2
			},
			{
				unit = "deathvox_cloaker",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_spooc_pinch,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.caduceus = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_greendozer",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_tank_lead,
				rank = 3
			},
			{
				unit = "deathvox_medic",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_medic,
				rank = 2
			},
			{
				unit = "deathvox_medicdozer",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_medic,
				rank = 1
			}
		}
	}

	self.enemy_spawn_groups.atropos = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_grenadier",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_grenad_lead,
				rank = 3
			},
			{
				unit = "deathvox_cloaker",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_spooc_pinch,
				rank = 2
			},
			{
				unit = "deathvox_taser",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_tazer_follow,
				rank = 1
			}
		}
	}

	self.enemy_spawn_groups.aegeas = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_shield",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_shield_lead,
				rank = 2
			},				{
				unit = "deathvox_grenadier",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_grenad_follow,
				rank = 1
			}
		}
	}

	-- Death Vox Control Phase

	self.enemy_spawn_groups.recovery_unit = {
		amount = {4, 4},
		spawn = {
			{
				unit = "FBI_suit_stealth_MP5",
				freq = 1,
				amount_min = 3,
				amount_max = 3,
				tactics = self._tactics.deathvox_supportsmoke,
				rank = 2
			},
			{
				unit = "deathvox_medic",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_medic,
				rank = 1
			}
		}
	}

	self.enemy_spawn_groups.too_group = {
		amount = {4, 4},
		spawn = {
			{
				unit = "FBI_suit_M4_MP5",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_supportflash,
				rank = 2
			},
			{
				unit = "deathvox_taser",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_tazer_follow,
				rank = 1
			}
		}
	}

	self.enemy_spawn_groups.styx = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_cloaker",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_spooc_lead,
				rank = 1
			},
			{
				unit = "deathvox_cloaker",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_spooc_pinch,
				rank = 1
			}
		}
	}

	self.enemy_spawn_groups.hoplon = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_shield",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_shield_lead,
				rank = 2
			},
			{
				unit = "deathvox_grenadier",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_grenad_follow,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.recon = {
		amount = {4, 4},
		spawn = {
			{
				unit = "FBI_suit_M4_MP5",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_swat_ranged,
				rank = 2
			},
			{
				unit = "deathvox_lightar",
				freq = 1,
				amount_min = 3,
				amount_max = 3,
				tactics = self._tactics.deathvox_swat_ranged,
				rank = 1
			}
		}
	}

	-- Normal DV Spawngroups

	self.enemy_spawn_groups.dv_group_1 = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_heavyar",
				freq = 1,
				amount_min = 4,
				amount_max = 4,
				tactics = self._tactics.deathvox_swat_ranged,
				rank = 1
			}
		}
	}

	self.enemy_spawn_groups.dv_group_2_std = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_heavyshot",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_swat_charge,
				rank = 2
			},
			{
				unit = "deathvox_lightar",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_swat_charge,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.dv_group_2_med = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_heavyshot",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_swat_charge,
				rank = 3
			},
			{
				unit = "deathvox_lightar",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_swat_charge,
				rank = 2
			},
			{
				unit = "deathvox_medic",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_medic,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.dv_group_3_std = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_lightshot",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_swat_flank,
				rank = 2
			},
			{
				unit = "deathvox_lightar",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_swat_flank,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.dv_group_3_med = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_lightshot",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_swat_charge,
				rank = 3
			},
			{
				unit = "deathvox_lightar",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_swat_flank,
				rank = 2
			},
			{
				unit = "deathvox_medic",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_medic,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.dv_group_4_std = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_heavyshot",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_swat_charge,
				rank = 3
			},
			{
				unit = "deathvox_lightshot",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_swat_flank,
				rank = 2
			},
			{
				unit = "deathvox_lightar",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_swat_flank,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.dv_group_4_med = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_heavyshot",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_swat_charge,
				rank = 3
			},
			{
				unit = "deathvox_lightshot",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_swat_flank,
				rank = 2
			},
			{
				unit = "deathvox_medic",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_medic,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.dv_group_5_std = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_heavyar",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_swat_charge,
				rank = 2
			},
			{
				unit = "deathvox_lightar",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_swat_charge,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.dv_group_5_med = {
		amount = {4, 4},
		spawn = {
			{
				unit = "deathvox_heavyar",
				freq = 1,
				amount_min = 2,
				amount_max = 2,
				tactics = self._tactics.deathvox_swat_charge,
				rank = 3
			},
			{
				unit = "deathvox_lightar",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_swat_charge,
				rank = 2
			},
			{
				unit = "deathvox_medic",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.deathvox_medic,
				rank = 1
			}
		}
	}
end

function GroupAITweakData:_init_task_data(difficulty_index, difficulty)
	old_task_data(self, difficulty_index, difficulty)
	if difficulty_index == 8 then
		self.besiege.assault.force_balance_mul = {
			1,
			1,
			1,
			1
		}
		self.besiege.assault.force_pool_balance_mul = {
			1,
			1,
			1,
			1
		}
		self.besiege.recon.force_balance_mul = {
			1,
			1,
			1,
			1
		}
		self.besiege.recon.force = {
			20,
			20,
			20
		}
		self.besiege.recon.interval = {
			20,
			20,
			20
		}
		self.besiege.assault.force = {
			50,
			50,
			50
		}
		self.besiege.assault.force_pool = {
			500,
			500,
			500
		}
		self.besiege.regroup.duration = {
			30,
			30,
			30
		}
		self.besiege.assault.hostage_hesitation_delay = {
			30,
			30,
			30
		}
		self.besiege.assault.delay = {
			30,
			20,
			10
		}
		self.besiege.assault.sustain_duration_balance_mul = {
			1,
			1,
			1,
			1
		}
		
		self.besiege.assault.fade_duration = 15
		if Global.game_settings and Global.game_settings.single_player then
			self.besiege.assault.groups = {
				gorgon = { 0.05,0.05,0.05  },
				atlas = { 0.05,0.05,0.05  },
				chimera = { 0.05,0.05,0.05  },
				zeus = { 0.05,0.05,0.05  },
				janus = { 0.05,0.05,0.05 },
				epeius = { 0.05,0.05,0.05  },
				damocles = { 0.05,0.05,0.05  },
				caduceus = { 0.05,0.05,0.05  },
				atropos = { 0.05,0.05,0.05 },
				aegeas = { 0.05,0.05,0.05 },
				dv_group_1 = {0.1, 0.1, 0.1},
				dv_group_2_std = { 0.05,0.05,0.05  },
				dv_group_2_med = { 0.05,0.05,0.05  },
				dv_group_3_std = { 0.05,0.05,0.05  },
				dv_group_3_med = { 0.05,0.05,0.05  },
				dv_group_4_std = { 0.05,0.05,0.05  },
				dv_group_4_med = { 0.05,0.05,0.05  },
				dv_group_5_std = { 0.05,0.05,0.05  },
				dv_group_5_med = { 0.05,0.05,0.05  }
			}
		else
			self.besiege.assault.groups = {
				gorgon = { 0.05,0.05,0.05  },
				atlas = { 0.05,0.05,0.05  },
				chimera = { 0.05,0.05,0.05  },
				zeus = { 0.05,0.05,0.05  },
				janus = { 0.05,0.05,0.05 },
				epeius = { 0.05,0.05,0.05  },
				damocles = { 0.05,0.05,0.05  },
				caduceus = { 0.05,0.05,0.05  },
				atropos = { 0.05,0.05,0.05 },
				aegeas = { 0.05,0.05,0.05 },
				dv_group_1 = {0.1, 0.1, 0.1},
				dv_group_2_std = { 0.05,0.05,0.05  },
				dv_group_2_med = { 0.05,0.05,0.05  },
				dv_group_3_std = { 0.05,0.05,0.05  },
				dv_group_3_med = { 0.05,0.05,0.05  },
				dv_group_4_std = { 0.05,0.05,0.05  },
				dv_group_4_med = { 0.05,0.05,0.05  },
				dv_group_5_std = { 0.05,0.05,0.05  },
				dv_group_5_med = { 0.05,0.05,0.05  }
			}
		end
		self.besiege.reenforce.groups = {
			dv_group_1 = {0.2, 0.2, 0.2},
			dv_group_2_std = { 0.1,0.1,0.1 },
			dv_group_2_med = { 0.1,0.1,0.1 },
			dv_group_3_std = { 0.1,0.1,0.1 },
			dv_group_3_med = { 0.1,0.1,0.1 },
			dv_group_4_std = { 0.1,0.1,0.1 },
			dv_group_4_med = { 0.1,0.1,0.1 },
			dv_group_5_std = { 0.1,0.1,0.1 },
			dv_group_5_med = { 0.1,0.1,0.1 }
		}
		self.besiege.recon.groups = {
			recovery_unit = { 0.2,0.2,0.2 },
			too_group = { 0.2,0.2,0.2 },
			styx = { 0.2,0.2,0.2 },
			recon = { 0.2,0.2,0.2 },
			hoplon = { 0.2,0.2,0.2 }
		}
	end
end
