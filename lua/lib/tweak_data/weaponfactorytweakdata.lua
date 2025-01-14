local old_init = WeaponFactoryTweakData.init
function WeaponFactoryTweakData:init(...)
	old_init(self, ...)
    
	self.wpn_deathvox_grenadier = deep_clone(self.wpn_fps_gre_m32_npc)
	self.wpn_deathvox_grenadier.default_blueprint = {
		"wpn_fps_gre_m32_barrel",
		"wpn_fps_gre_m32_bolt",
		"wpn_fps_gre_m32_lower_reciever",
		"wpn_fps_gre_m32_mag",
		"wpn_fps_gre_m32_upper_reciever",
		"wpn_fps_upg_m4_s_standard_vanilla"
	}
	self.wpn_deathvox_grenadier.unit = "units/pd2_mod_gageammo/pew_pew_lasers/wpn_deathvox_grenadier"

end



-- Begin Total Crackdown Weapon Attachment materials
Hooks:PostHook( WeaponFactoryTweakData, "init", "totalcd_weaps", function(self)

	--used for adding or changing override tables for weapon attachments
	--example: stat_override("wpn_fps_sho_rota","wpn_fps_sho_rota_b_silencer",{stats = {suppression = -10,value=6}})
		--wpn: the internal name of the weapon, such as "wpn_fps_sho_rota". 
			--(not to be confused with the internal id such as "rota")
		--part: the internal name of the weapon attachment 
		--override_stats: the override for the weapon attachment parts
	local function part_stat_override(wpn,part,override_stats)
		if self[wpn] then 
			self[wpn].override = self[wpn].override or {}
			if layered_write and self[wpn].override[part] then 
				self[wpn].override[part] = override_stats
			end
		end
	end

	--BEGIN THE NEW INSANITY! (OR SOMETHING LIKE THAT!)
	if deathvox:IsTotalCrackdownEnabled() then

--Mod stats info:
--      damage - Damage increased/decreased by attachment. (Note. If weapon use stats_modifiers for damage this value will be multiplied by it)
--      spread - Accuracy increased/decreased by attachment. 1/ -1 value = 4 / -4 accuracy in-game.
--      recoil - Stability increased/decreased by attachment. 1/ -1 value = 4 / -4 accuracy in-game.
--      concealment - Concealment increased/decreased by attachment.
--      extra_ammo - Adds additional rounds added to weapon magazine. 1 value = 2 rounds in-game.
--      total_ammo_mod - Increased/decreased weapon ammo pool. Values varies depending on total ammo pool.
--      reload - Increased/decreased weapon reload timers. 1 / -1 value = 10% / -10% reload time.
--      value - from table. Inconsistently reported/documented. Copy from decompile.

--Weapon stats:
--      damage - Base damage of weapon. Max value should be no more than 180 (Damage can be increased further by using "stats_modifiers")
--      spread - Base accuracy of weapon. 1 value = 4 accuracy - Game calculate it using: Value*4-4 = accuracy in-game. Example - 17 value = 17*4-4=64 accuracy.
--      spread_moving - NOT USED BY GAME (But just in case use same value as for "spread")
--      recoil - Base stability of weapon 1 value = 4 stability - Game calculate it using: Value*4-4 = stability in-game. Example - 16 value = 16*4-4=60 stability.
--      zoom - Base zoom value used when aiming down sights.
--      concealment - Base concealment of weapon.
--      suppression - Base suppression value.
	--Threat value = suppression * 2
--      value - from table. Inconsistently reported/documented. Copy from decompile.

--Template entry material:
--Weapon
	--ID: [whatever]
	--Value: 
	--Magazine: 20
	--Ammo: 300
	--Fire Rate: 545
	--Damage:50
	--Acc: 100
	--Stab: 100
	--Conc: 30
	--Threat: 10
	--Pickup: 9, 18
	--Notes: many shared mods
--Mod
	--Mod name
	--WeaponFactory ID: [whatever]
	--Value: 
	--Magazine: 
	--Conc: 
	--+100% Reload speed
	--Notes: 
			
			
	--------------------------------------
	--Primary Weapons--
	--------------------------------------	
	--------------------------------------
		--Assault Rifles--
	--------------------------------------	
	--------------------------------------
			--Light ARs--
	--------------------------------------		
			
	--------------------------------------
				--AMCAR--
	--------------------------------------
	--ID: self.amcar
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 20
	--Ammo: 300
	--Fire Rate: 545
	--Damage: 50
	--Acc: 100
	--Stab: 100
	--Conc: 30
	--Threat: 10
	--Pickup: 9, 18
	--Notes: Being the "training wheels" gun and having notably lower DPS than every other AR, 
	--it received additional buffs in multiple areas to make it a viable comfort pick. 
	--Active Mods:
			
	--Speed pull Mag [wpn_fps_m4_upg_m_quick] [+100% Reload Speed, +10 Magazine -4 Concealment] Value: 2

	-- L5 Magazine [wpn_fps_upg_m4_m_l5]  [+10 Magazine, -2 Concealment]Value: 1
		self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_l5 = { -- gotta be like this or else the game shits the bed
			stats = {	
				value = 1,
				extra_ammo = 10, 
				concealment = -2
			}
		}			
	-- Milspec Mag [wpn_fps_m4_uupg_m_std] [+10 Magazine, -2 Concealment] Value: 1
		self.wpn_fps_ass_amcar.override.wpn_fps_m4_uupg_m_std = {	
			stats = {
				value = 1,
				extra_ammo = 10, 
				concealment = -2
			}
		}
	-- Tactical Mag	[wpn_fps_upg_m4_m_pmag] [+10 Magazine, -2 Concealment] Value: 3
		self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_pmag = {	
			stats = {
				value = 3,
				extra_ammo = 10, 
				concealment = -2
			}
		}
	-- Expert Mag [wpn_fps_ass_l85a2_m_emag] [+10 Magazine, -2 Concealment] [Value: 1]	
		self.wpn_fps_ass_amcar.override.wpn_fps_ass_l85a2_m_emag = {
			stats = {
				value = 1,
				extra_ammo = 10, 
				concealment = -2
			}
		}
	--CAR Quadstacked Mag [wpn_fps_upg_m4_m_quad] [+40 Magazine, -10 Concealment] [Value: 3]
		self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_quad = {
			stats = {
				value = 3,
				extra_ammo = 40, 
				concealment = -10	
			}	
		}
	--------------------------------------
				--Bootleg--
	--------------------------------------
	--ID: self.tecci
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 100
	--Ammo: 400
	--Fire Rate: 667
	--Damage: 50
	--Acc: 52
	--Stab: 92
	--Conc: 10
	--Threat: 22
	--Pickup: 8, 16
	--Notes:
	--Active Mods:

	--------------------------------------
				--JP36--
	--------------------------------------
	--ID: self.g36
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 300
	--Fire Rate: 706
	--Damage: 50
	--Acc: 84
	--Stab: 100
	--Conc: 25
	--Threat: 10
	--Pickup: 9, 18
	--Notes:
	--Active Mods: Speedpull Mag [wpn_fps_ass_g36_m_quick] [+100% Reload Speed, -5 Concealment] Value: 2
	self.parts.wpn_fps_ass_g36_m_quick.stats = {	
		value = 2,		
		reload = 10,
		concealment = -5
	}
	self.parts.wpn_fps_ass_g36_m_quick.supported = true

	--------------------------------------
				--Commando 553--
	--------------------------------------
	--ID: self.s552
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 300
	--Fire Rate: 714
	--Damage: 50
	--Acc: 60
	--Stab: 100
	--Conc: 30
	--Threat: 10
	--Pickup: 8, 16
	--Notes:
	--Active Mods:

	--------------------------------------
				--Clarion--
	--------------------------------------
	--ID: self.famas
	--Class: Rapid Fire
	--Value: 4
	--Magazine: 30
	--Ammo: 300
	--Fire Rate: 1000
	--Damage: 50
	--Acc: 72
	--Stab: 80
	--Conc: 25
	--Threat: 10
	--Pickup: 8, 16
	--Notes:
	--Active Mods: Suppressed Barrel [wpn_fps_ass_famas_b_suppressed] [Suppresses Weapon, + Quiet, -100 Threat] Value: 4
	self.parts.wpn_fps_ass_famas_b_suppressed.stats = {suppression = 72, alert_size = 12, value = 6}
	self.parts.wpn_fps_ass_famas_b_suppressed.subclass_modifiers = {
		"subclass_quiet"
	}
	--------------------------------------
			--Medium ARs--
	--------------------------------------
	--------------------------------------
				--Valkyria--
	--------------------------------------
	--ID: self.asval
	--Class: Rapid Fire, Quiet
	--Value: 1
	--Magazine: 20
	--Ammo: 180
	--Fire Rate: 545 (Old: 896)
	--Damage: 80
	--Acc: 92
	--Stab: 100
	--Conc: 20
	--Threat: 0
	--Pickup: 7, 12
	--Notes: Moved to a slower-firing, harder-hitting category upon community request.
	--NOTE: Suppressed.
	--Active Mods: 

	self.parts.wpn_fps_ass_asval_b_standard.stats = nil --why overkill -- probably to avoid a suppression overwrite? -Finale
	self.parts.wpn_fps_ass_asval_b_standard.supported = true
	
	--Prototype Barrel [self.parts.wpn_fps_ass_asval_b_prot] [+10 Concealment, -12 Accuracy, -20 Concealment] Value: 1
	self.parts.wpn_fps_ass_asval_b_proto.stats = {
		value = 1,
		spread = -3, 
		recoil = -5,
		alert_size = 12,
		concealment = 10
	}
	self.parts.wpn_fps_ass_asval_b_proto.supported = true
	
	-- Solid Stock
	self.parts.wpn_fps_ass_asval_s_solid.stats = {value = 1}
	self.parts.wpn_fps_ass_asval_s_solid.supported = true

	--------------------------------------
				--CAR-4--
	--------------------------------------
	--ID: self.new_m4
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 210
	--Fire Rate: 600
	--Damage: 80
	--Acc: 100
	--Stab: 100
	--Conc: 15
	--Threat: 14
	--Pickup: 6, 10
	--Notes: 
	--Active Mods: 
	--DMR Kit [wpn_fps_upg_ass_m4_b_beowulf] [- Rapid Fire, + Precision, +Armor Piercing, -135 Ammo Stock,
	--+80 Damage, -40 Stability, -5 Concealment, -3, 6 Pickup] Value: 1

	--Vintage Mag [wpn_fps_upg_m4_m_straight] [-10 Magazine, +5 Concealment] Value: 2
			
	--CAR Quadstacked Mag [wpn_fps_upg_m4_m_quad] [+30 Magazine, -10 Concealment] Value: 3

	--Speedpull Mag [wpn_fps_m4_upg_m_quick] [+100% Reload Speed, -4 Concealment] Value: 2

		-- Aftermarket Special Handguard	
		self.parts.wpn_fps_m4_uupg_fg_lr300.stats = {value = 5}
		self.parts.wpn_fps_m4_uupg_fg_lr300.supported = true
		-- Competition Foregrip		
		self.parts.wpn_fps_upg_fg_jp.stats = {value = 5}
		self.parts.wpn_fps_upg_fg_jp.supported = true
		-- Gazelle Rail
		self.parts.wpn_fps_upg_fg_smr.stats = {value = 5}
		self.parts.wpn_fps_upg_fg_smr.supported = true
		-- OVAL Foregrip		
		self.parts.wpn_fps_upg_ass_m4_fg_lvoa.stats = {value = 1}
		self.parts.wpn_fps_upg_ass_m4_fg_lvoa.supported = true
		-- E.M.O. Foregrip		
		self.parts.wpn_fps_upg_ass_m4_fg_moe.stats = {value = 1}
		self.parts.wpn_fps_upg_ass_m4_fg_moe.supported = true
		-- Long Barrel
		self.parts.wpn_fps_m4_uupg_b_long.stats = {value = 4}
		self.parts.wpn_fps_m4_uupg_b_long.supported = true
		-- Short Barrel		
		self.parts.wpn_fps_m4_uupg_b_short.stats = {value = 5}
		self.parts.wpn_fps_m4_uupg_b_short.supported = true

	--Stealth Barrel [wpn_fps_m4_uupg_b_sd] [Suppresses Weapon, + Quiet, -12 Accuracy, +3 Concealment, -100 Threat] Value: 6		
		self.parts.wpn_fps_m4_uupg_b_sd.stats = {
			value = 6,
			spread = -3,
			concealment = 3,
			suppression = -72,
			alert_size = 12
		}
		self.parts.wpn_fps_m4_uupg_b_sd.subclass_modifiers = {
			"subclass_quiet"
		}
		self.parts.wpn_fps_m4_uupg_b_sd.supported = true
	--------------------------------------
				--CAR-4 (DMR Kit)--
	--------------------------------------
	--Note: Conversion kit entries are not actual weapons and are only listed for referential purposes.
	--INCOMPLETE - see active mod description under CAR-4 instead.

		self.parts.wpn_fps_upg_ass_m4_b_beowulf.stats = {
			value = 1,
			total_ammo_mod = -13, -- the way this stat works...curse overkill and this weird stat
			damage = 80,
			recoil = -10,
			concealment = -5
		}
		self.parts.wpn_fps_upg_ass_m4_b_beowulf.class_modifier = "class_precision"
		self.parts.wpn_fps_upg_ass_m4_b_beowulf.supported = true
		self.parts.wpn_fps_upg_ass_m4_b_beowulf.adds = {"car_dmr_kit_ammo_type"}
		self.parts.car_dmr_kit_ammo_type = { --Dummy ammo type for DMR kit, needed for armor piercing and pickup multipliers to work properly.
			a_obj = "a_m",
			type = "ammo",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			stats = {
				value = 1
			},
			custom_stats = {
				armor_piercing_add = 1,
				ammo_pickup_max_mul = 4,
				ammo_pickup_min_mul = 2.5
			}
		}
		self.parts.car_dmr_kit_ammo_type.supported = true

	--------------------------------------
				--AK--
	--------------------------------------
	--ID: self.ak74
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 210
	--Fire Rate: 652
	--Damage: 80
	--Acc: 92
	--Stab: 100
	--Conc: 15
	--Threat: 14
	--Pickup: 6, 10
	--Notes: 
	--Active Mods: DMR Kit, AK Quadstacked Mag, Speedpull Mag
	--DMR Kit [wpn_fps_upg_ass_ak_b_zastava] [- Rapid Fire, + Precision, +Armor Piercing, -135 Ammo Stock,]
		--[+80 Damage, +8 Accuracy, -44 Stability, -5 Concealment, -3, 6 Pickup] Value: 1
			
	--AK Quadstacked Mag [wpn_fps_upg_ak_m_quad] [+30 Magazine, -10 Concealment] Value: 3
			
	--Speedpull Mag [wpn_fps_upg_ak_m_quick] [+100% Reload Speed, -4 Concealment] Value: 2

	--------------------------------------
				--AK (DMR Kit)--
	--------------------------------------
	
	self.parts.wpn_fps_upg_ass_ak_b_zastava.class_modifier = "class_precision"
	--Note: Conversion kit entries are not actual weapons and are only listed for referential purposes.
	--INCOMPLETE - consult mod information for AK instead.

	--------------------------------------
				--AK17--
	--------------------------------------
	--ID: self.flint
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 210
	--Fire Rate: 652
	--Damage: 80
	--Acc: 92
	--Stab: 100
	--Conc: 10
	--Threat: 14
	--Pickup: 6, 10
	--Notes: Was previously a Heavy AR.
	--Active Mods:
	--AK Quadstacked Mag [wpn_fps_upg_ak_m_quad] [+30 Magazine, -10 Concealment] Value: 3
			
	--Speedpull Mag [wpn_fps_upg_ak_m_quick] [+100% Reload Speed, -4 Concealment] Value: 2

	--------------------------------------
				--AK5--
	--------------------------------------
	--ID: self.ak5
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 210
	--Fire Rate: 706
	--Damage: 80
	--Acc: 92
	--Stab: 100
	--Conc: 15
	--Threat: 14
	--Pickup: 6, 10
	--Notes:
	--Active Mods: 
	--Vintage Mag [wpn_fps_upg_m4_m_straight] [-10 Magazine, +5 Concealment] Value: 2	

	--CAR Quadstacked Mag [wpn_fps_upg_m4_m_quad][+30 Magazine, -10 Concealment] Value: 3

	--Speedpull Mag [wpn_fps_m4_upg_m_quick] [+100% Reload Speed, -4 Concealment] Value: 2 


	--------------------------------------
				--Queen's Wrath--
	--------------------------------------
	--ID: self.l85a2
	--Class: Rapid Fire
	--Value: 9
	--Magazine: 30
	--Ammo: 210
	--Fire Rate: 723
	--Damage: 80
	--Acc: 84
	--Stab: 100
	--Conc: 15
	--Threat: 14
	--Pickup: 6, 10
	--Notes:
	--Active Mods: Vintage Mag [wpn_fps_upg_m4_m_straight] [-10 Magazine, +5 Concealment] Value: 2
			
	--CAR Quadstacked Mag [wpn_fps_upg_m4_m_quad] [+30 Magazine, -10 Concealment] Value: 3
			
	--Speedpull Mag [wpn_fps_m4_upg_m_quick] [+100% Reload Speed, -4 Concealment] Value: 2

	--------------------------------------
				--UAR--
	--------------------------------------
	--ID: self.aug
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 210
	--Fire Rate: 750
	--Damage: 80
	--Acc: 80
	--Stab: 100
	--Conc: 15
	--Threat: 14
	--Pickup: 6, 10
	--Notes:
	--Active Mods: 	
	--Speedpull Mag [wpn_fps_ass_aug_m_quick] [+100% Reload Speed, -4 Concealment] Value: 2

	--------------------------------------
				--Tempest-21--
	--------------------------------------
	--ID: self.komodo
	--Class: Rapid Fire
	--Value: 9
	--Magazine: 30
	--Ammo: 210
	--Fire Rate: 800
	--Damage: 80
	--Acc: 84
	--Stab: 100
	--Conc: 20
	--Threat: 14
	--Pickup: 6, 10
	--Notes:
	--Active Mods: Vintage Mag [wpn_fps_upg_m4_m_straight] [-10 Magazine, +5 Concealment] Value: 2
			
	--CAR Quadstacked Mag [wpn_fps_upg_m4_m_quad] [+30 Magazine, -10 Concealment] Value: 3
			
	--Speedpull Mag [wpn_fps_m4_upg_m_quick] [+100% Reload Speed, -4 Concealment] Value: 2

	--------------------------------------
				--Gecko 7.62--
	--------------------------------------
	--ID: self.galil
	--Class: Rapid Fire
	--Value: 4
	--Magazine: 30
	--Ammo: 210
	--Fire Rate: 845
	--Damage: 80
	--Acc: 100
	--Stab: 76
	--Conc: 15
	--Threat: 14
	--Pickup: 6, 10
	--Notes:
	--Active Mods:

	--------------------------------------
				--Lion's Roar--
	--------------------------------------
	--BEST GUN
	--That's debatable - Finale
	--ID: self.vhs
	--Class: Rapid Fire
	--Value: 9
	--Magazine: 30
	--Ammo: 210
	--Fire Rate: 857
	--Damage: 80
	--Acc: 72
	--Stab: 100
	--Conc: 15
	--Threat: 14
	--Pickup: 6, 10
	--Notes:
	--Active Mods: Silenced Barrel [wpn_fps_ass_vhs_b_silenced] [Suppresses Weapon, + Quiet, -100 Threat] Value: 2
	self.parts.wpn_fps_ass_vhs_b_silenced.stats = {suppression = 72, alert_size = 12, value = 6}	self.parts.wpn_fps_ass_vhs_b_silenced.subclass_modifiers = {
		"subclass_quiet"
	}
	--------------------------------------
				--Union 5.56--
	--------------------------------------
	--ID: self.corgi
	--Class: Rapid Fire
	--Value: 9
	--Magazine: 30
	--Ammo: 210
	--Fire Rate: 857
	--Damage: 80
	--Acc: 72
	--Stab: 100
	--Conc: 15
	--Threat: 14
	--Pickup: 6, 10
	--Notes:
	--Active Mods: Vintage Mag [wpn_fps_upg_m4_m_straight] [-10 Magazine, +5 Concealment] Value: 2
			
	--CAR Quadstacked Mag [wpn_fps_upg_m4_m_quad] [+30 Magazine, -10 Concealment] Value: 3
			
	--Speedpull Mag [wpn_fps_m4_upg_m_quick] [+100% Reload Speed, -4 Concealment] Value: 2

	--------------------------------------
			--Heavy ARs--
	--------------------------------------
	--------------------------------------
				--AK.762--
	--------------------------------------
	--ID: self.akm
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 150
	--Fire Rate: 561
	--Damage: 110
	--Acc: 92
	--Stab: 100
	--Conc: 10
	--Threat: 20
	--Pickup: 4, 6
	--Notes:
	--Active Mods: AK Quadstacked Mag [wpn_fps_upg_ak_m_quad] [+30 Magazine, -10 Concealment] Value: 3
			
	--Speed Pull Mag [wpn_fps_upg_ak_m_quick] [+100% Reload Speed, -4 Concealment] Value: 2
			
	--DMR Kit [wpn_fps_upg_ass_ak_b_zastava] [-Rapid Fire, -Precision, +Armor Piercing, -75 Ammo Stock, -50 Damage, +8 Accuracy,]
	-- [-20 Stability, +2 Threat, -1, -2 Pickup] Value: 1
	-- NOTE This DMR Kit manually calculated from diff values. may require further scrutiny.

	--------------------------------------
				--AK.762 (DMR Kit)--
	--------------------------------------
	--Note: Conversion kit entries are not actual weapons and are only listed for referential purposes.
	--INCOMPLETE -consult AK.762 mods
	--------------------------------------
				--AK.762 Golden--
	--------------------------------------
	--ID: self.akm_gold
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 150
	--Fire Rate: 561
	--Damage: 110
	--Acc: 92
	--Stab: 100
	--Conc: 10
	--Threat: 20
	--Pickup: 4, 6
	--Notes:
	--Active Mods: 
	--Active Mods: AK Quadstacked Mag  [wpn_fps_upg_ak_m_quad] [+30 Magazine, -10 Concealment] Value: 3
			
	--Speed Pull Mag [wpn_fps_upg_ak_m_quick] [+100% Reload Speed, -4 Concealment] Value: 2
			
	--DMR Kit [wpn_fps_upg_ass_ak_b_zastava] [-Rapid Fire, -Precision, +Armor Piercing, -75 Ammo Stock, -50 Damage, +8 Accuracy,
	-- -20 Stability, +2 Threat, -1, -2 Pickup] Value: 1
	-- NOTE This DMR Kit manually calculated from diff values. may require further scrutiny.
	
	--------------------------------------
				--Eagle Heavy--
	--------------------------------------
	--ID: self.scar
	--Class: Rapid Fire
	--Value: 9
	--Magazine: 20
	--Ammo: 140
	--Fire Rate: 612
	--Damage: 110
	--Acc: 100
	--Stab: 84
	--Conc: 10
	--Threat: 20
	--Pickup: 4, 6
	--Notes:
	--Active Mods: 

	--------------------------------------
				--Gewehr 3--
	--------------------------------------
	--ID: self.g3
	--Class: Rapid Fire
	--Value: 4
	--Magazine: 20
	--Ammo: 140
	--Fire Rate: 652
	--Damage: 110
	--Acc: 100
	--Stab: 84
	--Conc: 10
	--Threat: 20
	--Pickup: 4, 6
	--Notes:
	--Active Mods: 
	--Assault Kit [wpn_fps_ass_g3_b_short] [+85 Ammo Stock, -30 Damage, -16 Accuracy, +16 Stability, +5 Concealment, +2, +4 Pickup] Value: 2
	--DMR Kit [wpn_fps_ass_g3_b_sniper] [- Rapid Fire, + Precision, + Armor Piercing, -10 Magazine, -65 Ammo Stock, +50 Damage, -1, -2 Pickup] Value: 2
	--------------------------------------
				--Gewehr 3 (DMR Kit)--
	--------------------------------------
	self.parts.wpn_fps_ass_g3_b_sniper.class_modifier = "class_precision"
	--Note: Conversion kit entries are not actual weapons and are only listed for referential purposes.
	--INCOMPLETE --See main Gewehr mod entries for information.
	--------------------------------------
				--Gewehr 3 (assault kit)--
	--------------------------------------
	--Note: Conversion kit entries are not actual weapons and are only listed for referential purposes.
	--INCOMPLETE --See main Gewehr mod entries for information.
	--------------------------------------
				--Falcon--
	--------------------------------------	
	--ID: self.fal
	--Class: Rapid Fire
	--Value: 4
	--Magazine: 20
	--Ammo: 140
	--Fire Rate: 698
	--Damage: 110
	--Acc: 100
	--Stab: 86
	--Conc: 10
	--Threat: 20
	--Pickup: 4, 6
	--Notes:
	--Active Mods: Extended Magazine [wpn_fps_ass_fal_m_01] [+20 Magazine, -10 Concealment] Value: 2

	--------------------------------------
				--AMR-16--
	--------------------------------------
	--ID: self.m16
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 20
	--Ammo: 140
	--Fire Rate: 857
	--Damage: 110
	--Acc: 96
	--Stab: 100
	--Conc: 10
	--Threat: 20
	--Pickup: 4, 6
	--Notes:
	--Active Mods: 
	--DMR Kit [wpn_fps_upg_ass_m4_b_beowulf] [- Rapid Fire, + Precision, + Armor Piercing, -65 Ammo Stock,
	-- +50 Damage, +4 Accuracy, -40 Stability, -1, -2 Pickup] Value: 1

	--Speedpull Mag [wpn_fps_m4_upg_m_quick] [+100% Reload Speed, +10 Magazine, -4 Concealment] Value: 2

	-- Long Ergo Foregrip
		self.parts.wpn_fps_upg_ass_m16_fg_stag.stats = {value = 1}
		self.parts.wpn_fps_upg_ass_m16_fg_stag.supported = true
	-- Blast From the Past Handguard
		self.parts.wpn_fps_m16_fg_vietnam.stats = {value = 10}
		self.parts.wpn_fps_m16_fg_vietnam.supported = true
	-- Tactical Handguard
		self.parts.wpn_fps_m16_fg_railed.stats = {value = 7}
		self.parts.wpn_fps_m16_fg_railed.supported = true
			
	-- L5 Magazine [wpn_fps_upg_m4_m_l5] [+10 Magazine, -2 Concealment] Value: 1
		self.wpn_fps_ass_m16.override.wpn_fps_upg_m4_m_l5 = {
			stats = {
				value = 1,			 
				extra_ammo = 10, 
				concealment = -2
			}
		}
	--Milspec Mag [wpn_fps_m4_uupg_m_std] [+10 Magazine, -2 Concealment] Value: 1
		self.wpn_fps_ass_m16.override.wpn_fps_m4_uupg_m_std = {	
			stats = {
				value = 1,
				extra_ammo = 10, 
				concealment = -2
			}
		}
	--Tactical Mag [wpn_fps_upg_m4_m_pmag] [+10 Magazine, -2 Concealment] Value: 3
		self.wpn_fps_ass_m16.override.wpn_fps_upg_m4_m_pmag = {	
		stats = {
				value = 3,
				extra_ammo = 10, 
				concealment = -2
			}
		}
	--Expert Mag [wpn_fps_ass_l85a2_m_emag] [+10 Magazine, -2 Concealment] Value: 1
		self.wpn_fps_ass_m16.override.wpn_fps_ass_l85a2_m_emag = {	
			stats = {
				value = 1,
				extra_ammo = 10, 
				concealment = -2
			}
		}
	-- CAR Quadstacked Mag [wpn_fps_upg_m4_m_quad] [+40 Magazine, -10 Concealment] Value: 3
		self.wpn_fps_ass_m16.override.wpn_fps_upg_m4_m_quad = {	
			stats = {
				value = 3,
				extra_ammo = 40, 
				concealment = -10
			}		
		}
	--------------------------------------
				--AMR-16 (DMR Kit)--
	--------------------------------------
	--Note: Conversion kit entries are not actual weapons and are only listed for referential purposes.
	--INCOMPLETE see AMR-16 entry mod information for details.
	--------------------------------------
		--Akimbo Machine Pistols--
	--------------------------------------
	--------------------------------------
				--Akimbo Igor Automatik Pistols--
	--------------------------------------
	--ID: self.x_stech
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 40
	--Ammo: 400
	--Fire Rate: 750
	--Damage: 60
	--Acc: 80
	--Stab: 44
	--Conc: 32
	--Threat: 8
	--Pickup: 7, 11
	--Notes:
	--Active Mods: Extended Mag. [wpn_fps_pis_stech_m_extended] [+28 Magazine, -4 Concealment] Value: 5
	--NOTE not in mws wiki. Leave this note.
			
	--------------------------------------
				--Akimbo STRYK 18c--
	--------------------------------------
	--ID: self.x_g18c
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 40
	--Ammo: 560
	--Fire Rate: 909
	--Damage: 40
	--Acc: 68
	--Stab: 88
	--Conc: 32
	--Threat: 8
	--Pickup: 9, 18
	--Notes:
	--Active Mods: Extended Mag. [wpn_fps_pis_g18c_m_mag_33rnd] [+24 Magazine, -4 Concealment] Value: 6

	--------------------------------------
				--Akimbo Czech 92 Pistols--
	--------------------------------------
	--ID: self.x_czech
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 600
	--Fire Rate: 1000
	--Damage: 40
	--Acc: 80
	--Stab: 80
	--Conc: 32
	--Threat: 8
	--Pickup: 9, 18
	--Notes:
	--Active Mods: Extended Magazine [wpn_fps_pis_czech_m_extended] [+20 Magazine, -4 Concealment] Value: 1
	--NOTE not in mws wiki. Leave this note.

	--------------------------------------
				--Akimbo Bernetti Auto Pistols--
	--------------------------------------
	--ID: self.x_beer
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 600
	--Fire Rate: 1101
	--Damage: 40
	--Acc: 84
	--Stab: 80
	--Conc: 32
	--Threat: 8
	--Pickup: 9, 18
	--Notes:
	--Active Mods: Extended Magazine [wpn_fps_pis_beer_m_extended] [+12 Magazine, -2 Concealment] Value: 3
	--NOTE not in mws wiki. Leave this note.

	--------------------------------------
		--Akimbo SMGs--
	--------------------------------------
	--------------------------------------
			--Akimbo Light SMGs--
	--------------------------------------
	--------------------------------------
				--Akimbo Tatonka--
	--------------------------------------
	--ID: self.x_coal
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 128
	--Ammo: 320
	--Fire Rate: 652
	--Damage: 50
	--Acc: 80
	--Stab: 84
	--Conc: 25
	--Threat: 10
	--Pickup: 8, 16
	--Notes: Formerly a Heavy SMG.
	--Active Mods: 

	--------------------------------------
				--Akimbo Uzi--
	--------------------------------------
	--ID: self.x_uzi
	--Class: Rapid Fire
	--Value: 7
	--Magazine: 64
	--Ammo: 320
	--Fire Rate: 698
	--Damage: 50
	--Acc: 80
	--Stab: 84
	--Conc: 25
	--Threat: 10
	--Pickup: 8, 16
	--Notes: 
	--Active Mods: 

	--------------------------------------
				--Akimbo Signature SMG--
	--------------------------------------
	--ID: self.x_shepheard
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 40
	--Ammo: 320
	--Fire Rate: 750
	--Damage: 50
	--Acc: 60
	--Stab: 100
	--Conc: 25
	--Threat: 10
	--Pickup: 8, 16
	--Notes: 
	--Active Mods: Extended Magazine [wpn_fps_smg_shepheard_mag_extended] [+20 Magazine, -5 Concealment] Value: 1

	--------------------------------------
				--Akimbo Compact-5--
	--------------------------------------
	--ID: self.x_mp5
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 60
	--Ammo: 320
	--Fire Rate: 750
	--Damage: 50
	--Acc: 72
	--Stab: 100
	--Conc: 25
	--Threat: 10
	--Pickup: 8, 16
	--Notes: 
	--Active Mods: 

	--------------------------------------
				--Akimbo Blaster 9mm--
	--------------------------------------
	--ID: self.x_tec9
	--Class: Rapid Fire
	--Value: 7
	--Magazine: 40
	--Ammo: 320
	--Fire Rate: 896
	--Damage: 50
	--Acc: 52
	--Stab: 100
	--Conc: 30
	--Threat: 10
	--Pickup: 8, 16
	--Notes: 
	--Active Mods: Extended Mag [wpn_fps_smg_tec9_m_extended] [+24 Magazine, -10 Concealment] Value: 4

	--------------------------------------
				--Akimbo CMP--
	--------------------------------------
	--ID: self.x_mp9
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 320
	--Fire Rate: 952
	--Damage: 50
	--Acc: 52
	--Stab: 100
	--Conc: 30
	--Threat: 10
	--Pickup: 8, 16
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_smg_mp9_m_extended] [+30 Magazine, -5 Concealment] Value: 4
	
	--Tactical Suppressor [wpn_fps_smg_mp9_b_suppressed] [Suppresses Weapon, +Quiet, -100 Threat] Value: 4

	--------------------------------------
				--Akimbo Cobra--
	--------------------------------------
	--ID: self.x_scorpion
	--Class: Rapid Fire
	--Value: 7
	--Magazine: 40
	--Ammo: 320
	--Fire Rate: 1000
	--Damage: 50
	--Acc: 52
	--Stab: 100
	--Conc: 30
	--Threat: 10
	--Pickup: 8, 16
	--Notes: 
	--Active Mods: Extended Mag [wpn_fps_smg_scorpion_m_extended] [+40 Magazine, -10 Concealment] Value: 1

	--------------------------------------
				--Akimbo Micro Uzi--
	--------------------------------------
	--ID: self.x_baka
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 64
	--Ammo: 320
	--Fire Rate: 1200
	--Damage: 50
	--Acc: 44
	--Stab: 100
	--Conc: 25
	--Threat: 10
	--Pickup: 8, 16
	--Notes: 
	--Active Mods: 
	--Futomaki Suppressor [wpn_fps_smg_baka_b_longsupp] [Suppresses Weapon, +Quiet, -100 Threat] Value: 1

	--Maki Suppressor [wpn_fps_smg_baka_b_midsupp] [Suppresses Weapon, +Quiet, -100 Threat] Value: 1

	--Spring Suppressor [wpn_fps_smg_baka_b_smallsupp] [Suppresses Weapon, +Quiet, -100 Threat] Value: 1

	
	--------------------------------------
			--Akimbo Medium SMGs--
	--------------------------------------
	--------------------------------------
				--Akimbo Para--
	--------------------------------------
	--ID: self.x_olympic
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 40
	--Ammo: 240
	--Fire Rate: 682
	--Damage: 70
	--Acc: 92
	--Stab: 100
	--Conc: 25
	--Threat: 13
	--Pickup: 6, 10
	--Notes: 
	--Active Mods: Milspec Mag [wpn_fps_m4_uupg_m_std] [+20 Magazine, -10 Concealment] Value: 1

	--Tactical Mag [wpn_fps_upg_m4_m_pmag] [+20 Magazine, -10 Concealment] Value: 3

	--Expert Mag [wpn_fps_ass_l85a2_m_emag] [+20 Magazine, -10 Concealment] Value: 1

	--L5 Magazine [wpn_fps_upg_m4_m_l5] [+20 Magazine, -10 Concealment] Value: 1

	--CAR Quadstacked Mag [wpn_fps_upg_m4_m_quad] [+80 Magazine, -20 Concealment] Value: 3

	--Speedpull Mag [wpn_fps_m4_upg_m_quick] [+100% Reload Speed, +20 Magazine, -8 Concealment] Value: 2

	--------------------------------------
				--Akimbo Chicago Typewriter--
	--------------------------------------
	--ID: self.x_m1928
	--Class: Rapid Fire
	--Value: 9
	--Magazine: 100
	--Ammo: 240
	--Fire Rate: 723
	--Damage: 70
	--Acc: 84
	--Stab: 100
	--Conc: 15
	--Threat: 20
	--Pickup: 6, 10
	--Notes: 
	--Active Mods: 

	--------------------------------------
				--Akimbo Heather--
	--------------------------------------
	--ID: self.x_sr2
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 60
	--Ammo: 240
	--Fire Rate: 750
	--Damage: 70
	--Acc: 84
	--Stab: 100
	--Conc: 25
	--Threat: 13
	--Pickup: 6, 10
	--Notes: 
	--Active Mods: Speed Pull Mag [wpn_fps_smg_sr2_m_quick] [+100% Reload Speed, -8 Concealment] Value: 2

	--------------------------------------
				--Akimbo Kobus 90--
	--------------------------------------
	--ID: self.x_p90
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 100
	--Ammo: 240
	--Fire Rate: 909
	--Damage: 70
	--Acc: 80
	--Stab: 100
	--Conc: 20
	--Threat: 13
	--Pickup: 6, 10
	--Notes: 
	--Active Mods: Speed Pull Mag [wpn_fps_smg_p90_m_strap] [+100% Reload Speed, -8 Concealment] Value: 2

	--------------------------------------
				--Akimbo SpecOps--
	--------------------------------------
	--ID: self.x_mp7
	--Class: Rapid Fire
	--Value: 7
	--Magazine: 40
	--Ammo: 240
	--Fire Rate: 952
	--Damage: 70
	--Acc: 84
	--Stab: 100
	--Conc: 25
	--Threat: 13
	--Pickup: 6, 10
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_smg_mp7_m_extended] [+20 Magazine, -5 Concealment] Value: 1

	--------------------------------------
				--Akimbo Mark 10--
	--------------------------------------
	--ID: self.x_mac10
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 40
	--Ammo: 240
	--Fire Rate: 1000
	--Damage: 70
	--Acc: 84
	--Stab: 100
	--Conc: 30
	--Threat: 13
	--Pickup: 6, 10
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_smg_mac10_m_extended] [+40 Magazine, -10 Concealment] Value: 2
	
	--Speedpull Mag [wpn_fps_smg_mac10_m_quick] [+100% Reload Speed, +40 Magazine, -8 Concealment] Value: 2

	--------------------------------------
				--Akimbo Kross Vertex--
	--------------------------------------
	--ID: self.x_polymer
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 60
	--Ammo: 240
	--Fire Rate: 1200
	--Damage: 70
	--Acc: 84
	--Stab: 100
	--Conc: 15
	--Threat: 13
	--Pickup: 6, 10
	--Notes: 
	--Active Mods:

	--------------------------------------
				--Akimbo Jacket's Piece--
	--------------------------------------
	--ID: self.x_cobray
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 64
	--Ammo: 240
	--Fire Rate: 1200
	--Damage: 70
	--Acc: 72
	--Stab: 100
	--Conc: 20
	--Threat: 13
	--Pickup: 6, 10
	--Notes: 
	--Active Mods:

	--------------------------------------
			--Akimbo Heavy SMGs--
	--------------------------------------
	--------------------------------------
				--Akimbo Patchett L2A1--
	--------------------------------------
	--ID: self.x_sterling
	--Class: Rapid Fire
	--Value: 7
	--Magazine: 40
	--Ammo: 160
	--Fire Rate: 545
	--Damage: 100
	--Acc: 60
	--Stab: 100
	--Conc: 20
	--Threat: 20
	--Pickup: 4, 6
	--Notes: Formerly a Light SMG.
	--Active Mods: 
	--Extended Mag [wpn_fps_smg_sterling_m_long] [+20 Magazine, -10 Concealment] Value: 1

	--Short Mag [wpn_fps_smg_sterling_m_short] [-20 Magazine, +10 Concealment] Value: 1

	--Heatsinked Suppressed Barrel [wpn_fps_smg_sterling_b_e11] [Suppresses Weapon, + Quiet, -100 Threat] Value: 4
	
	--Suppressed Barrel [wpn_fps_smg_sterling_b_suppressed] [Suppresses Weapon, + Quiet, -100 Threat] Value: 4

	--------------------------------------
				--Akimbo MP40--
	--------------------------------------
	--ID: self.x_erma
	--Class: Rapid Fire
	--Value: 5
	--Magazine: 64
	--Ammo: 160
	--Fire Rate: 600
	--Damage: 100
	--Acc: 68
	--Stab: 100
	--Conc: 20
	--Threat: 20
	--Pickup: 4, 6
	--Notes:
	--Active Mods: 

	--------------------------------------
				--Akimbo Swedish K--
	--------------------------------------
	--ID: self.x_m45
	--Class: Rapid Fire
	--Value: 5
	--Magazine: 72
	--Ammo: 160
	--Fire Rate: 600
	--Damage: 100
	--Acc: 60
	--Stab: 100
	--Conc: 20
	--Threat: 20
	--Pickup: 4, 6
	--Notes:
	--Active Mods: Extended Mag. [wpn_fps_smg_m45_m_extended] [+28 Magazine, -15 Concealment] Value: 4

	--------------------------------------
				--Akimbo Jackal--
	--------------------------------------
	--ID: self.x_schakal
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 60
	--Ammo: 160
	--Fire Rate: 652
	--Damage: 100
	--Acc: 64
	--Stab: 100
	--Conc: 20
	--Threat: 20
	--Pickup: 4, 6
	--Notes:
	--Active Mods: Extended Magazine [wpn_fps_smg_schakal_m_long] [+20 Magazine, -15 Concealment] Value: 1
	
	--Short Magazine [wpn_fps_smg_schakal_m_short] [+20 Magazine, +5 Concealment] Value: 1

	--------------------------------------
				--Akimbo CR 805B--
	--------------------------------------
	--ID: self.x_hajk
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 60
	--Ammo: 160
	--Fire Rate: 750
	--Damage: 100
	--Acc: 64
	--Stab: 100
	--Conc: 20
	--Threat: 20
	--Pickup: 4, 6
	--Notes:
	--Active Mods: Vintage Mag [wpn_fps_upg_m4_m_straight] [-20 Magazine, +5 Concealment] Value: 2
	
	--CAR Quadstacked Mag [wpn_fps_upg_m4_m_quad] [+60 Magazine, -20 Concealment] Value: 3
	
	--Vintage Mag [wpn_fps_upg_m4_m_straight] [-20 Magazine, +5 Concealment] Value: 2
	
	--Speedpull Mag [wpn_fps_m4_upg_m_quick] [+100% Reload Speed, -4 Concealment] Value: 2

	--------------------------------------
				--Akimbo Krinkov--
	--------------------------------------
	--ID: self.x_akmsu
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 60
	--Ammo: 160
	--Fire Rate: 822
	--Damage: 100
	--Acc: 64
	--Stab: 100
	--Conc: 20
	--Threat: 20
	--Pickup: 4, 6
	--Notes:
	--Active Mods: AK Quadstacked Mag [wpn_fps_upg_ak_m_quad] [+60 Magazine, -15 Concealment] Value: 3
	
	--Speedpull Mag [wpn_fps_upg_ak_m_quick] [+100% Reload Speed, -4 Concealment] Value: 2

	--------------------------------------
		--Primary/Akimbo Shotguns--
	--------------------------------------
	--------------------------------------
				--Joceline O/U--
	--------------------------------------
	--ID: self.b682
	--Class: Shotgun
	--Value: 1
	--Magazine: 2
	--Ammo: 34
	--Fire Rate: 500
	--Damage: 200
	--Acc: 40
	--Stab: 4
	--Conc: 25
	--Threat: 34
	--Pickup: 1, 2
	--Notes:
	--Active Mods: [wpn_fps_shot_b682_b_short] Sawed-Off Barrel [-20 Accuracy] Value: 1

	--------------------------------------
				--Mosconi 12G--
	--------------------------------------
	--ID: self.huntsman
	--Class: Shotgun
	--Value: 1
	--Magazine: 2
	--Ammo: 34
	--Fire Rate: 500
	--Damage: 200
	--Acc: 40
	--Stab: 4
	--Conc: 25
	--Threat: 34
	--Pickup: 1, 2
	--Notes:
	--Active Mods: Road Warrior Barrel [wpn_fps_shot_huntsman_b_short] [-20 Accuracy] Value: 10

	--------------------------------------
				--Breaker 12G--
	--------------------------------------
	--ID: self.boot
	--Class: Shotgun
	--Value: 1
	--Magazine: 7
	--Ammo: 28
	--Fire Rate: 80
	--Damage: 200
	--Acc: 40
	--Stab: 4
	--Conc: 20
	--Threat: 34
	--Pickup: 1, 2
	--Notes:
	--Active Mods:

	--------------------------------------
				--Akimbo Judge--
	--------------------------------------
	--ID: self.x_judge
	--Class: Shotgun
	--Value: 1
	--Magazine: 10
	--Ammo: 60
	--Fire Rate: 500
	--Damage: 180
	--Acc: 40
	--Stab: 0
	--Conc: 30
	--Threat: 10
	--Pickup: 0.5, 1
	--Notes:
	--Active Mods:

	--------------------------------------
				--Reinfeld 880--
	--------------------------------------
	--ID: self.r870
	--Class: Shotgun
	--Value: 1
	--Magazine: 8
	--Ammo: 50
	--Fire Rate: 104
	--Damage: 160
	--Acc: 40
	--Stab: 100
	--Conc: 20
	--Threat: 34
	--Pickup: 2, 3
	--Notes:
	--Active Mods:

	--------------------------------------
				--Raven--
	--------------------------------------
	--ID: self.ksg
	--Class: Shotgun
	--Value: 1
	--Magazine: 10
	--Ammo: 50
	--Fire Rate: 104
	--Damage: 160
	--Acc: 40
	--Stab: 100
	--Conc: 20
	--Threat: 34
	--Pickup: 2, 3
	--Notes:
	--Active Mods: Short Barrel [wpn_fps_sho_ksg_b_short] [-4 Magazine, +5 Concealment] Value: 5
	
	--Long Barrel [wpn_fps_sho_ksg_b_long] [+4 Magazine, -5 Concealment] Value: 7

	--------------------------------------
				--Predator 12G--
	--------------------------------------
	--ID: self.spas12
	--Class: Shotgun
	--Value: 1
	--Magazine: 8
	--Ammo: 70
	--Fire Rate: 300
	--Damage: 110
	--Acc: 40
	--Stab: 100
	--Conc: 25
	--Threat: 34
	--Pickup: 4, 5
	--Notes:
	--Active Mods: Extended Mag [wpn_fps_sho_b_spas12_long] [+4 Magazine, -5 Concealment] Value: 1

	--------------------------------------
				--M1014--
	--------------------------------------
	--ID: self.benelli
	--Class: Shotgun
	--Value: 1
	--Magazine: 8
	--Ammo: 70
	--Fire Rate: 429
	--Damage: 110
	--Acc: 40
	--Stab: 100
	--Conc: 25
	--Threat: 34
	--Pickup: 4, 5
	--Notes:
	--Active Mods: 

	--------------------------------------
				--Akimbo Goliath 12G--
	--------------------------------------
	--ID: self.x_rota
	--Class: Shotgun
	--Value: 1
	--Magazine: 12
	--Ammo: 72
	--Fire Rate: 333
	--Damage: 80
	--Acc: 40
	--Stab: 40
	--Conc: 25
	--Threat: 14
	--Pickup: 4, 5
	--Notes:
	--Active Mods: Silenced Barrel [wpn_fps_sho_rota_b_silencer] [Suppresses Weapon, +Quiet, -100 Threat] Value: 6



	--------------------------------------
				--Steakout 12G--
	--------------------------------------
	--ID: self.aa12
	--Class: Shotgun
	--Value: 1
	--Magazine: 8
	--Ammo: 80
	--Fire Rate: 300
	--Damage: 60
	--Acc: 40
	--Stab: 60
	--Conc: 20
	--Threat: 34
	--Pickup: 5, 6
	--Notes:
	--Active Mods: Suppressed Barrel [wpn_fps_sho_aa12_barrel_silenced] [Suppresses Weapon, +Quiet, -100 Threat] Value: 5

	--Drum Magazine [wpn_fps_sho_aa12_mag_drum] [+12 Magazine, -20 Concealment] Value: 1
	self.parts.wpn_fps_sho_aa12_mag_drum.stats = {value = 1, concealment = -20, extra_ammo = 12}
	self.parts.wpn_fps_sho_aa12_mag_drum.supported = true
	
	self.parts.wpn_fps_sho_aa12_barrel_silenced.stats = {suppression = 72, alert_size = 12, value = 6}
	self.parts.wpn_fps_sho_aa12_barrel_silenced.supported = true
	self.parts.wpn_fps_sho_aa12_barrel_silenced.subclass_modifiers = {
		"subclass_quiet"
	}
	self.wpn_fps_sho_aa12.override = {
		wpn_fps_upg_a_slug = {
			stats = {
				value = 5, 
				spread = 5, 
				damage = 30
			},
			custom_stats = {				
				damage_near_mul = 999999999,
				damage_far_mul = 999999999, 
				rays = 1,				
				armor_piercing_add = 1,
				can_shoot_through_enemy = false,
				can_shoot_through_shield = true,
				can_shoot_through_wall = true,
				}
			},
		wpn_fps_upg_a_custom = {
			stats = {
				value = 3, 
				spread = -5
				}
			},
		wpn_fps_upg_a_custom_free = {
			stats = {
				value = 3
			},
			custom_stats = {				
				rays = 6		
			}			
		},						
		wpn_fps_upg_a_explosive = {
			stats = {
				value = 5, 
				spread = 5
			},
			custom_stats = {
				ignore_statistic = true,
				damage_far_mul = 999999999,	--as shit as this is this should theoretically work
				damage_near_mul = 999999999,
				ammo_pickup_max_mul = 4,
				ammo_pickup_min_mul = 2.5,				
				bullet_class = "InstantExplosiveBulletBase",
				rays = 1
			}
		}
	}

	--------------------------------------
				--IZHMA 12G--
	--------------------------------------
	--ID: self.saiga
	--Class: Shotgun
	--Value: 1
	--Magazine: 7
	--Ammo: 60
	--Fire Rate: 333
	--Damage: 60
	--Acc: 40
	--Stab: 60
	--Conc: 25
	--Threat: 34
	--Pickup: 5, 6
	--Notes:
	--Active Mods: Big Brother Magazine [wpn_fps_sho_basset_m_extended] [+3 Magazine, -5 Concealment] Value: 1
	--NOTE this mod is shared with the Grimms and has variable stats.
	--wpn_fps_sho_basset_m_extended has same stats as grimm
	
	--------------------------------------
				--Brothers Grimm 12G--
	--------------------------------------
	--ID: self.x_basset
	--Class: Shotgun
	--Value: 1
	--Magazine: 14
	--Ammo: 96
	--Fire Rate: 333
	--Damage: 40
	--Acc: 40
	--Stab: 20
	--Conc: 25
	--Threat: 22
	--Pickup: 6, 7
	--Notes:
	--Active Mods: Big Brother Magazine [wpn_fps_sho_basset_m_extended] [+6 Magazine, -10 Concealment] Value: 1
	
	part_stat_override("wpn_fps_sho_x_basset","wpn_fps_sho_basset_m_extended",{stats = {
			extra_ammo = 6,
			concealment = -10,
			value = 1
		}
	})
	
	--------------------------------------
		--Marksman Rifles--
	--------------------------------------
	--------------------------------------
				--Little Friend 7.62--
	--------------------------------------
	--ID: self.contraband
	--Class: Precision
	--Value: 1
	--Magazine: 20
	--Ammo: 40
	--Fire Rate: 612
	--Damage: 160
	--Acc: 100
	--Stab: 40
	--Conc: 5
	--Threat: 31
	--Pickup: 2, 3
	--Notes: Armor Piercing
	--Active Mods: 

	--------------------------------------
				--Little Friend 7.62 (Grenade Launcher)--
	--------------------------------------
	--ID: self.contraband_m203
	--Class: Specialist
	--Value: 1
	--Magazine: 1
	--Ammo: 3
	--Fire Rate: 30
	--Damage: 1100
	--Acc: 100
	--Stab: 100
	--Conc: n/1
	--Threat: 43
	--Pickup: 0.1, 0.1
	--Notes: Area Damage
	--Active Mods:

	--------------------------------------
				--Cavity 9mm--
	--------------------------------------
	--ID: self.sub2000
	--Class: Precision
	--Value: 1
	--Magazine: 33
	--Ammo: 66
	--Fire Rate: 706
	--Damage: 160
	--Acc: 100
	--Stab: 12
	--Conc: 30
	--Threat: 10
	--Pickup: 3, 4
	--Notes: Armor Piercing
	--Active Mods: Tooth Fairy Suppressor [wpn_fps_ass_sub2000_fg_suppressed] [Suppresses Weapon, +Quiet, -100 Threat] Value: 5
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.stats = {suppression = 72, alert_size = 12, value = 6}
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.subclass_modifiers = {
		"subclass_quiet"
	}
	--------------------------------------
				--M308--
	--------------------------------------
	--ID: self.new_m14
	--Class: Precision
	--Value: 1
	--Magazine: 10
	--Ammo: 80
	--Fire Rate: 706
	--Damage: 160
	--Acc: 100
	--Stab: 84
	--Conc: 10
	--Threat: 14
	--Pickup: 3, 4
	--Notes: Armor Piercing
	--Active Mods:

	--------------------------------------
				--Galant--
	--------------------------------------
	--ID: self.ching
	--Class: Precision
	--Value: 1
	--Magazine: 8
	--Ammo: 72
	--Fire Rate: 600
	--Damage: 160
	--Acc: 100
	--Stab: 52
	--Conc: 20
	--Threat: 22
	--Pickup: 3, 4
	--Notes: Armor Piercing
	--Active Mods: Magpouch Stock [wpn_fps_ass_ching_s_pouch] [+16 Ammo Stock, -5 Concealment] Value: 1

	--------------------------------------
		--Primary Sniper Rifles--
	--------------------------------------
	--------------------------------------
			--Sniper Rifles--
	--------------------------------------
	--------------------------------------
				--Contractor .308--
	--------------------------------------
	--ID: self.tti
	--Class: Precision
	--Value: 9
	--Magazine: 20
	--Ammo: 60
	--Fire Rate: 150
	--Damage: 190
	--Acc: 100
	--Stab: 28
	--Conc: 20
	--Threat: 43
	--Pickup: 2.5, 3
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: Contractor Silencer [wpn_fps_snp_tti_ns_hex] [Suppresses Weapon, +Quiet, -100 Threat] Value: 1
	self.parts.wpn_fps_snp_tti_ns_hex.stats = {suppression = 72, alert_size = 12, value = 6}	self.parts.wpn_fps_snp_tti_ns_hex.subclass_modifiers = {
		"subclass_quiet"
	}
	--------------------------------------
				--Lebensauger .308--
	--------------------------------------
	--ID: self.wa2000
	--Class: Precision
	--Value: 9
	--Magazine: 10
	--Ammo: 60
	--Fire Rate: 150
	--Damage: 190
	--Acc: 100
	--Stab: 28
	--Conc: 15
	--Threat: 43
	--Pickup: 2.5, 3
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: Gedampfter Barrel [wpn_fps_snp_wa2000_b_suppressed] [Suppresses Weapon, +Quiet, -100 Threat] Value: 6
	
	self.parts.wpn_fps_snp_wa2000_b_suppressed.stats = {suppression = 72, alert_size = 12, value = 6}
	self.parts.wpn_fps_snp_wa2000_b_suppressed.subclass_modifiers = {
		"subclass_quiet"
	}
	--------------------------------------
				--Grom--
	--------------------------------------
	--ID: self.siltstone
	--Class: Precision
	--Value: 9
	--Magazine: 10
	--Ammo: 60
	--Fire Rate: 150
	--Damage: 190
	--Acc: 100
	--Stab: 20
	--Conc: 15
	--Threat: 43
	--Pickup: 2.5, 3
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: Tikho Barrel [wpn_fps_snp_siltstone_b_silenced] [Suppresses Weapon, +Quiet, -100 Threat] Value: 6

	self.parts.wpn_fps_snp_siltstone_b_silenced.stats = {suppression = 72, alert_size = 12, value = 6}	self.parts.wpn_fps_snp_siltstone_b_silenced.subclass_modifiers = {
		"subclass_quiet"
	}
	--Iron Sights [wpn_fps_snp_siltstone_iron_sight] [+15 Concealment, -20 Stability] Value: 1

	--------------------------------------
			--Medium Sniper Rifles--
	--------------------------------------
	--------------------------------------
				--Rattlesnake--
	--------------------------------------
	--ID: self.msr
	--Class: Precision
	--Value: 9
	--Magazine: 10
	--Ammo: 60
	--Fire Rate: 60
	--Damage: 250
	--Acc: 100
	--Stab: 20
	--Conc: 10
	--Threat: 43
	--Pickup: 2, 2.5
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: Sniper Suppressor [wpn_fps_snp_msr_ns_suppressor] [Suppresses Weapon, +Quiet, -100 Threat] Value: 5
	self.parts.wpn_fps_snp_msr_ns_suppressor.stats = {suppression = 72, alert_size = 12, value = 6}
	self.parts.wpn_fps_snp_msr_ns_suppressor.subclass_modifiers = {
		"subclass_quiet"
	}
	--------------------------------------
				--Repeater 1874--
	--------------------------------------
	--ID: self.winchester1874
	--Class: Precision
	--Value: 9
	--Magazine: 15
	--Ammo: 75
	--Fire Rate: 86
	--Damage: 250
	--Acc: 100
	--Stab: 60
	--Conc: 20
	--Threat: 14
	--Pickup: 3, 4
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: Outlaw’s Silenced Barrel [wpn_fps_snp_winchester_b_suppressed] [Suppresses Weapon, +Quiet, -100 Threat] Value: 6
	self.parts.wpn_fps_snp_winchester_b_suppressed.stats = {suppression = 72, alert_size = 12, value = 6}
	self.parts.wpn_fps_snp_winchester_b_suppressed.subclass_modifiers = {
		"subclass_quiet"
	}
	--------------------------------------
			--Heavy Sniper Rifles--
	--------------------------------------
	--------------------------------------
				--Platypus 70--
	--------------------------------------
	--ID: self.model70
	--Class: Precision
	--Value: 9
	--Magazine: 5
	--Ammo: 30
	--Fire Rate: 60
	--Damage: 480
	--Acc: 100
	--Stab: 48
	--Conc: 10
	--Threat: 43
	--Pickup: 1.5, 2.5
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: Beak Suppressor [wpn_fps_snp_model70_ns_suppressor] [Suppresses Weapon, +Quiet, -100 Threat] Value: 1
	self.parts.wpn_fps_snp_model70_ns_suppressor.stats = {suppression = 72, alert_size = 12, value = 6}
	self.parts.wpn_fps_snp_model70_ns_suppressor.subclass_modifiers = {
		"subclass_quiet"
	}
	--------------------------------------
				--R93--
	--------------------------------------
	--ID: self.r93
	--Class: Precision
	--Value: 9
	--Magazine: 6
	--Ammo: 30
	--Fire Rate: 50
	--Damage: 480
	--Acc: 100
	--Stab: 48
	--Conc: 10
	--Threat: 43
	--Pickup: 1.5, 2.5
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: Compensated Suppressor [wpn_fps_snp_r93_b_suppressed] [Suppresses Weapon, +Quiet, -100 Threat] Value: 4
	self.parts.wpn_fps_snp_r93_b_suppressed.stats = {suppression = 72, alert_size = 12, value = 6}
	self.parts.wpn_fps_snp_r93_b_suppressed.subclass_modifiers = {
		"subclass_quiet"
	}
	--------------------------------------
				--Nagant--
	--------------------------------------
	--ID: self.mosin
	--Class: Precision
	--Value: 9
	--Magazine: 5
	--Ammo: 30
	--Fire Rate: 60
	--Damage: 480
	--Acc: 100
	--Stab: 20
	--Conc: 15
	--Threat: 43
	--Pickup: 1.5, 2.5
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: Silenced Barrel [wpn_fps_snp_mosin_b_sniper] [Suppresses Weapon, +Quiet, -100 Threat] Value: 6
	self.parts.wpn_fps_snp_mosin_b_sniper.stats = {suppression = 72, alert_size = 12, value = 6}
	self.parts.wpn_fps_snp_mosin_b_sniper.subclass_modifiers = {
		"subclass_quiet"
	}
	--Nagant Bayonet [wpn_fps_snp_mosin_ns_bayonet] [Replaces Weapon Butt melee weapon with Nagant Bayonet melee weapon] Value: 1
	self.parts.wpn_fps_snp_mosin_ns_bayonet.supported = true
	self.parts.wpn_fps_snp_mosin_ns_bayonet.stats = {
		knockback_tier = 3,
		range = 250,
		min_damage = 50,
		min_damage_effect = 1,
		concealment = 0, --weapon butt's 30 + this 0
		max_damage_effect = 1,
		value = 1,
		max_damage = 80
	}

	--------------------------------------
				--Desertfox--
	--------------------------------------
	--ID: self.desertfox
	--Class: Precision
	--Value: 10
	--Magazine: 5
	--Ammo: 30
	--Fire Rate: 60
	--Damage: 480
	--Acc: 100
	--Stab: 12
	--Conc: 25
	--Threat: 43
	--Pickup: 1.5, 2.5
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: Silenced Barrel [wpn_fps_snp_desertfox_b_silencer] [Suppresses Weapon, +Quiet, -100 Threat] Value: 6
	self.parts.wpn_fps_snp_desertfox_b_silencer.stats = {suppression = 72, alert_size = 12, value = 6}
	self.parts.wpn_fps_snp_desertfox_b_silencer.subclass_modifiers = {
		"subclass_quiet"
	}
	--------------------------------------
				--Thanatos .50 cal--
	--------------------------------------
	--ID: self.m95
	--Class: Heavy
	--Value: 9
	--Magazine: 5
	--Ammo: 20
	--Fire Rate: 40
	--Damage: 3500
	--Acc: 100
	--Stab: 0
	--Conc: 0
	--Threat: 43
	--Pickup: 0.25, 0.5
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: Suppressed Barrel [wpn_fps_snp_m95_barrel_suppressed] [Suppresses Weapon, +Quiet, -100 Threat] Value: 6
	self.parts.wpn_fps_snp_m95_barrel_suppressed.stats = {suppression = 72, alert_size = 12, value = 6}
	self.parts.wpn_fps_snp_m95_barrel_suppressed.subclass_modifiers = {
		"subclass_quiet"
	}
	
	--------------------------------------
		--Akimbo Pistols--
	--------------------------------------
	--------------------------------------
			--Akimbo Light Pistols--
	--------------------------------------
	--------------------------------------
				--Akimbo Gruber Kurz--
	--------------------------------------
	--ID: self.x_ppk
	--Class: Precision
	--Value: 1
	--Magazine: 28
	--Ammo: 168
	--Fire Rate: 480
	--Damage: 20
	--Acc: 100
	--Stab: 100
	--Conc: 35
	--Threat: 0
	--Pickup: 4, 8
	--Notes: 
	--Active Mods: 

	--------------------------------------
				--Akimbo Chimano 88--
	--------------------------------------
	--ID: self.x_g17
	--Class: Precision
	--Value: 1
	--Magazine: 34
	--Ammo: 300
	--Fire Rate: 480
	--Damage: 50
	--Acc: 84
	--Stab: 48
	--Conc: 30
	--Threat: 8
	--Pickup: 3, 6
	--Notes: 
	--Active Mods: Extended Magazine [wpn_fps_pis_g18c_m_mag_33rnd] [+24 Magazine, -5 Concealment] Value: 3

	--------------------------------------
				--Akimbo M13 9mm--
	--------------------------------------
	--ID: self.x_legacy
	--Class: Precision
	--Value: 4
	--Magazine: 26
	--Ammo: 300
	--Fire Rate: 545
	--Damage: 50
	--Acc: 84
	--Stab: 48
	--Conc: 30
	--Threat: 8
	--Pickup: 3, 6
	--Notes: 
	--Active Mods: 

	--------------------------------------
				--Akimbo Chimano Compact--
	--------------------------------------
	--ID: self.jowi
	--Class: Precision
	--Value: 1
	--Magazine: 20
	--Ammo: 300
	--Fire Rate: 667
	--Damage: 50
	--Acc: 84
	--Stab: 48
	--Conc: 30
	--Threat: 8
	--Pickup: 3, 6
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_pis_g18c_m_mag_33rnd] [+24 Magazine, -5 Concealment] Value: 3
	--------------------------------------
				--Akimbo Crosskill Guard--
	--------------------------------------
	--ID: self.x_shrew
	--Class: Precision
	--Value: 1
	--Magazine: 34
	--Ammo: 300
	--Fire Rate: 667
	--Damage: 50
	--Acc: 84
	--Stab: 48
	--Conc: 30
	--Threat: 8
	--Pickup: 3, 6
	--Notes: 
	--Active Mods: Extended Mag [wpn_fps_pis_shrew_m_extended] [+8 Magazine, -2 Concealment] Value: 1

	--------------------------------------
				--Akimbo Bernetti 9--
	--------------------------------------
	--ID: self.x_b92fs
	--Class: Precision
	--Value: 1
	--Magazine: 28
	--Ammo: 300
	--Fire Rate: 667
	--Damage: 50
	--Acc: 84
	--Stab: 48
	--Conc: 30
	--Threat: 8
	--Pickup: 3, 6
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_pis_beretta_m_extended] [+24 Magazine, -5 Concealment] Value: 2

	--------------------------------------
			--Akimbo Medium Pistols--
	--------------------------------------
	--------------------------------------
				--Akimbo Crosskill--
	--------------------------------------
	--ID: self.x_1911
	--Class: Precision
	--Value: 1
	--Magazine: 20
	--Ammo: 180
	--Fire Rate: 361
	--Damage: 80
	--Acc: 92
	--Stab: 48
	--Conc: 30
	--Threat: 11
	--Pickup: 2, 5
	--Notes: 
	--Active Mods: 12rnd Mag. [wpn_fps_pis_1911_m_extended] [+4 Magazine, -2 Concealment] Value: 3
	
	--Magazine with Ameritude! [wpn_fps_pis_1911_m_big] [+24 Magazine, -5 Concealment] Value: 2

	--------------------------------------
				--Akimbo Contractor--
	--------------------------------------
	--ID: self.x_packrat
	--Class: Precision
	--Value: 4
	--Magazine: 30
	--Ammo: 180
	--Fire Rate: 361
	--Damage: 80
	--Acc: 92
	--Stab: 48
	--Conc: 30
	--Threat: 11
	--Pickup: 2, 5
	--Notes: 
	--Active Mods: Extended Magazine [wpn_fps_pis_packrat_m_extended] [+20 Magazine, -5 Concealment] Value: 1
			
	--------------------------------------
				--Akimbo Signature .40--
	--------------------------------------
	--ID: self.x_p226
	--Class: Precision
	--Value: 4
	--Magazine: 24
	--Ammo: 180
	--Fire Rate: 361
	--Damage: 80
	--Acc: 92
	--Stab: 48
	--Conc: 30
	--Threat: 11
	--Pickup: 2, 5
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_pis_p226_m_extended] [+16 Magazine, -5 Concealment] Value: 1

	--------------------------------------
				--Akimbo Broomstick--
	--------------------------------------
	--ID: self.x_c96
	--Class: Precision
	--Value: 1
	--Magazine: 20
	--Ammo: 180
	--Fire Rate: 361
	--Damage: 80
	--Acc: 92
	--Stab: 48
	--Conc: 30
	--Threat: 11
	--Pickup: 2, 5
	--Notes: 
	--Active Mods: High Capacity Mag [wpn_fps_pis_c96_m_extended] [+20 Magazine, -5 Concealment] Value: 1
			
	--Precision Barrel [wpn_fps_pis_c96_b_long] [+Armor Piercing, -45 Ammo Stock, +30 Damage,]
	--[-12 Stability, 5 Concealment, -0.5, -2 Pickup] Value: 1

	--------------------------------------
				--Akimbo Interceptor 45--
	--------------------------------------
	--ID: self.x_usp
	--Class: Precision
	--Value: 1
	--Magazine: 26
	--Ammo: 180
	--Fire Rate: 361
	--Damage: 80
	--Acc: 92
	--Stab: 48
	--Conc: 30
	--Threat: 11
	--Pickup: 2, 5
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_pis_usp_m_extended] [+16 Magazine, -4 Concealment] Value: 2
			
	--I want more Magazine! [wpn_fps_pis_usp_m_big] [+24 Magazine, -8 Concealment] Value: 4

	--------------------------------------
				--Akimbo LEO--
	--------------------------------------
	--ID: self.x_hs2000
	--Class: Precision
	--Value: 4
	--Magazine: 38
	--Ammo: 180
	--Fire Rate: 361
	--Damage: 80
	--Acc: 92
	--Stab: 48
	--Conc: 30
	--Threat: 11
	--Pickup: 2, 5
	--Notes: 
	--Active Mods: Extended Mag [wpn_fps_pis_hs2000_m_extended] [+16 Magazine, -5 Concealment] Value: 1

	--------------------------------------
				--Akimbo Chimano Custom--
	--------------------------------------
	--ID: self.x_g22c
	--Class: Precision
	--Value: 1
	--Magazine: 32
	--Ammo: 180
	--Fire Rate: 361
	--Damage: 80
	--Acc: 92
	--Stab: 48
	--Conc: 30
	--Threat: 11
	--Pickup: 2, 5
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_pis_g18c_m_mag_33rnd] [+24 Magazine, -5 Concealment] Value: 3

	--------------------------------------
			--Akimbo Heavy Pistols--
	--------------------------------------
	--------------------------------------
				--Akimbo Deagle--
	--------------------------------------
	--ID: self.x_deagle
	--Class: Precision
	--Value: 1
	--Magazine: 20
	--Ammo: 90
	--Fire Rate: 240
	--Damage: 110
	--Acc: 96
	--Stab: 20
	--Conc: 30
	--Threat: 9
	--Pickup: 1.5, 3
	--Notes: Armor Piercing
	--Active Mods: Extended Magazine [wpn_fps_pis_deagle_m_extended] [+12 Magazine, -5 Concealment] Value: 7

	--------------------------------------
				--Akimbo Parabellum--
	--------------------------------------
	--ID: self.x_breech
	--Class: Precision
	--Value: 4
	--Magazine: 16
	--Ammo: 90
	--Fire Rate: 361
	--Damage: 110
	--Acc: 96
	--Stab: 20
	--Conc: 30
	--Threat: 9
	--Pickup: 1.5, 3
	--Notes: Armor Piercing
	--Active Mods: 

	--------------------------------------
				--Akimbo Baby Deagle--
	--------------------------------------
	--ID: self.x_sparrow
	--Class: Precision
	--Value: 4
	--Magazine: 24
	--Ammo: 90
	--Fire Rate: 361
	--Damage: 110
	--Acc: 96
	--Stab: 20
	--Conc: 30
	--Threat: 9
	--Pickup: 1.5, 3
	--Notes: Armor Piercing
	--Active Mods: 

	--------------------------------------
				--Akimbo White Streak--
	--------------------------------------
	--ID: self.x_pl14
	--Class: Precision
	--Value: 4
	--Magazine: 24
	--Ammo: 90
	--Fire Rate: 361
	--Damage: 110
	--Acc: 96
	--Stab: 20
	--Conc: 30
	--Threat: 9
	--Pickup: 1.5, 3
	--Notes: Armor Piercing
	--Active Mods: Extended Magazine [wpn_fps_pis_pl14_m_extended] [+4 Magazine, -1 Concealment] Value: 1

	--------------------------------------
			--Akimbo Revolvers--
	--------------------------------------
	--------------------------------------
				--Akimbo Matever .357--
	--------------------------------------
	--ID: self.x_2006m
	--Class: Precision
	--Value: 1
	--Magazine: 12
	--Ammo: 90
	--Fire Rate: 361
	--Damage: 160
	--Acc: 100
	--Stab: 0
	--Conc: 30
	--Threat: 9
	--Pickup: 1, 2
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: 

	--------------------------------------
				--Akimbo Bronco .44--
	--------------------------------------
	--ID: self.x_rage
	--Class: Precision
	--Value: 1
	--Magazine: 12
	--Ammo: 90
	--Fire Rate: 361
	--Damage: 160
	--Acc: 100
	--Stab: 0
	--Conc: 30
	--Threat: 9
	--Pickup: 1, 2
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: 

	--------------------------------------
				--Akimbo Castigo .44--
	--------------------------------------
	--ID: self.x_chinchilla
	--Class: Precision
	--Value: 1
	--Magazine: 12
	--Ammo: 90
	--Fire Rate: 361
	--Damage: 160
	--Acc: 100
	--Stab: 0
	--Conc: 30
	--Threat: 9
	--Pickup: 1, 2
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: 

	--------------------------------------
		--Machine Guns--
	--------------------------------------
	--------------------------------------
				--RPK--
	--------------------------------------
	--ID: self.rpk
	--Class: Heavy
	--Value: 9
	--Magazine: 75
	--Ammo: 160
	--Fire Rate: 750
	--Damage: 120
	--Acc: 76
	--Stab: 88
	--Conc: 0
	--Threat: 43
	--Pickup: 0.5, 0.6
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: 

	--------------------------------------
				--Brenner-21--
	--------------------------------------
	--ID: self.hk21
	--Class: Heavy
	--Value: 9
	--Magazine: 80
	--Ammo: 120
	--Fire Rate: 732
	--Damage: 150
	--Acc: 60
	--Stab: 68
	--Conc: 0
	--Threat: 43
	--Pickup: 0.4, 0.5
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: 

	--------------------------------------
				--KSP 58--
	--------------------------------------
	--ID: self.par
	--Class: Heavy
	--Value: 9
	--Magazine: 50
	--Ammo: 120
	--Fire Rate: 909
	--Damage: 150
	--Acc: 68
	--Stab: 76
	--Conc: 0
	--Threat: 43
	--Pickup: 0.4, 0.5
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: 

	--------------------------------------
				--KSP unnumbered--
	--------------------------------------
	--ID: self.m249
	--Class: Heavy
	--Value: 9
	--Magazine: 100
	--Ammo: 160
	--Fire Rate: 909
	--Damage: 120
	--Acc: 88
	--Stab: 92
	--Conc: 0
	--Threat: 43
	--Pickup: 0.5, 0.6
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: 

	--------------------------------------
				--Buzzsaw 42--
	--------------------------------------
	--ID: self.mg42
	--Class: Heavy
	--Value: 9
	--Magazine: 50
	--Ammo: 120
	--Fire Rate: 1200
	--Damage: 150
	--Acc: 72
	--Stab: 88
	--Conc: 0
	--Threat: 43
	--Pickup: 0.4, 0.5
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: 

	--------------------------------------
		--Primary Special Weapons--
	--------------------------------------
	--------------------------------------
				--XL 5.56 Microgun--
	--------------------------------------
	--ID: self.shuno
	--Class: Heavy
	--Value: 9
	--Magazine: 600
	--Ammo: 200
	--Fire Rate: 2000
	--Damage: 100
	--Acc: 36
	--Stab: 88
	--Conc: 0
	--Threat: 43
	--Pickup: 0, 0
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: 

	--------------------------------------
				--Vulcan Minigun--
	--------------------------------------
	--ID: self.m134
	--Class: Heavy
	--Value: 9
	--Magazine: 600
	--Ammo: 200
	--Fire Rate: 3000
	--Damage: 100
	--Acc: 48
	--Stab: 68
	--Conc: 0
	--Threat: 43
	--Pickup: 0, 0
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: I’ll Take Half That Kit [wpn_fps_lmg_m134_body_upper_light] [-1500 Fire Rate]  Value: 1
	--NOTE may be pure benefit? ask

	--------------------------------------
				--Airbow--
	--------------------------------------
	--ID: self.ecp
	--Class: Precision, Quiet
	--Value: 1
	--Magazine: 6
	--Ammo: 30
	--Fire Rate: 120
	--Damage: 700
	--Acc: 100
	--Stab: 100
	--Conc: 20
	--Threat: 0
	--Pickup: 0, 0
	--Notes: Armor Piercing
	--Active Mods: Explosive Arrow [wpn_fps_bow_ecp_m_arrows_explosive] [-Armor Piercing, 2x Headshot Damage] Value: 1
	--NOTE: infinite of arrow mods are autogranted. Value may be unneccessary.
			
	--Poison Arrow [wpn_fps_bow_ecp_m_arrows_poison] [-560 Damage, + Poison] Value: 1
	self.parts.wpn_fps_bow_ecp_m_arrows_poison.subclass_modifiers = {
		"subclass_poison"
	}
	--------------------------------------
				--Light Crossbow--
	--------------------------------------
	--ID: self.frankish
	--Class: Precision, Quiet
	--Value: 1
	--Magazine: 1
	--Ammo: 50
	--Fire Rate: 40
	--Damage: 750
	--Acc: 100
	--Stab: 100
	--Conc: 30
	--Threat: 0
	--Pickup: 0, 0
	--Notes: Armor Piercing
	--Active Mods: Explosive Bolt [wpn_fps_bow_frankish_m_explosive] [-Armor Piercing, 2x Headshot Damage] Value: 1

	--Poison Bolt [wpn_fps_bow_frankish_m_poison] [-600 Damage, + Poison] Value: 1
	self.parts.wpn_fps_bow_frankish_m_poison.subclass_modifiers = {
		"subclass_poison"
	}
	--------------------------------------
				--Plainsrider Bow--
	--------------------------------------
	--ID: self.plainsrider
	--Class: Precision, Quiet
	--Value: 1
	--Magazine: 1
	--Ammo: 60
	--Fire Rate: 300
	--Damage: 1000
	--Acc: 100
	--Stab: 100
	--Conc: 30
	--Threat: 0
	--Pickup: 0, 0
	--Notes: Armor Piercing
	--Active Mods: Explosive Arrows [wpn_fps_upg_a_bow_explosion] [-Armor Piercing, 2x Headshot Damage] Value: 1

	--Poison Arrows [wpn_fps_upg_a_bow_poison] [-200 Damage, + Poison] Value: 1
	self.parts.wpn_fps_upg_a_bow_poison.subclass_modifiers = {
		"subclass_poison"
	}
	--------------------------------------
				--DECA Technologies Compound Bow--
	--------------------------------------
	--ID: self.elastic
	--Class: Precision, Quiet
	--Value: 1
	--Magazine: 1
	--Ammo: 40
	--Fire Rate: 300
	--Damage: 2000
	--Acc: 100
	--Stab: 100
	--Conc: 30
	--Threat: 0
	--Pickup: 0, 0
	--Notes: Armor Piercing
	--Active Mods: Explosive Arrow [wpn_fps_bow_elastic_m_explosive] [-Armor Piercing, 2x Headshot Damage] Value: 1

	--Poison Arrow [wpn_fps_bow_elastic_m_poison] [-1600 Damage, + Poison] Value: 1
	self.parts.wpn_fps_bow_elastic_m_poison.subclass_modifiers = {
		"subclass_poison"
	}
	--------------------------------------
				--English Longbow--
	--------------------------------------
	--ID: self.long
	--Class: Precision, Quiet
	--Value: 1
	--Magazine: 1
	--Ammo: 40
	--Fire Rate: 300
	--Damage: 2000
	--Acc: 100
	--Stab: 100
	--Conc: 30
	--Threat: 0
	--Pickup: 0, 0
	--Notes: Armor Piercing
	--Active Mods: Explosive Arrows [wpn_fps_bow_long_m_explosive] [-Armor Piercing, 2x Headshot Damage] Value: 1
			
	--Poison Arrows [wpn_fps_bow_long_m_poison] [-1600 Damage, + Poison] Value: 1
	self.parts.wpn_fps_bow_long_m_poison.subclass_modifiers = {
		"subclass_poison"
	}
	--------------------------------------
				--Heavy Crossbow--
	--------------------------------------
	--ID: self.arblast
	--Class: Precision, Quiet
	--Value: 1
	--Magazine: 1
	--Ammo: 40
	--Fire Rate: 21
	--Damage: 2000
	--Acc: 100
	--Stab: 100
	--Conc: 30
	--Threat: 0
	--Pickup: 0, 0
	--Notes: Armor Piercing
	--Active Mods: Explosive Bolt [wpn_fps_bow_arblast_m_explosive] [-Armor Piercing, 2x Headshot Damage] Value: 1

	--Poisoned Bolt [wpn_fps_bow_arblast_m_poison] [-1600 Damage, + Poison] Value: 1
	self.parts.wpn_fps_bow_arblast_m_poison.subclass_modifiers = {
		"subclass_poison"
	}
	--------------------------------------
				--GL 40 Grenade Launcher--
	--------------------------------------
	--ID: self.gre_m79
	--Class: Specialist
	--Value: 1
	--Magazine: 1
	--Ammo: 6
	--Fire Rate: 30
	--Damage: 1100
	--Acc: 100
	--Stab: 100
	--Conc: 25
	--Threat: 43
	--Pickup: 0.1, 0.2
	--Notes: Area Damage
	--Active Mods: Incendiary Round [wpn_fps_upg_a_grenade_launcher_incendiary] 
	--[-1000 Damage, + Area Denial in a large area for 15 seconds.] Value: 1
	--NOTE: may be coded in an unusual way. Provided for free w/DLC- value stat may be unnecessary
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.subclass_modifiers = {
		"subclass_areadenial"
	}		
	--------------------------------------
				--Piglet Grenade Launcher--
	--------------------------------------
	--ID: self.m32
	--Class: Specialist
	--Value: 1
	--Magazine: 6
	--Ammo: 12
	--Fire Rate: 60
	--Damage: 1100
	--Acc: 100
	--Stab: 100
	--Conc: 0
	--Threat: 43
	--Pickup: 0.1, 0.2
	--Notes: Area Damage
	--Active Mods: Incendiary Round [wpn_fps_upg_a_grenade_launcher_incendiary] 
	--[-1000 Damage, + Area Denial in a large area for 15 seconds.] Value: 1
	--(data for Incendiary Round is added under weapon attachments for "gre_m79")

	--------------------------------------
				--Flamethrower Mk.1--
	--------------------------------------
	--ID: self.flamethrower_mk2
	--Class: Specialist
	--Value: 1
	--Magazine: 900
	--Ammo: 900
	--Fire Rate: 2000
	--Damage: 100
	--Acc: 0
	--Stab: 100
	--Conc: 10
	--Threat: 43
	--Pickup: 1, 1
	--Notes:  Igniting, Armor Piercing, Body Piercing, Shield Piercing, Improv Expert Aced
	--NOTE: The Flamethrower Mk.1 does not have an active Ammo Pickup without Improv Expert Aced.
	--Active Mods: 

	--------------------------------------
	--Secondary Weapons--
	--------------------------------------
	--------------------------------------
		--Pistols--
	--------------------------------------
	--------------------------------------
			--Light Pistols--
	--------------------------------------
	--------------------------------------
				--Gruber Kurz--
	--------------------------------------
	--ID: self.ppk
	--Class: Precision
	--Value: 1
	--Magazine: 14
	--Ammo: 168
	--Fire Rate: 480
	--Damage: 20
	--Acc: 100
	--Stab: 100
	--Conc: 35
	--Threat: 0
	--Pickup: 4, 5
	--Notes: 
	--Active Mods:

	--------------------------------------
				--Chimano 88--
	--------------------------------------
	--ID: self.g17
	--NOTE listed as "glock_17" in weapontweak
	--Class: Precision
	--Value: 1
	--Magazine: 17
	--Ammo: 180
	--Fire Rate: 480
	--Damage: 50
	--Acc: 100
	--Stab: 56
	--Conc: 30
	--Threat: 4
	--Pickup: 3, 6
	--Notes: 
	--Active Mods: Extended Magazine [wpn_fps_pis_g18c_m_mag_33rnd] [+12 Magazine, -3 Concealment] Value: 3

	--------------------------------------
				--M13 9mm--
	--------------------------------------
	--ID: self.legacy
	--Class: Precision
	--Value: 4
	--Magazine: 13
	--Ammo: 180
	--Fire Rate: 545
	--Damage: 50
	--Acc: 100
	--Stab: 48
	--Conc: 30
	--Threat: 8
	--Pickup: 3, 6
	--Notes: 
	--Active Mods: 

	--------------------------------------
				--Chimano Compact--
	--------------------------------------
	--ID: self.g26
	--Class: Precision
	--Value: 1
	--Magazine: 10
	--Ammo: 180
	--Fire Rate: 480
	--Damage: 50
	--Acc: 100
	--Stab: 48
	--Conc: 30
	--Threat: 8
	--Pickup: 3, 6
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_pis_g18c_m_mag_33rnd] [+12 Magazine, -3 Concealment] Value: 3

	--------------------------------------
				--Crosskill Guard--
	--------------------------------------
	--ID: self.shrew
	--Class: Precision
	--Value: 1
	--Magazine: 17
	--Ammo: 180
	--Fire Rate: 480
	--Damage: 50
	--Acc: 100
	--Stab: 48
	--Conc: 30
	--Threat: 8
	--Pickup: 3, 6
	--Notes: 
	--Active Mods: Extended Mag [wpn_fps_pis_shrew_m_extended] [+4 Magazine, -1 Concealment] Value: 1

	--------------------------------------
				--Bernetti 9--
	--------------------------------------
	--ID: self.b92fs
	--Class: Precision
	--Value: 1
	--Magazine: 28
	--Ammo: 180
	--Fire Rate: 480
	--Damage: 50
	--Acc: 100
	--Stab: 48
	--Conc: 30
	--Threat: 8
	--Pickup: 3, 6
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_pis_beretta_m_extended] [+12 Magazine, -3 Concealment] Value: 2

	--------------------------------------
			--Medium Pistols--
	--------------------------------------
	--------------------------------------
				--Crosskill--
	--------------------------------------
	--ID: self.colt_1911
	--Class: Precision
	--Value: 1
	--Magazine: 10
	--Ammo: 90
	--Fire Rate: 361
	--Damage: 80
	--Acc: 100
	--Stab: 56
	--Conc: 30
	--Threat: 11
	--Pickup: 2, 5
	--Notes: 
	--Active Mods: 12rnd Mag. [wpn_fps_pis_1911_m_extended] [+2 Magazine, -1 Concealment] Value: 3
			
	--Magazine with Ameritude! [wpn_fps_pis_1911_m_big] [+12 Magazine, -3 Concealment] Value: 2

	--------------------------------------
				--Contractor--
	--------------------------------------
	--ID: self.packrat
	--Class: Precision
	--Value: 4
	--Magazine: 15
	--Ammo: 90
	--Fire Rate: 361
	--Damage: 80
	--Acc: 100
	--Stab: 48
	--Conc: 30
	--Threat: 11
	--Pickup: 2, 5
	--Notes: 
	--Active Mods: Extended Magazine [wpn_fps_pis_packrat_m_extended] [+10 Magazine, -1 Concealment] Value: 2

	--------------------------------------
				--Signature .40--
	--------------------------------------
	--ID: self.p226
	--Class: Precision
	--Value: 4
	--Magazine: 12
	--Ammo: 90
	--Fire Rate: 361
	--Damage: 80
	--Acc: 100
	--Stab: 48
	--Conc: 30
	--Threat: 11
	--Pickup: 2, 5
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_pis_p226_m_extended] [+8 Magazine, -2 Concealment] Value: 1

	--------------------------------------
				--Broomstick--
	--------------------------------------
	--ID: self.c96
	--Class: Precision
	--Value: 1
	--Magazine: 20
	--Ammo: 90
	--Fire Rate: 361
	--Damage: 80
	--Acc: 100
	--Stab: 60
	--Conc: 30
	--Threat: 11
	--Pickup: 2, 5
	--Notes: 
	--Active Mods: High Capacity Mag [wpn_fps_pis_c96_m_extended] [+10 Magazine, -2 Concealment] Value: 1
			
	--Precision Barrel [wpn_fps_pis_c96_b_long] [+Armor Piercing, -30 Ammo Stock. +30 Damage,
	--+32 Stability, 5 Concealment, -0.5, -2 Pickup] Value: 1

	--------------------------------------
				--Interceptor 45--
	--------------------------------------
	--ID: self.usp
	--Class: Precision
	--Value: 1
	--Magazine: 13
	--Ammo: 90
	--Fire Rate: 361
	--Damage: 80
	--Acc: 100
	--Stab: 48
	--Conc: 30
	--Threat: 11
	--Pickup: 2, 5
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_pis_usp_m_extended] [+18 Magazine, -2 Concealment] Value: 3
			
	--I want more Magazine! [wpn_fps_pis_usp_m_big] [+12 Magazine, -4 Concealment] Value: 2

	--------------------------------------
				--LEO--
	--------------------------------------
	--ID: self.hs2000
	--Class: Precision
	--Value: 4
	--Magazine: 38
	--Ammo: 90
	--Fire Rate: 361
	--Damage: 80
	--Acc: 100
	--Stab: 48
	--Conc: 30
	--Threat: 11
	--Pickup: 2, 5
	--Notes: 
	--Active Mods: Extended Mag [wpn_fps_pis_hs2000_m_extended] [+16 Magazine, -5 Concealment] Value: 1

	--------------------------------------
				--Chimano Custom--
	--------------------------------------
	--ID: self.g22c
	--Class: Precision
	--Value: 1
	--Magazine: 16
	--Ammo: 90
	--Fire Rate: 361
	--Damage: 80
	--Acc: 100
	--Stab: 48
	--Conc: 30
	--Threat: 11
	--Pickup: 2, 5
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_pis_g18c_m_mag_33rnd] [+12 Magazine, -2 Concealment] Value: 3

	--------------------------------------
			--Heavy Pistols--
	--------------------------------------
	--------------------------------------
				--5/7 AP--
	--------------------------------------
	--ID: self.lemming
	--Class: Precision
	--Value: 4
	--Magazine: 20
	--Ammo: 45
	--Fire Rate: 600
	--Damage: 110
	--Acc: 100
	--Stab: 36
	--Conc: 25
	--Threat: 9
	--Pickup: 0.5, 0.75
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: Extended Magazine [wpn_fps_pis_lemming_m_ext] [+10 Magazine, -5 Concealment] Value: 1

	--------------------------------------
				--Deagle--
	--------------------------------------
	--ID: self.deagle
	--Class: Precision
	--Value: 1
	--Magazine: 10
	--Ammo: 60
	--Fire Rate: 240
	--Damage: 110
	--Acc: 100
	--Stab: 20
	--Conc: 25
	--Threat: 9
	--Pickup: 1.5, 3
	--Notes: Armor Piercing
	--Active Mods: Extended Magazine [wpn_fps_pis_deagle_m_extended] [+6 Magazine, -2 Concealment] Value: 7

	--------------------------------------
				--Parabellum--
	--------------------------------------
	--ID: self.breech
	--Class: Precision
	--Value: 4
	--Magazine: 8
	--Ammo: 60
	--Fire Rate: 361
	--Damage: 110
	--Acc: 100
	--Stab: 24
	--Conc: 25
	--Threat: 9
	--Pickup: 1.5, 3
	--Notes: Armor Piercing
	--Active Mods:

	--------------------------------------
				--Baby Deagle--
	--------------------------------------
	--ID: self.sparrow
	--Class: Precision
	--Value: 4
	--Magazine: 12
	--Ammo: 60
	--Fire Rate: 240
	--Damage: 110
	--Acc: 100
	--Stab: 24
	--Conc: 25
	--Threat: 9
	--Pickup: 1.5, 3
	--Notes: Armor Piercing
	--Active Mods:

	--------------------------------------
				--White Streak--
	--------------------------------------
	--ID: self.pl14
	--Class: Precision
	--Value: 4
	--Magazine: 12
	--Ammo: 60
	--Fire Rate: 240
	--Damage: 110
	--Acc: 100
	--Stab: 28
	--Conc: 25
	--Threat: 9
	--Pickup: 1.5, 3
	--Notes: Armor Piercing
	--Active Mods: Extended Magazine [wpn_fps_pis_pl14_m_extended] [+2 Magazine, -1 Concealment] Value: 1

	--------------------------------------
			--Revolvers--
	--------------------------------------
	--------------------------------------
				--Matever .357--
	--------------------------------------
	--ID: self.2006m
	--NOTE listed as "mateba" in weapontweak
	--Class: Precision
	--Value: 1
	--Magazine: 6
	--Ammo: 60
	--Fire Rate: 361
	--Damage: 160
	--Acc: 100
	--Stab: 12
	--Conc: 25
	--Threat: 24
	--Pickup: 1, 2
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: 

	--------------------------------------
				--Bronco .44--
	--------------------------------------
	--ID: self.new_raging_bull
	--Class: Precision
	--Value: 1
	--Magazine: 6
	--Ammo: 60
	--Fire Rate: 361
	--Damage: 160
	--Acc: 100
	--Stab: 24
	--Conc: 25
	--Threat: 24
	--Pickup: 1, 2
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: 

	--------------------------------------
				--Castigo .44--
	--------------------------------------
	--ID: self.chinchilla
	--Class: Precision
	--Value: 1
	--Magazine: 6
	--Ammo: 60
	--Fire Rate: 361
	--Damage: 160
	--Acc: 100
	--Stab: 12
	--Conc: 25
	--Threat: 24
	--Pickup: 1, 2
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: 

	--------------------------------------
				--Peacemaker .45--
	--------------------------------------
	--ID: self.peacemaker
	-- https://www.youtube.com/watch?v=ufH4eZ7sF_I
	--Class: Heavy --NOTE not error, no akimbo peacemaker.
	--Value: 1
	--Magazine: 6
	--Ammo: 30
	--Fire Rate: 240
	--Damage: 360
	--Acc: 100
	--Stab: 0
	--Conc: 15
	--Threat: 43
	--Pickup: 1, 2
	--Notes: Armor Piercing, Body Piercing, Shield Piercing
	--Active Mods: 

	--------------------------------------
		--Machine Pistols--
	--------------------------------------
	--------------------------------------
				--Igor Automatik--
	--------------------------------------
	--ID: self.stech
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 20
	--Ammo: 160
	--Fire Rate: 750
	--Damage: 60
	--Acc: 80
	--Stab: 44
	--Conc: 32
	--Threat: 8
	--Pickup: 7, 11
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_pis_stech_m_extended] [+14 Magazine, -2 Concealment] Value: 5

	--------------------------------------
				--STRYK 18c--
	--------------------------------------
	--ID: self.g18c
	--NOTE: listed as "glock_18c" in weapontweak
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 20
	--Ammo: 240
	--Fire Rate: 909
	--Damage: 40
	--Acc: 68
	--Stab: 88
	--Conc: 32
	--Threat: 8
	--Pickup: 9, 18
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_pis_g18c_m_mag_33rnd] [+12 Magazine, -2 Concealment] Value: 3

	--------------------------------------
				--Czech 92--
	--------------------------------------
	--ID: self.czech
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 15
	--Ammo: 300
	--Fire Rate: 1000
	--Damage: 40
	--Acc: 80
	--Stab: 40
	--Conc: 32
	--Threat: 8
	--Pickup: 9, 18
	--Notes: 
	--Active Mods: Extended Magazine [wpn_fps_pis_czech_m_extended] [+10 Magazine, -2 Concealment] Value: 1

	--------------------------------------
				--Bernetti Auto--
	--------------------------------------
	--ID: self.beer
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 15
	--Ammo: 300
	--Fire Rate: 1101
	--Damage: 40
	--Acc: 84
	--Stab: 80
	--Conc: 32
	--Threat: 8
	--Pickup: 9, 18
	--Notes: 
	--Active Mods: Extended Magazine [wpn_fps_pis_beer_m_extended] [+6 Magazine, -2 Concealment] Value: 3

	--------------------------------------
		--SMGs--
	--------------------------------------
	--------------------------------------
			--Light SMGs--
	--------------------------------------
	--------------------------------------
				--Tatonka--
	--------------------------------------
	--ID: self.coal
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 64
	--Ammo: 200
	--Fire Rate: 652
	--Damage: 50
	--Acc: 80
	--Stab: 100
	--Conc: 28
	--Threat: 10
	--Pickup: 8, 16
	--Notes: Formerly a Heavy SMG
	--Active Mods: 

	--------------------------------------
				--Uzi SMG--
	--------------------------------------
	--ID: self.uzi
	--Class: Rapid Fire
	--Value: 7
	--Magazine: 32
	--Ammo: 200
	--Fire Rate: 698
	--Damage: 50
	--Acc: 68
	--Stab: 100
	--Conc: 20
	--Threat: 13
	--Pickup: 8, 16
	--Notes: 
	--Active Mods: 

	--------------------------------------
				--Signature SMG--
	--------------------------------------
	--ID: self.shepheard
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 20
	--Ammo: 200
	--Fire Rate: 750
	--Damage: 50
	--Acc: 64
	--Stab: 100
	--Conc: 25
	--Threat: 13
	--Pickup: 8, 16
	--Notes: 
	--Active Mods: Extended Magazine [wpn_fps_smg_shepheard_mag_extended] [+10 Magazine, -2 Concealment] Value: 1

	--------------------------------------
				--Compact-5--
	--------------------------------------
	--ID: self.new_mp5
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 210
	--Fire Rate: 750
	--Damage: 50
	--Acc: 64
	--Stab: 100
	--Conc: 25
	--Threat: 10
	--Pickup: 8, 16
	--Notes: 
	--Active Mods:

	--------------------------------------
				--Blaster 9mm--
	--------------------------------------
	--ID: self.tec9
	--Class: Rapid Fire
	--Value: 7
	--Magazine: 20
	--Ammo: 220
	--Fire Rate: 896
	--Damage: 50
	--Acc: 52
	--Stab: 100
	--Conc: 30
	--Threat: 10
	--Pickup: 8, 16
	--Notes: 
	--Active Mods: Extended Mag [wpn_fps_smg_tec9_m_extended] [+12 Magazine, -2 Concealment] Value: 4

	--------------------------------------
				--CMP--
	--------------------------------------
	--ID: self.mp9
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 15
	--Ammo: 240
	--Fire Rate: 952
	--Damage: 50
	--Acc: 68
	--Stab: 100
	--Conc: 30
	--Threat: 10
	--Pickup: 8, 16
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_smg_mp9_m_extended] [+15 Magazine, -2 Concealment] Value: 4

	--Tactical Suppressor [wpn_fps_smg_mp9_b_suppressed] [Suppresses Weapon, +Quiet, -100 Threat] Value: 4
	self.parts.wpn_fps_smg_mp9_b_suppressed.stats = {suppression = 72, alert_size = 12, value = 6}
	self.parts.wpn_fps_smg_mp9_b_suppressed.subclass_modifiers = {
		"subclass_quiet"
	}
	--------------------------------------
				--Cobra--
	--------------------------------------
	--ID: self.scorpion
	--Class: Rapid Fire
	--Value: 7
	--Magazine: 20
	--Ammo: 220
	--Fire Rate: 1000
	--Damage: 50
	--Acc: 52
	--Stab: 100
	--Conc: 30
	--Threat: 10
	--Pickup: 8, 16
	--Notes: 
	--Active Mods: Extended Mag [+20 Magazine, -10 Concealment]

	--------------------------------------
				--Micro Uzi--
	--------------------------------------
	--ID: self.baka
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 32
	--Ammo: 240
	--Fire Rate: 1200
	--Damage: 50
	--Acc: 44
	--Stab: 100
	--Conc: 25
	--Threat: 10
	--Pickup: 8, 16
	--Notes: 
	--Active Mods:
	--Futomaki Suppressor [wpn_fps_smg_baka_b_longsupp] [Suppresses Weapon, +Quiet, -100 Threat] Value: 1
	self.parts.wpn_fps_smg_baka_b_longsupp.stats = {suppression = 72, alert_size = 12, value = 6}
	self.parts.wpn_fps_smg_baka_b_longsupp.subclass_modifiers = {
		"subclass_quiet"
	}
	
	--Maki Suppressor [wpn_fps_smg_baka_b_midsupp] [Suppresses Weapon, +Quiet, -100 Threat] Value: 1
	self.parts.wpn_fps_smg_baka_b_midsupp.stats = {suppression = 72, alert_size = 12, value = 6}
	self.parts.wpn_fps_smg_baka_b_midsupp.subclass_modifiers = {
		"subclass_quiet"
	}
	
	--Spring Suppressor [wpn_fps_smg_baka_b_smallsupp] [Suppresses Weapon, +Quiet, -100 Threat] Value: 1
	self.parts.wpn_fps_smg_baka_b_smallsupp.stats = {suppression = 72, alert_size = 12, value = 6}	self.parts.wpn_fps_smg_baka_b_smallsupp.subclass_modifiers = {
		"subclass_quiet"
	}
	--------------------------------------
			--Medium SMGs--
	--------------------------------------
	--------------------------------------
				--Para--
	--------------------------------------
	--ID: self.olympic
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 20
	--Ammo: 160
	--Fire Rate: 682
	--Damage: 70
	--Acc: 72
	--Stab: 100
	--Conc: 25
	--Threat: 13
	--Pickup: 6, 10
	--Notes: 
	--Active Mods: Milspec Mag [wpn_fps_m4_uupg_m_std] [+10 Magazine, -2 Concealment] Value: 1

	--Tactical Mag [wpn_fps_upg_m4_m_pmag] [+10 Magazine, -2 Concealment] Value: 3

	--Expert Mag [wpn_fps_ass_l85a2_m_emag] [+10 Magazine, -2 Concealment] Value: 1

	--L5 Magazine [wpn_fps_upg_m4_m_l5] [+10 Magazine, -2 Concealment] Value: 1

	--CAR Quadstacked Mag [wpn_fps_upg_m4_m_quad] [+40 Magazine, -10 Concealment] Value: 3

	--Speedpull Mag [wpn_fps_m4_upg_m_quick] [+100% Reload Speed, +10 Magazine, -4 Concealment] Value: 2

	--------------------------------------
				--Chicago Typewriter--
	--------------------------------------
	--ID: self.m1928
	--Class: Rapid Fire
	--Value: 9
	--Magazine: 50
	--Ammo: 160
	--Fire Rate: 723
	--Damage: 70
	--Acc: 88
	--Stab: 100
	--Conc: 15
	--Threat: 20
	--Pickup: 6, 10
	--Notes: 
	--Active Mods: 

	--------------------------------------
				--Heather--
	--------------------------------------
	--ID: self.sr2
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 160
	--Fire Rate: 750
	--Damage: 70
	--Acc: 84
	--Stab: 100
	--Conc: 25
	--Threat: 13
	--Pickup: 6, 10
	--Notes: 
	--Active Mods: 
	--Speed Pull Mag [wpn_fps_smg_sr2_m_quick] [+100% Reload Speed, -8 Concealment] Value: 2 

	--------------------------------------
				--Kobus 90--
	--------------------------------------
	--ID: self.p90
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 50
	--Ammo: 160
	--Fire Rate: 909
	--Damage: 70
	--Acc: 76
	--Stab: 100
	--Conc: 20
	--Threat: 13
	--Pickup: 6, 10
	--Notes: 
	--Active Mods: 
	--Speed Pull Mag [wpn_fps_smg_p90_m_strap] [+100% Reload Speed, -3 Concealment] Value: 2

	--------------------------------------
				--SpecOps--
	--------------------------------------
	--ID: self.mp7
	--Class: Rapid Fire
	--Value: 7
	--Magazine: 20
	--Ammo: 160
	--Fire Rate: 952
	--Damage: 70
	--Acc: 84
	--Stab: 100
	--Conc: 25
	--Threat: 13
	--Pickup: 6, 10
	--Notes: 
	--Active Mods: 
	--Extended Mag. [wpn_fps_smg_mp7_m_extended] [+10 Magazine, -2 Concealment] Value: 1

	--------------------------------------
				--Mark 10--
	--------------------------------------
	--ID: self.mac10
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 20
	--Ammo: 160
	--Fire Rate: 1000
	--Damage: 70
	--Acc: 84
	--Stab: 100
	--Conc: 30
	--Threat: 13
	--Pickup: 6, 10
	--Notes: 
	--Active Mods: 
	--Extended Mag. [wpn_fps_smg_mac10_m_extended] [+20 Magazine, -5 Concealment] Value: 2

	--Speed Pull Mag [wpn_fps_smg_mac10_m_quick] [+100% Reload Speed, +20 Magazine, -10 Concealment] Value: 2

	--------------------------------------
				--Kross Vertex--
	--------------------------------------
	--ID: self.polymer
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 160
	--Fire Rate: 1200
	--Damage: 70
	--Acc: 84
	--Stab: 100
	--Conc: 15
	--Threat: 13
	--Pickup: 6, 10
	--Notes: 
	--Active Mods: 

	--------------------------------------
				--Jacket's Piece--
	--------------------------------------
	--ID: self.cobray
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 32
	--Ammo: 160
	--Fire Rate: 1200
	--Damage: 70
	--Acc: 72
	--Stab: 100
	--Conc: 20
	--Threat: 13
	--Pickup: 6, 10
	--Notes: 
	--Active Mods: 

	--------------------------------------
			--Heavy SMGs--
	--------------------------------------
	--------------------------------------
				--Patchett L2A1--
	--------------------------------------
	--ID: self.sterling
	--Class: Rapid Fire
	--Value: 7
	--Magazine: 20
	--Ammo: 80
	--Fire Rate: 545
	--Damage: 100
	--Acc: 56
	--Stab: 100
	--Conc: 20
	--Threat: 12
	--Pickup: 4, 6
	--Notes: Formerly a Light SMG.
	--Active Mods: 
	--Extended Mag [wpn_fps_smg_sterling_m_long] [+10 Magazine, -5 Concealment] Value: 1
		
	--Short Mag [wpn_fps_smg_sterling_m_short] [-10 Magazine, +5 Concealment] Value: 1
	
	--Heatsinked Suppressed Barrel [wpn_fps_smg_sterling_b_e11] [Suppresses Weapon, + Quiet, -100 Threat] Value: 4
	self.parts.wpn_fps_smg_sterling_b_e11.stats = {suppression = 72, alert_size = 12, value = 6}	self.parts.wpn_fps_smg_sterling_b_e11.subclass_modifiers = {
		"subclass_quiet"
	}
	
	--Suppressed Barrel [wpn_fps_smg_sterling_b_suppressed] [Suppresses Weapon, + Quiet, -100 Threat] Value: 4
	self.parts.wpn_fps_smg_sterling_b_suppressed.stats = {suppression = 72, alert_size = 12, value = 6}	self.parts.wpn_fps_smg_sterling_b_suppressed.subclass_modifiers = {
		"subclass_quiet"
	}
	--------------------------------------
				--MP40--
	--------------------------------------
	--ID: self.erma
	--Class: Rapid Fire
	--Value: 5
	--Magazine: 32
	--Ammo: 80
	--Fire Rate: 600
	--Damage: 100
	--Acc: 100
	--Stab: 80
	--Conc: 25
	--Threat: 20
	--Pickup: 4, 6
	--Notes: 
	--Active Mods:

	--------------------------------------
				--Swedish K--
	--------------------------------------
	--ID: self.m45
	--Class: Rapid Fire
	--Value: 5
	--Magazine: 36
	--Ammo: 80
	--Fire Rate: 600
	--Damage: 100
	--Acc: 100
	--Stab: 80
	--Conc: 20
	--Threat: 20
	--Pickup: 4, 6
	--Notes: 
	--Active Mods: Extended Mag. [wpn_fps_smg_m45_m_extended] [+14 Magazine, -5 Concealment] Value: 4

	--------------------------------------
				--Jackal--
	--------------------------------------
	--ID: self.schakal
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 80
	--Fire Rate: 652
	--Damage: 100
	--Acc: 100
	--Stab: 76
	--Conc: 20
	--Threat: 20
	--Pickup: 4, 6
	--Notes: 
	--Active Mods: Extended Magazine [wpn_fps_smg_schakal_m_long] [+10 Magazine, -10 Concealment] Value: 1

	--Short Magazine [wpn_fps_smg_schakal_m_short] [-10 Magazine, +5 Concealment] Value: 1

	--------------------------------------
				--CR 805B--
	--------------------------------------
	--ID: self.hajk
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 80
	--Fire Rate: 750
	--Damage: 100
	--Acc: 100
	--Stab: 100
	--Conc: 10
	--Threat: 20
	--Pickup: 4, 6
	--Notes: 
	--Active Mods: CAR Quadstacked Mag [wpn_fps_upg_m4_m_quad] [+30 Magazine, -10 Concealment] Value: 3

	--Vintage Mag [wpn_fps_upg_m4_m_straight] [-10 Magazine, +5 Concealment] Value: 2

	--Speed Pull Mag [wpn_fps_m4_upg_m_quick] [+100% Reload Speed, -4 Concealment] Value: 2

	--------------------------------------
				--Krinkov--
	--------------------------------------
	--ID: self.akmsu
	--Class: Rapid Fire
	--Value: 1
	--Magazine: 30
	--Ammo: 80
	--Fire Rate: 822
	--Damage: 100
	--Acc: 92
	--Stab: 100
	--Conc: 20
	--Threat: 20
	--Pickup: 4, 6
	--Notes: 
	--Active Mods: AK Quadstacked Mag [wpn_fps_upg_ak_m_quad] [+30 Magazine, -15 Concealment] Value: 3

	--Speed Pull Mag [wpn_fps_upg_ak_m_quick] [+100% Reload Speed, -4 Concealment] Value: 2
--IND
	--------------------------------------
		--Secondary Shotguns--
	--------------------------------------
	--------------------------------------
				--Claire 12G--
	--------------------------------------
	--ID: self.coach
	--Class: Shotgun
	--Value: 3
	--Magazine: 2
	--Ammo: 22
	--Fire Rate: 170
	--Damage: 170
	--Acc: 40
	--Stab: 12
	--Conc: 30
	--Threat: 34
	--Pickup: 1, 2
	--Notes: 
	--Active Mods: Sawed-Off Barrel [wpn_fps_sho_coach_b_short] [-20 Accuracy] Value: 1

	--------------------------------------
				--GSPS 12G--
	--------------------------------------
	--ID: self.m37
	--Class: Shotgun
	--Value: 1
	--Magazine: 7
	--Ammo: 46
	--Fire Rate: 104
	--Damage: 130
	--Acc: 40
	--Stab: 52
	--Conc: 25
	--Threat: 34
	--Pickup: 2, 3
	--Notes: 
	--Active Mods: 

	--------------------------------------
				--Locomotive 12G--
	--------------------------------------
	--ID: self.serbu
	--Class: Shotgun
	--Value: 1
	--Magazine: 8
	--Ammo: 42
	--Fire Rate: 160
	--Damage: 130
	--Acc: 40
	--Stab: 36
	--Conc: 30
	--Threat: 34
	--Pickup: 2, 3
	--Notes: 
	--Active Mods: Extended Magazine [wpn_fps_shot_shorty_m_extended_short] [+2 Magazine, -3 Concealment] Value: 1
			
	--Shell Rack: [wpn_fps_shot_r870_body_rack] [+5 Ammo Stock, -3 Concealment] Value: 3

	--------------------------------------
				--Goliath 12G--
	--------------------------------------
	--ID: self.rota
	--Class: Shotgun
	--Value: 1
	--Magazine: 6
	--Ammo: 54
	--Fire Rate: 333
	--Damage: 80
	--Acc: 40
	--Stab: 52
	--Conc: 20
	--Threat: 34
	--Pickup: 4, 5
	--Notes: 
	--Active Mods: Silenced Barrel [wpn_fps_sho_rota_b_silencer] [Suppresses Weapon, +Quiet, -100 Threat] Value: 6

	self.parts.wpn_fps_sho_rota_b_silencer.stats = {suppression = 72, alert_size = 12, value = 6}
	self.parts.wpn_fps_sho_rota_b_silencer.subclass_modifiers = {
		"subclass_quiet"
	}

	--------------------------------------
				--Judge--
	--------------------------------------
	--ID: self.judge
	--Class: Shotgun
	--Value: 1
	--Magazine: 5
	--Ammo: 35
	--Fire Rate: 500
	--Damage: 180
	--Acc: 40
	--Stab: 20
	--Conc: 30
	--Threat: 11
	--Pickup: 0.5, 1
	--Notes: 
	--Active Mods:

	--------------------------------------
				--Grimm 12G--
	--------------------------------------
	--ID: self.basset
	--Class: Shotgun
	--Value: 1
	--Magazine: 7
	--Ammo: 96
	--Fire Rate: 300
	--Damage: 30
	--Acc: 40
	--Stab: 60
	--Conc: 30
	--Threat: 11
	--Pickup: 5, 6
	--Notes: 
	--Active Mods: Big Brother Magazine [wpn_fps_sho_basset_m_extended] [+3 Magazine, -5 Concealment] Value: 1

	self.parts.wpn_fps_sho_basset_m_extended.stats = {
		concealment = -5,
		extra_ammo = 3,
		value = 1
	}
	
	--------------------------------------
				--Street Sweeper--
	--------------------------------------
	--ID: self.striker
	--Class: Shotgun
	--Value: 1
	--Magazine: 12
	--Ammo: 72
	--Fire Rate: 429
	--Damage: 60
	--Acc: 40
	--Stab: 60
	--Conc: 20
	--Threat: 43
	--Pickup: 4, 5
	--Notes: 
	--Active Mods: Suppressed Barrel [wpn_fps_sho_striker_b_suppressed] [Suppresses Weapon, + “Quiet” Class, -100 Threat] Value: 5
	self.parts.wpn_fps_sho_striker_b_suppressed.stats = {suppression = 72, alert_size = 12, value = 6}
	self.parts.wpn_fps_sho_striker_b_suppressed.subclass_modifiers = {
		"subclass_quiet"
	}

	--------------------------------------
		--Secondary Special Weapons--
	--------------------------------------
	--------------------------------------
				--Pistol Crossbow--
	--------------------------------------
	--ID: self.hunter
	--Class: Precision, Quiet
	--Value: 1
	--Magazine: 1
	--Ammo: 30
	--Fire Rate: 50
	--Damage: 350
	--Acc: 100
	--Stab: 100
	--Conc: 30
	--Threat: 0
	--Pickup: 0, 0
	--Notes: Armor Piercing
	--Active Mods: Explosive Bolt [wpn_fps_upg_a_crossbow_explosion] [- Armor Piercing, 2x Headshot Damage] Value: 1
	--NOTE: This type of mod given for free, infinite. Value stat may be unnecessary.
	
	--Poison Bolt [wpn_fps_upg_a_crossbow_poison] [-250 Damage, +Poison] Value: 1
	self.parts.wpn_fps_upg_a_crossbow_poison.subclass_modifiers = {
		"subclass_poison"
	}
	
	--------------------------------------
				--MA-17 Flamethrower--
	--------------------------------------
	--ID: self.system
	--Class: Specialist
	--Value: 1
	--Magazine: 600
	--Ammo: 600
	--Fire Rate: 2000
	--Damage: 100
	--Acc: 0
	--Stab: 100
	--Conc: 20
	--Threat: 43
	--Pickup: 1, 1
	--Notes: Igniting, Armor Piercing, Body Piercing, Shield Piercing, Improv Expert Aced
	--NOTE: Note: The MA-17 Flamethrower does not have an active Ammo Pickup without Improv Expert Aced.
	--Active Mods:

	--------------------------------------
				--Compact 40mm--
	--------------------------------------
	--ID: self.slap
	--Class: Specialist
	--Value: 1
	--Magazine: 1
	--Ammo: 6
	--Fire Rate: 30
	--Damage: 1100
	--Acc: 84
	--Stab: 84
	--Conc: 30
	--Threat: 43
	--Pickup: 0.05, 0.1
	--Notes: Area Damage
	--Active Mods: Incendiary Round [wpn_fps_upg_a_grenade_launcher_incendiary] [-1000 Damage, +Area Denial in a large area for 15 seconds.] Value: 1
	--NOTE: This type of mod given for free, infinite. Value stat may be unnecessary.
	--(data for Incendiary Round is added under weapon attachments for "gre_m79")

	--------------------------------------
				--China Puff 40mm--
	--------------------------------------
	--ID: self.china
	--Class: Specialist
	--Value: 1
	--Magazine: 3
	--Ammo: 6
	--Fire Rate: 50
	--Damage: 1100
	--Acc: 100
	--Stab: 100
	--Conc: 20
	--Threat: 43
	--Pickup: 0.05, 0.1
	--Notes: Area Damage
	--Active Mods: Incendiary Round [wpn_fps_upg_a_grenade_launcher_incendiary] [-1000 Damage, +Area Denial in a large area for 15 seconds.] Value: 
	--NOTE: This type of mod given for free, infinite. Value stat may be unnecessary.
	--(data for Incendiary Round is added under weapon attachments for "gre_m79")
	--------------------------------------
				--Arbiter--
	--------------------------------------
	--ID: self.arbiter
	--Class: Specialist
	--Value: 1
	--Magazine: 5
	--Ammo: 15
	--Fire Rate: 80
	--Damage: 520
	--Acc: 100
	--Stab: 100
	--Conc: 20
	--Threat: 43
	--Pickup: 0.05, 0.1
	--Notes: Area Damage
	--NOTE: Unlike other Area Denial effects that mimic the Molotov Cocktail’s full-sized pool of flame, 
	-- the Arbiter’s Area Denial is based on the Incendiary Grenade’s reduced radius that only uses
	-- the central flame of the Molotov Cocktail effect.
	--Active Mods: Incendiary Round [wpn_fps_upg_a_grenade_launcher_incendiary_arbiter] [-470 Damage, +Area Denial in a small area for 10 seconds.] Value: 1
			
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.subclass_modifiers = {
		"subclass_areadenial"
	}
	--------------------------------------
				--HRL-7--
	--------------------------------------
	--ID: self.rpg7
	--Class: Specialist
	--Value: 1
	--Magazine: 1
	--Ammo: 4
	--Fire Rate: 30
	--Damage: 12500
	--Acc: 100
	--Stab: 100
	--Conc: 15
	--Threat: 43
	--Pickup: 0.001, 0.001
	--Notes: Area Damage, Improv Expert Aced
	--NOTE: The HRL-7 does not have an active Ammo Pickup without Improv Expert Aced.
	--Active Mods:
	--------------------------------------
				--Commando 101--
	--------------------------------------
	--ID: self.ray
	--Class: Specialist
	--Value: 1
	--Magazine: 4
	--Ammo: 4
	--Fire Rate: 60
	--Damage: 12500
	--Acc: 100
	--Stab: 100
	--Conc: 0
	--Threat: 43
	--Pickup: 0.001, 0.001
	--Notes: Area Damage, Improv Expert Aced
	--NOTE: The Commando 101 does not have an active Ammo Pickup without Improv Expert Aced.
	--Active Mods:

	--------------------------------------
	--OVE9000 Saw--
	--------------------------------------			
	--ID: self.saw
	--Class: Saw
	--Value: 1
	--Magazine: 150
	--Ammo: 300
	--Fire Rate: 400
	--Damage: 80
	--Acc: 100
	--Stab: 100
	--Conc: 20
	--Threat: 43
	--Pickup: 0, 0
	--Notes: Armor Piercing, Handyman Aced
	--NOTE: The hitbox is being moved to the middle of the screen. Rejoice!
	-- No longer has a hidden damage bonus to Dozers.
	-- The OVE9000 Saw is not available as a Secondary weapon without Handyman Aced.
	--Active Mods: Silent Motor [wpn_fps_saw_body_silent] [-200 Fire Rate, +10 Concealment, Reduced noise radius (base game mechanic)] Value: 1

	--Fast Motor [wpn_fps_saw_body_speed] [-20 Concealment, +400 Fire Rate] Value: 1

	--Durable Blade [wpn_fps_saw_m_blade_durable] [-40 Damage, +50 Magazine Size, +100 Ammo Stock] Value: 1

	--Sharp Blade [wpn_fps_saw_m_blade_sharp] [+20 Damage, +100 Magazine Size, -200 Ammo Stock] Value: 1

	--------------------------------------
	--Shared Attachments--
	--------------------------------------

	--auto and singlefire mods
	self.parts.wpn_fps_upg_i_singlefire.stats = {value = 5}
	self.parts.wpn_fps_upg_i_singlefire.supported = true
	
	self.parts.wpn_fps_upg_i_autofire.stats = {value = 8}
	self.parts.wpn_fps_upg_i_autofire.supported = true

	--Barrel extension stat changes begin here.
	-- Shh! Suppressor		
		self.parts.wpn_fps_upg_ns_sho_salvo_large.stats = {value = 7, spread = 5, suppression = 72, alert_size = 12}
		self.parts.wpn_fps_upg_ns_sho_salvo_large.custom_stats = {damage_near_mul = 1.2}
		self.parts.wpn_fps_upg_ns_sho_salvo_large.supported = true
		self.parts.wpn_fps_upg_ns_sho_salvo_large.subclass_modifiers = {
			"subclass_quiet"
		}
	-- Silent Killer Suppressor		
		self.parts.wpn_fps_upg_ns_shot_thick.stats = {value = 7, spread = -5, suppression = 72, alert_size = 12}
		self.parts.wpn_fps_upg_ns_shot_thick.supported = true
		self.parts.wpn_fps_upg_ns_shot_thick.subclass_modifiers = {
			"subclass_quiet"
		}
	-- King's Crown Compensator		
		self.parts.wpn_fps_upg_shot_ns_king.stats = {value = 5, spread = 5}
		self.parts.wpn_fps_upg_shot_ns_king.custom_stats = {damage_near_mul = 1.2}
		self.parts.wpn_fps_upg_shot_ns_king.supported = true
	-- Shark Teeth Nozzle		
		self.parts.wpn_fps_upg_ns_shot_shark.stats = {value = 5, spread = -5}
		self.parts.wpn_fps_upg_ns_shot_shark.supported = true
	-- Donald's Horizontal Leveller		
		self.parts.wpn_fps_upg_ns_duck.stats = {value = 1, spread_multi = {2.25, 0.5}}
		self.parts.wpn_fps_upg_ns_duck.forbids = {
			"wpn_fps_upg_a_explosive",
			"wpn_fps_upg_a_slug",
			"wpn_fps_upg_a_dragons_breath"
		}
		self.parts.wpn_fps_upg_ns_duck.supported = true
	-- Ported Compensator	
		self.parts.wpn_fps_upg_ass_ns_battle.stats = {value = 1}
		self.parts.wpn_fps_upg_ass_ns_battle.supported = true
	-- Stubby Compensator
		self.parts.wpn_fps_upg_ns_ass_smg_stubby.stats = {value = 3}
		self.parts.wpn_fps_upg_ns_ass_smg_stubby.supported = true
	-- The Tank Compensator
		self.parts.wpn_fps_upg_ns_ass_smg_tank.stats = {value = 4}
		self.parts.wpn_fps_upg_ns_ass_smg_tank.supported = true
	-- Fire Breather Nozzle
		self.parts.wpn_fps_upg_ns_ass_smg_firepig.stats = {value = 5}
		self.parts.wpn_fps_upg_ns_ass_smg_firepig.supported = true
	-- Tactical Compensator
		self.parts.wpn_fps_upg_ass_ns_surefire.stats = {value = 5}
		self.parts.wpn_fps_upg_ass_ns_surefire.supported = true
	-- Funnel of Fun Nozzle
		self.parts.wpn_fps_upg_ass_ns_linear.stats = {value = 5}
		self.parts.wpn_fps_upg_ass_ns_linear.supported = true
	-- Competitor's Compensator
		self.parts.wpn_fps_upg_ass_ns_jprifles.stats = {value = 5}
		self.parts.wpn_fps_upg_ass_ns_jprifles.supported = true
	-- Medium Suppressor
		self.parts.wpn_fps_upg_ns_ass_smg_medium.stats = {suppression = 72, alert_size = 12, value = 2}
		self.parts.wpn_fps_upg_ns_ass_smg_medium.supported = true
		self.parts.wpn_fps_upg_ns_ass_smg_medium.subclass_modifiers = {
			"subclass_quiet"
		}
	-- Low Profile Suppressor
		self.parts.wpn_fps_upg_ns_ass_smg_small.stats = {suppression = 72, alert_size = 12, value = 2}
		self.parts.wpn_fps_upg_ns_ass_smg_small.subclass_modifiers = {
			"subclass_quiet"
		}
	-- The Bigger the Better Suppressor
		self.parts.wpn_fps_upg_ns_ass_smg_large.stats = {suppression = 72, alert_size = 12, value = 5}
		self.parts.wpn_fps_upg_ns_ass_smg_large.subclass_modifiers = {
			"subclass_quiet"
		}
		self.parts.wpn_fps_upg_ns_ass_smg_large.supported = true
	-- Hurricane Compensator -- name is tentative due to limited documentation of cartel optics pack files
		self.parts.wpn_fps_upg_ns_pis_typhoon.stats = {value = 4}
		self.parts.wpn_fps_upg_ns_pis_typhoon.supported = true
	-- Marmon Compensator -- name is tentative due to limited documentation of cartel optics pack files
		self.parts.wpn_fps_upg_ns_ass_smg_v6.stats = {value = 3}
		self.parts.wpn_fps_upg_ns_ass_smg_v6.supported = true
	-- Jungle Ninja Suppressor
		self.parts.wpn_fps_upg_ns_pis_jungle.stats = {suppression = 72,	alert_size = 12, value = 5}
		self.parts.wpn_fps_upg_ns_pis_jungle.supported = true
		self.parts.wpn_fps_upg_ns_pis_jungle.subclass_modifiers = {
			"subclass_quiet"
		}											
	-- Budget Suppressor
		self.parts.wpn_fps_upg_ns_ass_filter.stats = {suppression = 72,	alert_size = 12, value = 0} -- yes, value correct
		self.parts.wpn_fps_upg_ns_ass_filter.supported = true
		self.parts.wpn_fps_upg_ns_ass_filter.subclass_modifiers = {
			"subclass_quiet"
		}									
	-- Asepsis Suppressor
		self.parts.wpn_fps_upg_ns_pis_medium_slim.stats = {suppression = 72, alert_size = 12, value = 1}
		self.parts.wpn_fps_upg_ns_pis_medium_slim.supported = true
		self.parts.wpn_fps_upg_ns_pis_medium_slim.subclass_modifiers = {
			"subclass_quiet"
		}
	-- Monolith Suppressor
		self.parts.wpn_fps_upg_ns_pis_large.stats = {suppression = 72, alert_size = 12, value = 5}
		self.parts.wpn_fps_upg_ns_pis_large.supported = true
		self.parts.wpn_fps_upg_ns_pis_large.subclass_modifiers = {
			"subclass_quiet"
		}
	-- Champion's Suppressor
		self.parts.wpn_fps_upg_ns_pis_large_kac.stats = {suppression = 72, alert_size = 12, value = 6}
		self.parts.wpn_fps_upg_ns_pis_large_kac.supported = true
		self.parts.wpn_fps_upg_ns_pis_large_kac.subclass_modifiers = {
			"subclass_quiet"
		}
	-- Size Doesn't Matter Suppressor
		self.parts.wpn_fps_upg_ns_pis_small.stats = {suppression = 72, alert_size = 12, value = 3}
		self.parts.wpn_fps_upg_ns_pis_small.supported = true
		self.parts.wpn_fps_upg_ns_pis_small.subclass_modifiers = {
			"subclass_quiet"
		}
	-- Flash Hider
		self.parts.wpn_fps_upg_pis_ns_flash.stats = {suppression = 72, alert_size = 12, value = 4}
		self.parts.wpn_fps_upg_pis_ns_flash.supported = true
		
	-- Facepunch Compensator -- NOTE consider name change for Knockout
		self.parts.wpn_fps_upg_ns_pis_meatgrinder.stats = {suppression = 72, alert_size = 12, value = 7}
	-- IPSC Compensator
		self.parts.wpn_fps_upg_ns_pis_ipsccomp.stats = {suppression = 72, alert_size = 12, value = 4}
		self.parts.wpn_fps_upg_ns_pis_ipsccomp.supported = true
		
	-- Standard Issue Suppressor
		self.parts.wpn_fps_upg_ns_pis_medium.stats = {suppression = 72, alert_size = 12, value = 1}
		self.parts.wpn_fps_upg_ns_pis_medium.supported = true
		self.parts.wpn_fps_upg_ns_pis_medium.subclass_modifiers = {
			"subclass_quiet"
		}
		
	-- Roctec Suppressor
		self.parts.wpn_fps_upg_ns_pis_medium_gem.stats = {suppression = 72, alert_size = 12, value = 4}
		self.parts.wpn_fps_upg_ns_pis_medium_gem.supported = true
		self.parts.wpn_fps_upg_ns_pis_medium_gem.subclass_modifiers = {
			"subclass_quiet"
		}
	
	-- PBS Suppressor
		self.parts.wpn_fps_upg_ns_ass_pbs1.stats = {suppression = 72, alert_size = 12, value = 6}
		self.parts.wpn_fps_upg_ns_ass_pbs1.subclass_modifiers = {
			"subclass_quiet"
		}
	
	-- HPS Suppressor (Kross Vertex Submachine Gun)
		self.parts.wpn_fps_smg_polymer_ns_silencer.stats = {suppression = 72, alert_size = 12, value = 6}
		self.parts.wpn_fps_smg_polymer_ns_silencer.subclass_modifiers = {
			"subclass_quiet"
		}
		
	-- Werbell's Suppressor (Jacket's Piece Submachine Gun)
		self.parts.wpn_fps_smg_cobray_ns_silencer.stats = {suppression = 72, alert_size = 12, value = 6}
		self.parts.wpn_fps_smg_cobray_ns_silencer.subclass_modifiers = {
			"subclass_quiet"
		}
		
	-- Tishina Suppressor (Heather Submachine Gun)
		self.parts.wpn_fps_smg_sr2_ns_silencer.stats = {suppression = 72, alert_size = 12, value = 6}
		self.parts.wpn_fps_smg_sr2_ns_silencer.subclass_modifiers = {
			"subclass_quiet"
		}
		
	-- Suppressor (Cobra Submachinegun)
		self.parts.wpn_fps_smg_scorpion_b_suppressed.stats = {suppression = 72, alert_size = 12, value = 6}
		self.parts.wpn_fps_smg_scorpion_b_suppressed.subclass_modifiers = {
			"subclass_quiet"
		}
	
	-- Silentgear Silencer (Jackal Submachinegun)
		self.parts.wpn_fps_smg_schakal_ns_silencer.stats = {suppression = 72, alert_size = 12, value = 6}
		self.parts.wpn_fps_smg_schakal_ns_silencer.subclass_modifiers = {
			"subclass_quiet"
		}
	
	--Sight stat changes begin here.
	-- Milspec Scope
		self.parts.wpn_fps_upg_o_specter.stats = {zoom = 4, value = 8} -- i should probably write it like this for the rest of the attachments
		self.parts.wpn_fps_upg_o_specter.supported = true
	-- Military Red Dot Sight 
		self.parts.wpn_fps_upg_o_aimpoint.stats = {zoom = 4, value = 8}
		self.parts.wpn_fps_upg_o_aimpoint.supported = true
	-- Military Red Dot Sight -- NOTE this is the preorder edition.
		self.parts.wpn_fps_upg_o_aimpoint_2.stats = {zoom = 4, value = 1}
		self.parts.wpn_fps_upg_o_aimpoint_2.supported = true
	-- Surgeon Sight
		self.parts.wpn_fps_upg_o_docter.stats = {zoom = 2, value = 5}
		self.parts.wpn_fps_upg_o_docter.supported = true
	-- Holographic Sight
		self.parts.wpn_fps_upg_o_eotech.stats = {zoom = 3, value = 3}
		self.parts.wpn_fps_upg_o_eotech.supported = true
	-- The Professional's Choice Sight
		self.parts.wpn_fps_upg_o_t1micro.stats = {zoom = 3, value = 3}
		self.parts.wpn_fps_upg_o_t1micro.supported = true
	-- Marksman Sight
		self.parts.wpn_upg_o_marksmansight_rear.stats = {zoom = 2, value = 5}
		self.parts.wpn_upg_o_marksmansight_rear.supported = true
	-- Theia Magnified Scope
		self.parts.wpn_fps_upg_o_leupold.stats = {zoom = 10, value = 8}
		self.parts.wpn_fps_upg_o_leupold.supported = true
	-- See More Sight
		self.parts.wpn_fps_upg_o_cmore.stats = {zoom = 3, value = 5}
		self.parts.wpn_fps_upg_o_cmore.supported = true
	-- Acough Optic Scope
		self.parts.wpn_fps_upg_o_acog.stats = {zoom = 6, value = 6}
		self.parts.wpn_fps_upg_o_acog.supported = true
	-- Combat Sight
		self.parts.wpn_fps_upg_o_cs.stats = {zoom = 4, value = 3}
		self.parts.wpn_fps_upg_o_cs.supported = true
	-- Speculator Sight
		self.parts.wpn_fps_upg_o_reflex.stats = {zoom = 3, value = 5}
		self.parts.wpn_fps_upg_o_reflex.supported = true
	-- Trigonom Sight
		self.parts.wpn_fps_upg_o_rx01.stats = {zoom = 3, value = 5}
		self.parts.wpn_fps_upg_o_rx01.supported = true
	-- Compact Holosight
		self.parts.wpn_fps_upg_o_eotech_xps.stats = {zoom = 3, value = 5}
		self.parts.wpn_fps_upg_o_eotech_xps.supported = true
	-- Advanced Combat Sight
		self.parts.wpn_fps_upg_o_bmg.stats = {zoom = 6, value = 8}
		self.parts.wpn_fps_upg_o_bmg.supported = true
	-- Maelstrom Sight
		self.parts.wpn_fps_upg_o_uh.stats = {zoom = 3, value = 5}
		self.parts.wpn_fps_upg_o_uh.supported = true
	-- Compact Profile Sight
		self.parts.wpn_fps_upg_o_fc1.stats = {zoom = 3, value = 5}
		self.parts.wpn_fps_upg_o_fc1.supported = true
	-- SKOLD Reflex Micro Sight -- name is tentative due to limited documentation of cartel optics pack files (what of rmr?)
		self.parts.wpn_fps_upg_o_rms.stats = {zoom = 3, value = 6}
		self.parts.wpn_fps_upg_o_rms.supported = true
	-- Riktpunkt Holosight -- name is tentative due to limited documentation of cartel optics pack files
		self.parts.wpn_fps_upg_o_rikt.stats = {zoom = 3, value = 6}
		self.parts.wpn_fps_upg_o_rikt.supported = true
	
	-- Magazine stat changes begin here.
		-- Milspec Magazine
		self.parts.wpn_fps_m4_uupg_m_std.stats = {value = 1}
		self.parts.wpn_fps_m4_uupg_m_std.supported = true
		-- L5 Magazine
		self.parts.wpn_fps_upg_m4_m_l5.stats = {value = 1}
		self.parts.wpn_fps_upg_m4_m_l5.supported = true
		-- Tactical Magazine
		self.parts.wpn_fps_upg_m4_m_pmag.stats = {value = 3}
		self.parts.wpn_fps_upg_m4_m_pmag.supported = true
		-- Expert Magazine
		self.parts.wpn_fps_ass_l85a2_m_emag.stats = {value = 1}
		self.parts.wpn_fps_ass_l85a2_m_emag.supported = true
		-- CAR Quadstacked Magazine [wpn_fps_upg_m4_m_quad] Value: 3
		self.parts.wpn_fps_upg_m4_m_quad.stats = {
			value = 3,		-- note wiki value incorrect
			extra_ammo = 30, 
			concealment = -10
		}
		self.parts.wpn_fps_upg_m4_m_quad.supported = true
		
		
		-- Vintage Mag. [wpn_fps_upg_m4_m_straight] Value: 2
		self.parts.wpn_fps_upg_m4_m_straight.stats = {	
			value = 2,		
			extra_ammo = -10, 
			concealment = 5
		}	
		self.parts.wpn_fps_upg_m4_m_straight.supported = true
		-- Speedpull Magazine
		self.parts.wpn_fps_m4_upg_m_quick.stats = {
			value = 2,		
			reload = 10,
			concealment = -4
		}
		self.parts.wpn_fps_m4_upg_m_quick.supported = true
	--Gadget stat changes begin here.
		-- Flashlight
		self.parts.wpn_fps_upg_fl_ass_smg_sho_surefire.stats = {value = 3}
		self.parts.wpn_fps_upg_fl_ass_smg_sho_surefire.supported = true
		-- Tactical Laser										
		self.parts.wpn_fps_upg_fl_ass_smg_sho_peqbox.stats = {value = 5}
		self.parts.wpn_fps_upg_fl_ass_smg_sho_peqbox.supported = true
		-- Compact Laser								
		self.parts.wpn_fps_upg_fl_ass_laser.stats = {value = 2}	
		self.parts.wpn_fps_upg_fl_ass_laser.supported = true
		-- Military Laser						
		self.parts.wpn_fps_upg_fl_ass_peq15.stats = {value = 5}	-- check vs wpn_fps_upg_fl_ass_peq15_flashlight
		self.parts.wpn_fps_upg_fl_ass_peq15.supported = true
		-- LED Combo						
		self.parts.wpn_fps_upg_fl_ass_utg.stats = {value = 5}	
		self.parts.wpn_fps_upg_fl_ass_utg.supported = true
		-- Tactical Pistol Light						
		self.parts.wpn_fps_upg_fl_pis_tlr1.stats = {value = 2}	
		self.parts.wpn_fps_upg_fl_pis_tlr1.supported = true
		-- Pocket Laser						
		self.parts.wpn_fps_upg_fl_pis_laser.stats = {value = 5}	
		self.parts.wpn_fps_upg_fl_pis_laser.supported = true
		-- Combined Module
		self.parts.wpn_fps_upg_fl_pis_x400v.stats = {value = 5}	
		self.parts.wpn_fps_upg_fl_pis_x400v.supported = true
		-- Polymer Flashlight
		self.parts.wpn_fps_upg_fl_pis_m3x.stats = {value = 1}	
		self.parts.wpn_fps_upg_fl_pis_m3x.supported = true
		-- Micro Laser						
		self.parts.wpn_fps_upg_fl_pis_crimson.stats = {value = 5}	
		self.parts.wpn_fps_upg_fl_pis_crimson.supported = true
		-- 45 Degree Red Dot Sight				
		self.parts.wpn_fps_upg_o_45rds.stats = {value = 1, gadget_zoom = 1}	
		self.parts.wpn_fps_upg_o_45rds.supported = true
		-- Riktpunkt 45 Degree Sight
		self.parts.wpn_fps_upg_o_45rds_v2.stats = {value = 1, gadget_zoom = 1}	
		self.parts.wpn_fps_upg_o_45rds_v2.supported = true
		-- Riktpunkt Magnifier
		self.parts.wpn_fps_upg_o_xpsg33_magnifier.stats = {value = 1, gadget_zoom = 9}
		self.parts.wpn_fps_upg_o_xpsg33_magnifier.supported = true
		-- Signature Magnifier
		self.parts.wpn_fps_upg_o_sig.stats = {value = 2, gadget_zoom = 9}
		self.parts.wpn_fps_upg_o_sig.supported = true
		-- 45 Degree Ironsights
		self.parts.wpn_fps_upg_o_45steel.stats = {value = 1, gadget_zoom = 1}	
		self.parts.wpn_fps_upg_o_45steel.supported = true
	
	--Grip stat changes begin here.
		-- Pro Grip
		self.parts.wpn_fps_upg_m4_g_sniper.stats = {value = 6}
		self.parts.wpn_fps_upg_m4_g_sniper.supported = true
		-- Ergo Grip
		self.parts.wpn_fps_upg_m4_g_ergo.stats = {value = 2}	
		self.parts.wpn_fps_upg_m4_g_ergo.supported = true
		-- Rubber Grip
		self.parts.wpn_fps_upg_m4_g_hgrip.stats = {value = 2}	
		self.parts.wpn_fps_upg_m4_g_hgrip.supported = true
		-- Contractor Grip
		self.parts.wpn_fps_snp_tti_g_grippy.stats = {value = 1}
		self.parts.wpn_fps_snp_tti_g_grippy.supported = true
		-- Short Grip
		self.parts.wpn_fps_upg_m4_g_mgrip.stats = {value = 2}	
		self.parts.wpn_fps_upg_m4_g_mgrip.supported = true
		-- Titanium Skeleton Grip
		self.parts.wpn_fps_upg_g_m4_surgeon.stats = {value = 1}	
		self.parts.wpn_fps_upg_g_m4_surgeon.supported = true

	--Stock stat changes begin here.
		--Tactical Stock
		self.parts.wpn_fps_upg_m4_s_pts.stats = {value = 3}
		self.parts.wpn_fps_upg_m4_s_pts.supported = true
		--Folding stock
		self.parts.wpn_fps_m4_uupg_s_fold.stats = {value = 5}
		self.parts.wpn_fps_m4_uupg_s_fold.supported = true
		-- Crane Stock
		self.parts.wpn_fps_upg_m4_s_crane.stats = {value = 2}
		self.parts.wpn_fps_upg_m4_s_crane.supported = true
		-- 2 Piece Stock
		self.parts.wpn_fps_upg_m4_s_ubr.stats = {value = 1}
		self.parts.wpn_fps_upg_m4_s_ubr.supported = true
		-- Contractor stock
		self.parts.wpn_fps_snp_tti_s_vltor.stats = {value = 1}		
		self.parts.wpn_fps_snp_tti_s_vltor.supported = true
		-- War Torn stock
		self.parts.wpn_fps_upg_m4_s_mk46.stats = {value = 6}	
		self.parts.wpn_fps_upg_m4_s_mk46.supported = true
			
	--Upper/Lower Receiver stat changes begin here.
		-- exotique receiver
		self.parts.wpn_fps_m4_upper_reciever_edge.stats = {value = 3}	
		self.parts.wpn_fps_m4_upper_reciever_edge.supported = true
		-- lw upper receiver
		self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.stats = {value = 1}	
		self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.supported = true
		-- thrust upper receiver
		self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.stats = {value = 1}
		self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.supported = true
		-- thrust lower receiver
		self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.stats = {value = 1}	
		self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.supported = true

	--Shotgun ammo type stat changes begin here.
		-- flechette rounds
		self.parts.wpn_fps_upg_a_piercing.stats = {value = 5, spread = 5}	
		self.parts.wpn_fps_upg_a_piercing.custom_stats = {
				damage_near_mul = 1.2 --not sure about these. might need to modify shotgunbase
		}
		self.parts.wpn_fps_upg_a_piercing.supported = true
		-- dragon's breath rounds (muzzleflash and actual hitbox/cone stuff ain't done)
		self.parts.wpn_fps_upg_a_dragons_breath.stats = {value = 5}			
		self.parts.wpn_fps_upg_a_dragons_breath.custom_stats = {
			ignore_statistic = true,
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
			can_shoot_through_shield = true,
			can_shoot_through_enemy = true,
			armor_piercing_add = 1,			
			damage_far_mul = 0.1333333333333333,
			damage_near_mul = 0.2,
			bullet_class = "FlameBulletBase",
			rays = 12,
			fire_dot_data = {
				dot_trigger_chance = "100",
				dot_damage = "10",
				dot_length = "3.1",
				dot_trigger_max_distance = "400",
				dot_tick_period = "0.5"
			}
		}
		self.parts.wpn_fps_upg_a_dragons_breath.supported = true
		-- he slugs
		self.parts.wpn_fps_upg_a_explosive.stats = {value = 5, spread = 5}			
		self.parts.wpn_fps_upg_a_explosive.custom_stats = {
				ignore_statistic = true,
				damage_far_mul = 999999999,	--as shit as this is this should theoretically work
				damage_near_mul = 999999999,
				bullet_class = "InstantExplosiveBulletBase",
				rays = 1
		}
		self.parts.wpn_fps_upg_a_explosive.supported = true
		-- ap slugs
		self.parts.wpn_fps_upg_a_slug.stats = {value = 5, spread = 5, damage = 30}	
		self.parts.wpn_fps_upg_a_slug.custom_stats = {
				damage_near_mul = 999999999,
				damage_far_mul = 999999999, 
				rays = 1,				
				armor_piercing_add = 1,
				can_shoot_through_enemy = false,
				can_shoot_through_shield = true,
				can_shoot_through_wall = true,
		}
		self.parts.wpn_fps_upg_a_slug.supported = true
		-- 000 buck
		self.parts.wpn_fps_upg_a_custom.stats = {value = 3, spread = -5}	
		self.parts.wpn_fps_upg_a_custom.supported = true
		-- community 000 buck
		self.parts.wpn_fps_upg_a_custom_free.stats = {value = 3}	
		self.parts.wpn_fps_upg_a_custom_free.custom_stats = {rays = 6}	
		self.parts.wpn_fps_upg_a_custom_free.name_id = "bm_wp_upg_a_custom_free"	
		self.parts.wpn_fps_upg_a_custom_free.desc_id = "bm_wp_upg_a_custom_free_desc"	
		self.parts.wpn_fps_upg_a_custom_free.supported = true
		
	end
end)

--Removes all weapon mod stats from weapon mods without the .supported flag.
--Has patchy support for custom weapons, but generally works on all vanilla stuff to my knowledge.
Hooks:PostHook( WeaponFactoryTweakData, "create_bonuses", "strip_mod_stats", function(self)
	if deathvox:IsTotalCrackdownEnabled() then
		for _, part in pairs(self.parts) do
			if not part.supported and part.stats then
				--Logs for debugging. Remove if wanted for slightly better performance in loading screens.
				if part.name_id then
--					log("Removing stats from: " .. part.name_id)
				else
--					log("Removing stats from: Unknown Mod")
				end
				
				local alert_size
				if (part.sub_type == "silencer") or (part.perks and table.contains(part.perks,"silencer")) then 
					alert_size = part.stats.alert_size or 12
				end
				
				--Preserve cosmetic part stats.
				part.stats = {
					value = part.stats.value,
					zoom = part.stats.zoom,
					gadget_zoom = part.stats.gadget_zoom,
					alert_size = alert_size
				}
				part.custom_stats = nil
			end
		end
	end
end)