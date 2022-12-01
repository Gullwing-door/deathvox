Hooks:Add("LocalizationManagerPostInit", "DeathVox_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_risk_sm_wish"] = "크랙다운. 새로운 적과 궁극의 도전.",
		["menu_difficulty_sm_wish"] = "크랙다운",
		["hud_assault_generic_assault"] = "ASSAULT IN PROGRESS",
		["hud_assault_generic_cover"] = "STAY IN COVER",
		["hud_assault_cop_assault"] = "POLICE ASSAULT IN PROGRESS",
		["hud_assault_cop_cover"] = "STAY IN COVER",
		["hud_assault_fbi_assault"] = "FBI OFFENSIVE IS GO",
		["hud_assault_fbi_cover"] = "SEEK VIABLE SHELTER",
		["hud_assault_gensec_assault"] = "GENSEC CHARGE INITIATED",
		["hud_assault_gensec_cover"] = "REMAIN ALERT",
		["hud_assault_zeal_assault"] = "ZULU FORCE INBOUND",
		["hud_assault_zeal_cover"] = "TRY TO SURVIVE",
		["hud_assault_federales_assault"] = "FEDERAL POLICE ADVANCING",
		["hud_assault_federales_cover"] = "BRACE FOR IMPACT",
		["hud_assault_murkywater_assault"] = "MURKYWATER ASSAULT IN PROGRESS",
		["hud_assault_murkywater_cover"] = "STAND YOUR GROUND",
		["hud_assault_akan_assault"] = "Идёт штурм наёмников",
		["hud_assault_akan_cover"] = "Оставайтесь в укрытии",
		["hud_assault_classic_assault"] = "POLICE ASSAULT IN PROGRESS",
		["hud_assault_classic_cover"] = "STAY IN COVER",
		["hud_assault_zombie_assault"] = "I SEE YOU",
		["hud_assault_zombie_cover"] = "NO ESCAPE NO ESCAPE NO ESCAPE",
		["hud_assault_gsg9_assault"] = "POLIZEIVORSTOẞ IM GANGE",
		["hud_assault_gsg9_cover"]	= "IN DECKUNG BLEIBEN",
		
		["cdmenu_staticrecoil"] = "스태딕 반동",
		["cdmenu_staticrecoil_help"] = "자동 반동 보정을 비활성화하여 사격을 중지한 후 조준을 조정하기 위해서는 마우스를 수동으로 아래로 당겨야 합니다.",
		["cdmenu_holdtofire"] = "발사 키를 꾹 눌러 단발 무기 사격",
		["cdmenu_holdtofire_help"] = "플레이어가 발사 버튼을 이용하여 최대 발사 속도로 단일 사격 무기를 발사할 수 있습니다.",
	})
		
	local group_type = tweak_data.levels:get_ai_group_type()
	local federales = tweak_data.levels.ai_groups.federales
	local level = Global.level_data and Global.level_data.level_id

	if group_type == federales then
		loc:load_localization_file(ModPath .. "loc/federalesnames_ko.txt")
	elseif level == "pex" or level == "skm_bex" or level == "bex" then --forcefully load beat cop and hrt names on these levels so that they dont get overridden by cd diff killfeed/hoplib/whatever
		-- log("head keeps spinnin")
		loc:load_localization_file(ModPath .. "loc/federalespersistentnames_ko.txt")
	end
	
	if group_type == murkywater then
		loc:load_localization_file(ModPath .. "loc/murkynames_ko.txt")
	elseif level == "bph" or level == "vit" or level == "des" or level == "pbr" then 
		loc:load_localization_file(ModPath .. "loc/murkypersistentnames_ko.txt")
	end	
	
end)

Hooks:Add("LocalizationManagerPostInit", "DeathVox_Overhaul", function(loc)
	if deathvox then
		if deathvox:IsTotalCrackdownEnabled() then
			local weapon_class_icon_data = {
				heavy = {
					character = "─",
					macro = "$ICN_HVY",
				},
				grenade = {
					character = "┼",
					macro = "$ICN_GRN"
				},
				area_denial = {
					character = "═",
					macro = "$ICN_ARD"
				},
				throwing = {
					character = "╤",
					macro = "$ICN_THR"
				},
				specialist = {
					character = "╥",
					macro = "$ICN_SPC"
				},
				shotgun = {
					character = "╦",
					macro = "$ICN_SHO"
				},
				saw = {
					character = "╧",
					macro = "$ICN_SAW"
				},
				rapidfire = {
					character = "╨",
					macro = "$ICN_RPF"
				},
				quiet = {
					character = "╩",
					macro = "$ICN_QUT"
				},
				precision = {
					character = "╪",
					macro = "$ICN_PRE"
				},
				poison = {
					character = "╫",
					macro = "$ICN_POI"
				},
				melee = {
					character = "╬",
					macro = "$ICN_MEL"
				}
			}

			--bit of extra overhead here for tcd icons
			LocalizationManager._orig_text = LocalizationManager.text
			function LocalizationManager:text(...)
				local result = {self:_orig_text(...)}
				for class_id,weapon_icon_data in pairs(weapon_class_icon_data) do 
					if result[1] and weapon_icon_data and weapon_icon_data.macro then 
						result[1] = string.gsub(result[1],weapon_icon_data.macro,weapon_icon_data.character)
					end
				end
				return unpack(result)
			end
			
			
--			local interact_keybind = utf8.to_upper(loc:btn_macro("use_item")) 
--			local grenade_keybind = utf8.to_upper(loc:btn_macro("throw_grenade")) 
--apparently keybind macros aren't active in the throwables descriptions, but also controllermanager isn't initialized in time for this
			
			local cursed_error = "oopsie whoopsie!\nuwu\nwe made a fucky wucky!!1 a wittle fucko boingo! the code monkies at our headquarters are working VEWY HAWD to fix this!" --preliminary research suggests that using this as an localization error string will make users 4206.9% more likely to report normally insignificant minor localization errors. i apologize for nothing. -offy
			--i did not spot this earlier and i can say with 100% certainty that you have nothing to apologize for, offy <3
			
			
			loc:add_localized_strings({
				cursed_error = cursed_error,
				debug_interact_gage_assignment_take = "$BTN_INTERACT 키를 눌러 패키지를 얻기",
				--weapon stuff
				
				--shotgun ammo
				bm_wp_upg_a_custom_free = "아이언 헨드 벅샷",
				bm_wp_upg_a_custom_free_desc = "적을 공격하는 모든 펠릿이 개별 피해를 입히고 피해가 중첩되도록 합니다 그 대신 펠릿 수가 반으로 감소합니다.",
				
				bm_wp_striker_b_long_achievment = "000 벅샷 또는 아이언 헨드 벅샷을 사용하는 산탄총으로 불도저 ##$progress##명을 더 처치하십시오.", --not sure if this actually will display progress 
			
				--skilltree sub-tree names
				st_menu_dallas_taskmaster = "태스크마스터",
				st_menu_dallas_marksman = "지정사수",
				st_menu_dallas_medic = "의무병",
				st_menu_chains_chief = "두목",
				st_menu_chains_enforcer = "인포서",
				st_menu_chains_heavy = "헤비",
				st_menu_wolf_runner = "러너",
				st_menu_wolf_gunner = "총잡이",
				st_menu_wolf_engineer = "공병",
				st_menu_houston_thief = "도둑",
				st_menu_houston_assassin = "암살자",
				st_menu_houston_sapper = "교란자",
				st_menu_hoxton_dealer = "딜러",
				st_menu_hoxton_fixer = "해결사",
				st_menu_hoxton_demolitionist = "폭파 전문가",
			
			--deployable equipment
				hud_int_equipment_sensor_mode_trip_mine = "$BTN_INTERACT 키를 눌러 트립 마인 수정하기",
				hud_int_equipment_normal_mode_trip_mine = "$BTN_INTERACT 키를 눌러 트립 마인 수정하기",
				debug_interact_trip_mine = cursed_error,
				tripmine_payload_explosive = "폭발",
				tripmine_payload_incendiary = "소이",
				tripmine_payload_concussive = "충격",
				tripmine_payload_sensor = "센서 모드",
				tripmine_trigger_detonate = "지금 폭파",
				tripmine_trigger_special = "특수 적만",
				tripmine_trigger_default = "모두 감지",
				tripmine_payload_recover = "트립마인 회수",
				sentry_mode_standard = "기본 모드",
				sentry_mode_overwatch = "감시 모드",
				sentry_mode_manual = "수동 모드",
				sentry_ammo_ap = "철갑탄",
				sentry_ammo_he = "폭발탄",
				sentry_ammo_taser = "테이저 탄",
				sentry_ammo_standard = "기본 탄",
				sentry_retrieve = "회수",
				
				hud_deploy_valid_help = "잘못된 조준 위치",
				
				hud_interact_edit_sentry_gun = "$BTN_INTERACT 키를 꾹 눌러 센트리 모드 바꾸기",
				hud_action_editing_sentry_gun = "센트리 모드 바꾸는 중...", --not used
				hud_interact_pickup_sentry_gun = "$BTN_INTERACT 키를 꾹 눌러 센트리 회수",
				debug_interact_armor_plates_take = "$BTN_INTERACT 키를 꾹 눌러 장갑판 가져가기",
				hud_equipment_equipping_armor_kit = "장갑판 배치 중...",
				hint_hud_already_has_armor_plates = "당신은 이미 장갑판을 가지고 있습니다!",
				hud_action_taking_armor_plates = "장갑판 가져가는 중...",
				menu_equipment_armor_kit = "장갑판",
				bm_equipment_armor_kit = "장갑판 가방",
				bm_equipment_armor_kit_desc = "고급 충격 저항 장갑은 대미지 저항을 +15%만큼 제공하고 사용자가 즉시 구금되기 전에 추가로 한 번 더 다운될 수 있게 만듭니다. 사용하려면 적당한 표면에 $BTN_USE_ITEM 키를 꾹 눌러 배치하고 $BTN_INTERACT 키를 눌러 장착합니다.\n\n배치된 장갑판 가방은 사라지기 전에 4번만 사용할 수 있습니다. 나머지 갯수는 가방 내에서 볼 수 있습니다.",
				bm_equipment_ammo_bag_desc = "배치 가능한 탄약 컨테이너는 소모된 탄약을 재충전하고 탄약을 모두 사용한 후에도 소지자의 탄약 재고를 수동적으로 50% 증가시킵니다. 사용하려면 적당한 표면에 $BTN_USE_ITEM 키를 꾹 눌러 배치하고 $BTN_INTERACT 키를 눌러 탄약을 채웁니다.\n\n일단 배치되면 탄약 가방은 사라지기 전에 탄약을 4번만 완전히 채울 수 있습니다. 나머지 갯수는 가방 내에서 볼 수 있습니다.",
				bm_equipment_first_aid_kit_desc = "배치 가능한 일회용 치료기은 사용자의 체력을 완전히 회복시킵니다. 사용하려면 적당한 표면에 $BTN_USE_ITEM 키를 꾹 눌러 배치하고 $BTN_INTERACT 키를 눌러 회복합니다.\n\n구급 키트는 1.5미터 이내에 구급 키트를 배치하면 무력화된 팀원을 즉시 소생시키고 완전히 치료하는 데 사용할 수도 있습니다.",
				
				debug_silent_sentry_gun = "우정 목걸이",
				hud_deploying_friendship_collar = "$TARGET_UNIT 을(를) 전환중...",
				bm_equipment_sentry_gun_silent = "우정 목걸이",
				bm_equipment_sentry_gun_silent_desc = "특수하지 않은 적을 당신을 위해 싸울 수 있는 조커로 변환할 수 있는 \"협박용 장치\".\n(실제로 위험하지는 않지만 경찰에게는 알리지 마십시오.)\n\n적을 전환하려면 근접 공격 사거리에 들어가 그들을 조준하는 동안 $BTN_USE_ITEM 키를 꾹 누르고 있으면 수갑을 채운 제압된 적들이 즉시 전환됩니다. 조커는 50%의 피해 저항을 가지며 당신을 바짝 따라다니고 당신을 보호하기 위해 싸울 것입니다.\n\n한 번에 하나의 조커만 가질 수 있습니다. 조커는 인질로 간주되지 않습니다.",
				
				debug_trip_mine = "성형작약탄",
				bm_equipment_trip_mine = "성형작약탄",
				bm_equipment_trip_mine_desc = "성형작약탄은 특정 장애물을 파괴하거나 컨테이너를 열 수 있는 폭발성 도구입니다. 물체의 표시된 약점에 $BTN_INTERACT 키를 꾹 누르면 성형작약탄을 설치합니다.\n\n경고: 성형작약탄은 물체의 모든 약에 전부 설치된 경우에만 활성화됩니다.",
				hud_deploying_revive_fak = "$TARGET_UNIT 을(를) 되살리는 중...",
				
				hud_enemy_generic = "적",
				hud_teammate_generic = "팀워",
				
				bm_wpn_prj_four_desc = "$ICN_THR 3초 동안 0.5초당 150의 피해를 주는 $ICN_POI 독을 바른 투척 무기입니다. $ICN_POI 독 피해는 중첩될 수 있으며 대상을 무력화시킬 수 있습니다.",
				bm_wpn_prj_ace_desc = "$ICN_THR 200의 피해를 입히는 카드로 위장한 투척 무기입니다. 방탄복을 뚫을 수는 없지만 대량으로 가질 수 있습니다.",
				bm_wpn_prj_target_desc = "$ICN_THR 800의 피해를 입히는 투척 무기입니다.",
				bm_wpn_prj_hur_desc = "$ICN_THR 1,400 데미지를 입히고 방탄복을 관통할 수 있는 투척 무기입니다.",
				bm_wpn_prj_jav_desc = "$ICN_THR 4,000의 데미지를 입히고 방탄복을 절단할 수 있는 투척 무기입니다.",
				bm_grenade_frag_desc = "$ICN_GRN 반경 10m에서 300의 피해를 입히는 수류탄입니다.\n적이 폭발에 휘말리면 40% 확률로 치명적인 피해를 입힐 수 있습니다.",
				bm_grenade_frag_com_desc = "$ICN_GRN 반경 5m에서 1000의 피해를 입히는 수류탄입니다.",
				bm_dynamite_desc = "$ICN_GRN 반경 10m에 5000의 피해를 주는 수류탄입니다. 소량으로 가질 수 있습니다.",
				bm_grenade_dada_com_desc = "(변경 사항이 아직 구현되지 않음)\n\n$ICN_GRN 반경 2m에서 400개의 피해를 입힌 뒤 7개의 소형 수류탄들로 쪼개져 반경 2m에서 400개의 피해를 입히는 수류탄입니다.",
				bm_concussion_desc = "(변경 사항이 아직 구현되지 않음)\n\n$ICN_GRN 피해는 입히지 않지만 반경 8m 내의 적을 4초 동안 기절시키는 수류탄입니다.\n기절한 적은 기절한 후 5초 동안 명중률이 -50%만큼 감소합니다.",
				bm_grenade_molotov_desc = "(변경 사항이 아직 구현되지 않음)\n\n$ICN_GRN 15초 동안 반경 2.5m의 화염 웅덩이를 생성하여 0.5초마다 250(아군에게는 50)의 피해를 주는 수류탄입니다.",
				bm_grenade_fir_com_desc = "(변경 사항이 아직 구현되지 않음)\n\n$ICN_GRN 30초 동안 반경 1m의 화염 웅덩이를 생성하여 0.5초마다 250(아군에게는 50)의 피해를 주는 수류탄입니다.",
				
				bm_equipment_sentry_gun_desc = "사거리 내에 있는 적을 자동으로 공격하는 다중 발사 모드의 배치식 무기입니다. 센트리 건은 탄약이 무한하여 적한테 무시되지만, 사용 할 수록 열이 생성되고 센트리 건의 대미지가 점점 줄어듭니다.\n\n배치할려면 적당한 표면에 $BTN_USE_ITEM 키를 꾹 눌려합니다.\n\n레드날 메뉴를 열고 센트리를 구성하려면 $BTN_INTERACT 키를 꾹 누르고 레드날 메뉴를 엽니다. 옵션을 선택하려면 원하는 옵션을 체크 표시하고 $BTN_INTERACT 키를 눌러 활성화합니다.\n\n레드날 메뉴를 열면 현재의 모든 열이 방출됩니다.",
				
				debug_trip_mine_throwable = "트립 마인",
				bm_grenade_tripmine = "던질 수 있는 트립 마인",
				bm_grenade_tripmine_desc = "트립 마인은 다양한 기능과 트리거 유형을 가진 폭발성 부비 트랩입니다. 배치하려면 적절한 표면에서 투척물 던지는 키를 누릅니다. 배치된 트립마인을 수정하려면 보면서 $BTN_INTERACT 키를 누르면 레드날 메뉴가 열립니다.", --needs macros
				
				hud_deploying_tripmine_preview = "$EQUIPMENT 배치 준비 중",
				hud_sentry_gun_vent_heat = "$BTN_INTERACT 키를 꾹 눌러 센트리 건의 열을 방출",
				hud_action_sentry_gun_vent_heat = "센트리 건 방출 중...",
			--misc
				hud_int_pick_electronic_lock = "$BTN_INTERACT 키를 꾹 눌러 잠금 해킹하기",
				hud_action_picking_electronic_lock = "잠금 해킹 중...",
				
				hud_sociopath_combo_count = "%ix 콤보", --sociopath hud combo counter; "%i" represents the number of kills in the combo
				
			--skills:
				
			--taskmaster
				menu_zip_it = "압축",
				menu_zip_it_desc = "베이직: ##$basic##\n시민들은 ##당신이 내는 소음에 겁을 먹습니다.## 고함은 목표물로부터 ##10## 미터 이내에 있는 모든 민간인을 위협합니다.\n\n에이스: ##$pro##\n케이블 타이 소지량을 ##20##개로 늘립니다.",
				menu_pack_mules = "팩 뮬",
				menu_pack_mules_desc = "BASIC: ##$basic##\n팀의 시민 인질은 ##가방을 옮길 수 있습니다.##\n\n에이스: ##$pro##\n팀의 민간인 인질은 ##+20%만큼 빠르게## 이동합니다.",
				menu_stay_down = "가만히 있어",
				menu_stay_down_desc = "베이직: ##$basic##\n팀의 민간인은 ##누워 있는 동안에는 무적 상태입니다.##\n\n에이스: ##$pro##\n팀의 민간인 인질은 구출되어도 ##도망치지 않습니다.##",
				menu_lookout_duty = "망 보기",
				menu_lookout_duty_desc = "베이직: ##$basic##\n##10##미터 이내 팀의 인질 근처에 있는 적을 자동으로 마킹합니다.\n\n에이스: ##$pro##\n##10##미터 이내 팀의 인질 근처에 있는 적에게 모든 공격 유형로부터 ##+10%##만큼의 피해를 입힙니다.",
				menu_leverage = "영향력",
				menu_leverage_desc = "베이직: ##$basic##\n팀의 인질은 ##0.25#m 이내에 있는 팀원에게 데미지 저항력을 ##+10%##만큼 부여합니다.\n\n에이스: ##$pro##\n팀의 인질은 ##5##m 이내에 있는 팀원에게 데미지 저항력을 ##+10%##만큼 부여하며, 팀원이 ##0.25#m 이내에 있을 때 효과를 최대 ##+20%#까지 쌓을 수 있습니다.",
				menu_false_idol = "거짓된 우상",
				menu_false_idol_desc = "베이직: ##$basic##\n팀의 인질이 거래되면 ##구금된 모든 팀원을 풀어줍니다##.\n\n한 번에 최대 ##2##명의 시민 인질이 당신을 따라갈 수 있습니다.\n\n에이스: ##$pro##\n각 팀의 인질은 거래될 때 ##거짓 항복을 한 번하여##, 자수하지 않고 팀원을 구금에서 풀어줍니다.\n\n한 번에 최대 ##3##명의 시민 인질이 당신을 따라갈 수 있습니다.",
				
			--marksman
				menu_point_and_click = "포인트 앤 클릭",
				menu_point_and_click_desc = "베이직: ##$basic##\n$ICN_PRE 정밀 무기는 킬당 데미지를 ##+0.5%##만큼 얻으며 최대 ##250%##까지 얻을 수 있습니다. 빗나갈 시 모든 중첩이 사라집니다.\n\n에이스: ##$pro##\n$ICN_PRE 정밀 무기의 조준 속도가 ##90%##만큼 빨라집니다.",
				menu_tap_the_trigger = "트리거 누르기",
				menu_tap_the_trigger_desc = "베이직: ##$basic##\n$ICN_PRE 정밀 무기는 포인트 앤 클릭의 중첩당 발사 속도를 ##+1%##만큼 얻으며 최대 ##+50%##까지 얻을 수 있습니다.\n\n에이스: ##$pro##\n최대 발사 속도 보너스가 ##+100%##만큼 증가합니다.",
				menu_potential_exponential = "잠재적 지수",
				menu_potential_exponential_desc = "베이직: ##$basic##\n킬 사이에 기회를 놓치지 않은 경우 킬당 포인트 앤 클릭의 중첩을 추가로 생성합니다.\n\n에이스: ##$pro##\n조준 및 사격의 추가 중첩은 놓치지 않고 만든 킬 수를 곱합니다.",
				
				menu_this_machine = "이 기계",
				menu_this_machine_desc = "베이직: ##$basic##\n$ICN_PRE 정밀 무기는 포인트 앤 클릭의 중첩당  재장전 속도를 ##+0.5%##만큼 얻으며 최대 ##+25%##까지 얻을 수 있습니다.\n\n에이스: ##$pro##\n최대 재장전 속도 보너스가 ##+50%##만큼 증가합니다.",
				
				menu_magic_bullet = "마법의 총알",
				menu_magic_bullet_desc = "베이직: ##$basic##\n$ICN_PRE 정밀 무기로 적을 헤드샷으로 죽이면 예비 탄약에 총알 ##1##개가 추가됩니다. 이 효과는 활이나 쇠뇌에는 발동하지 않습니다.\n\n에이스: ##$pro##\n탄환은 소지량 대신 현재 탄창에 추가됩니다.",
				
				menu_investment_returns = "투자 회수",
				menu_investment_returns_desc = "베이직: ##$basic##\n$ICN_PRE 정밀 무기로 헤드샷을 하면 포인트 앤 클릭 추가 중첩이 생성됩니다.\n\n에이스: ##$pro##\n포인트 앤 클릭의 최대 보너스가 ##+500%##만큼 증가합니다.",
			
				--unused--
				menu_mulligan = "Mulligan",
				menu_mulligan_desc = "베이직: ##$basic##\nAfter missing, you gain a ##1-second## grace period where you still benefit from your Point and Click stacks. Killing an enemy during the grace period will prevent your stacks from being lost.\n\n에이스: ##$pro##\nThe grace period is extended to ##1.5 seconds##.",
				--unused--
			
			--medic
				menu_doctors_orders = "의사의 지시",
				menu_doctors_orders_desc = "베이직: ##$basic##\n쓰러진 플레이어를 ##30%##만큼 더 빠르게 소생시킵니다.\n\n에이스: ##$pro##\n플레이어를 소생시킨 후, 당신과 당신이 소생시킨 플레이어는 ##4##초 동안 데미지 저항을 ##+50%##만큼 얻습니다.",
				menu_in_case_of_trouble = "문제의 경우",
				menu_in_case_of_trouble_desc = "베이직: ##$basic##\n구급 키트의 소유량을 ##12##개로 늘립니다.\n\n에이스: ##$pro##\n구급 키트의 소유량을 ##18##개로 늘립니다.",
				menu_checkup = "건강 진단",
				menu_checkup_desc = "베이직: ##$basic##\n의료 가방은 ##3##미터 직경에서 ##2##초마다 플레이어 최대 체력의 ##1%##씩 회복합니다.\n\n에이스: ##$pro##\n사거리가 ##6##미터로 증가합니다.\n\n참고: 치료 효과는 중첩되지 않습니다. 의료 가방 효과는 시야가 필요합니다.",
				menu_life_insurance = "생명 보험",
				menu_life_insurance_desc = "베이직: ##$basic##\n배치된 구급 키트는 플레이어가 ##5##미터 내에서 다운되면 자동으로 사용되어 플레이어를 치료하고 다운을 방지합니다.\n이 효과는 플레이어당 재사용 대기시간이 ##20##초입니다.\n\n에이스: ##$pro##\n재사용 대기시간이 ##10##초로 감소합니다.\n\n참고: 이 효과는 크록의 빌린 시간과 직접 상호 작용하여 사용자가 유예 기간이 끝날 때 생명 보험의 효과로 다운되는 것을 방지할 수 있습니다.",
				menu_outpatient = "외래",
				menu_outpatient_desc = "베이직: ##$basic##\n의료 가방 소지량을 ##2##개로 늘립니다.\n\n에이스: ##$pro##\n의료 가방 소지량을 ##3##개로 늘립니다.",
				menu_preventative_care = "예방 진료",
				menu_preventative_care_desc = "베이직: ##$basic##\n구급 키트와 의료 가방은 사용자에게 체력과 방어력의 ##100%##를 가지고 있는 피해 흡수 보호막을 제공합니다.\n\n에이스: ##$pro##\n플레이어는 피해 흡수 보호막이 파괴되면 ##2##초 동안 무적 상태가 됩니다.\n\n참고: 보호막은 시간이 지나도 줄어들지 않고 보호막은 보호막 양 : 받는 피해의 1:1 비율로 피해를 흡수합니다.",

			--chief
				menu_protect_and_serve = "보호 및 봉사",
				menu_protect_and_serve_desc = "베이직: ##$basic##\n조커 중 하나가 당신의 근처에 있고 클로커의 표적이 되거나 테이저의 전기 충격을 받으면 조커가 특수 적에게 달려들어 특수 적을 쓰러뜨립니다. 이 효과는 ##30##초마다 한 번만 발생할 수 있습니다.\n\n에이스: ##$pro##\n우정 목걸이 소지량을 ##12##개로 늘립니다.",
				
				menu_standard_of_excellence = "탁월함의 기준",
				menu_standard_of_excellence_desc = "베이직: ##$basic##\n조커는 초당 최대 체력의 ##2.5%##를 재생하고 피해 저항이 ##80%##에서 ##90%##로 증가합니다.\n\n에이스: ##$pro##\n조커는 더 이상 피해를 입어도 움츠러들지 않으며 넘어지지 않습니다.",
				
				menu_maintaining_the_peace = "평화 유지",
				menu_maintaining_the_peace_desc = "베이직: ##$basic##\n특수 적에게 소리를 지르면 조커가 해당 특수 적을 우선 대상으로 노립니다.\n\n에이스: ##$pro##\n조커 슬롯 열려있는 경우 일반 적에게 소리를 지르면 해당 적은 즉시 항복합니다. 한 번에 ##한 명##만 즉시 항복시킬 수 있습니다.",
				
				menu_order_through_law = "법을 통한 질서",
				menu_order_through_law_desc = "베이직: ##$basic##\n산탄총을 장착한 조커는 사거리 내의 적에게 근접 공격을 사용하면 높은 피해를 입히고 실드를 넘어트립니다.\n\n에이스: ##$pro##\n산타총을 장착한 조커는 모든 사격으로 적을 쓰러뜨립니다.",
				
				menu_justice_with_mercy = "자비로운 정의",
				menu_justice_with_mercy_desc = "베이직: ##$basic##\n돌격소총을 장착한 조커는 명중률을 ##+90%##만큼 얻고 ##방탄복 관통##을 얻습니다.\n\n에이스: ##$pro##\n돌격소총을 장착한 조커의 사거리가 ##+100%##만큼 증가합니다.",
				
				menu_service_above_self = "자신보다 높은 서비스",
				menu_service_above_self_desc = "베이직: ##$basic##\n한 번에 가질 수 있는 최대 조커 수를 ##2명##으로 늘립니다.\n\n에이스: ##$pro##\n각 조커는 활성화일때 30초마다 피해량이 ##+1%##만큼 최대 ##+25%##까지 얻습니다.",
			
			--enforcer
				menu_tender_meat = "부드러운 고기",
				menu_tender_meat_desc = "베이직: ##$basic##\n$ICN_SHO 산탄총은 ##일반 적들##에 대한 몸샷에서 헤드샷 피해의 ##50%##를 입힙니다.\n\n에이스: ##$pro##\n$ICN_SHO 산탄총은 안정성을 ##+40##만큼 얻습니다.\n\n참고: ##일바 적##은 특수하지 않은 적, 일명 경장갑와 중장갑한테만 적용되지 클로커나 테이저한테는 적용이 안됩니다.",
				menu_heartbreaker = "하트브레이커",
				menu_heartbreaker_desc = "베이직: ##$basic##\n더블 배럴 $ICN_SHO 산탄총은 발사 조정을 사용해 ##더블 배럴 모드##로 전환하여 한 발당 두 발 동시에 발사할 수 있습니다.\n\n에이스: ##$pro##\n##더블 배럴 모드##에서 각 샷은 두 배럴을 발사할 때 데미지를 ##+200%##만큼 입힙니다.",
				menu_shell_games = "쉘 게임",
				menu_shell_games_desc = "베이직: ##$basic##\n$ICN_SHO 산탄총은 재장전 속도를 ##+20%##만큼 얻고 탄창에 장전된 모든 탄에 대해 재장전 속도를 추가로 ##+20%##만큼 얻습니다.\n재장전을 완료하거나 취소하면 보너스가 사라집니다.\n\n에이스: ##$pro##\n단발 $ICN_SHO 산탄총의 발사 속도가 ##50%## 증가합니다.",
				menu_rolling_thunder = "천둥 소리",
				menu_rolling_thunder_desc = "베이직: ##$basic##\n자동 $ICN_SHO 산탄총의 장탄수를 ##50%##만큼 증가시킵니다.\n\n에이스: ##$pro##\n장탄수 보너스가 ##100%##로 증가합니다.",
				menu_point_blank = "포인트 블랭크",
				menu_point_blank_desc = "베이직: ##$basic##\n$ICN_SHO 산탄총은 ##3##미터 내의 적에게 ##방탄복 관통##과 ##실드 관통## 그리고 ##몸통 관통## 효과를 줍니다.\n\n에이스: ##$pro##\n$ICN_SHO 산탄총은 ##3##미터 내의 적에게 피해를 ##+100%##만큼 더 입힙니다.",
				menu_shotmaker = "대상완",
				menu_shotmaker_desc = "베이직: ##$basic##\n$ICN_SHO 산탄총은 헤드샷 피해를 ##+100%##만큼 더 입힙니다.\n\n에이스: ##$pro##\n$ICN_SHO 산탄총은 ##실드, 메딕, 테이저, 척탄병, 클로커##에 대한 몸샷에 헤드샷 데미지의 ##50%##를 입힙니다.",
				
			--heavy
				menu_collateral_damage = "부수적 피해",
				menu_collateral_damage_desc = "베이직: ##$basic##\n$ICN_HVY 중화기는 총알 궤적을 중심으로 반경 ##0.25##미터 내에서 피해의 ##50%##만큼 입힙니다.\n\n에이스: ##$pro##\n$ICN_HVY 중화기의 조준 속도가 ##50%##만큼 빨라집니다.",
				menu_death_grips = "데스 그립",
				menu_death_grips_desc = "베이직: ##$basic##\n$ICN_HVY 중화기는 처치당 8초 동안 명중률 ##+4##와 안정성을 ##+4##만큼 얻습니다. 최대 ##10##번 중첩됩니다.\n\n에이스: ##$pro##\n명중률 보너스가 ##+8##으로 증가합니다.",
				menu_bulletstorm = "탄환폭풍",
				menu_bulletstorm_desc = "베이직: ##$basic##\n플레이어가 배치한 탄약 가방은 상호 작용 후 최대 ##5##초 동안 탄약을 고갈하지 않고 사격할 수 있는 능력을 부여합니다.\n플레이어가 더 많은 탄약을 보충할수록 효과 지속 시간이 길어집니다.\n\n에이스: ##$pro##\n효과의 기본 지속 시간이 최대 ##15##초까지 증가합니다.",
				menu_lead_farmer = "탄 농부",
				menu_lead_farmer_desc = "베이직: ##$basic##\n$ICN_HVY 중화기는 집어넣는 동안 매 ##2##초마다 탄창의 ##20%##씩 장전합니다.\n\n에이스: ##$pro##\n양각대를 펼친 $ICN_HVY 중화기는 ##2##초마다 탄창의 ##20%##씩 장전합니다.",
				menu_armory_regular = "무기고 단골",
				menu_armory_regular_desc = "베이직: ##$basic##\n탄약 가방 소유량을 ##2##개로 늘립니다.\n\n에이스: ##$pro##\n탄약 가방 소유량을 ##3##개로 늘립니다.",
				menu_war_machine = "군사력",
				menu_war_machine_desc = "베이직: ##$basic##\n$ICN_HVY 중화기에 대한 탄약 가방의 탄약 재고 보너스를 ##+100%##로 늘립니다.\n\n에이스: ##$pro##\n중화기가 아닌 무기의 경우 탄약 가방의 탄약 재고 보너스를 ##+100%##로, $ICN_HVY 중화기의 경우 ##+200%##로 증가시킵니다.",
				
			--runner
				menu_hustle = "정력적 활동",
				menu_hustle_desc = "베이직: ##$basic##\n어떤 방향으로든 전력 질주할 수 있습니다.\n\n에이스: ##$pro##\n스태미나가 ##25%##만큼 더 일찍 그리고 ##+25%##만큼 더 빠르게 재생합니다.",
				menu_butterfly_bee = "나비처럼 떠다니기",
				menu_butterfly_bee_desc = "베이직: ##$basic##\n전력 질주하는 동안에도 $ICN_MEL 근접 무기를 휘두르거나 충전할 수 있습니다.\n\n에이스: ##$pro##\n##5##미터 내에 있는 적을 조준할 때 $ICN_MEL 근접 무기를 휘두르면 타격 거리로 앞으로 돌진할 수 있습니다.\n\n이 능력에는 ##5##초의 재사용 대기시간이 있지만 $ICN_MEL 근접 무기로 적을 처치하면 대기시간이 즉시 초기화됩니다.",
				menu_heave_ho = "영차",
				menu_heave_ho_desc = "베이직: ##$basic##\n가방 ##50%##만큼 더 멀리 던집니다.\n\n에이스: ##$pro##\n가방을 들고 다닐 때의 이동 속도 패널티가 ##20%##만큼 감소하고, 가방을 들고 있을 때도 ##전력 질주를 할 수 있습니다.##",
				menu_mobile_offense = "이동식 공격",
				menu_mobile_offense_desc = "베이직: ##$basic##\n이제 전력 질주하는 동안 재장전할 수 있습니다.\n\n에이스: ##$pro##\n이제 질주하는 동안 무기로 지향 사격을 할 수 있습니다.",
				menu_escape_plan = "탈출 계획",
				menu_escape_plan_desc = "베이직: ##$basic##\n방탄복이 부서지면 ##4##초 동안 스태미나가 ##100%##만큼 증가하고 질주 속도가 ##+25%##만큼 증가합니다.\n\n에이스: ##$pro##\n##4##초 동안 이동 속도를 ##+20%##만큼 얻습니다.",
				menu_leg_day = "레그 데이 애호가",
				menu_leg_day_desc = "베이직: ##$basic##\n이동 속도를 ##+10%##만큼 얻고 질주 속도를 ##+25%##만큼 얻습니다.\n\n에이스: ##$pro##\n웅크려도 더 이상 이동 속도가 감소하지 않습니다.",
				menu_wave_dash = "웨이브 대시",
				menu_wave_dash_desc = "베이직: ##$basic##\n공중에 있는 동안 ##점프## 버튼을 누르면 현재 이동 중인 방향으로 대시하고 ##웅크리기## 버튼을 누르고 있으면 지면으로 뛰어들어 치명적이지 않는 정도의 높이라면 낙하 피해를 입지 않습니다. 이러한 행동은 최대 스태미나의 ##5%##를 소비합니다.\n\n에이스: ##$pro##\n이제 모든 방향으로 대시할 수 있습니다. 다이빙은 더 이상 스태미나를 소모하지 않습니다.\n\n##임무 완료!##",
				
			--gunner
				menu_spray_and_pray = "뿌리고 기도하기",
				menu_spray_and_pray_desc = "베이직: ##$basic##\n$ICN_RPF 속사 무기는 ##10%## 확률로 ##치명타를 가하고 2배의 피해를 줄 수 있습니다.##\n\n에이스: ##$pro##\n$ICN_RPF 속사 무기는 이제 방탄복을 관통할 수 있습니다.",
				menu_money_shot = "머니 샷",
				menu_money_shot_desc = "베이직: ##$basic##\n$ICN_RPF 속사 무기는 완전히 장전된 탄창이 비어지기 직전마다 ##치명타##를 주고 빈 탄창의 재장전 속도를 ##+50%##만큼 증가시키는 특별한 과합탄을 얻습니다.\n\n에이스: ##$pro##\n과압탄은 ##방탄복 관통과 실드 관통 및 몸통 관통## 속성을 얻습니다.",
				menu_shot_grouping = "샷 그룹핑",
				menu_shot_grouping_desc = "베이직: ##$basic##\n$ICN_RPF 속사 무기의 조준 속도가 ##+90%##만큼 빨라지고 조준하는 동안 명중률과 안정성이 ##+40##만큼 증가합니다.\n\n에이스: ##$pro##\n$ICN_RPF 속사 무기는 적에게 헤드샷으로 적중할 때 ##4##초 동안 치명타 확률을 ##+1%##만큼씩 얻고, 최대 ##+10%##까지 중첩됩니다.",
				menu_prayers_answered = "응답받은 기도",
				menu_prayers_answered_desc = "베이직: ##$basic##\n$ICN_RPF 속사 무기의 치명타 확률이 ##+5%##만큼 증가하여 총 ##+15%##가 됩니다.\n\n에이스: ##$pro##\n$ICN_RPF 속사 무기의 치명타 확률이 ##+10%##만큼 더 증가하여 총 ##+25%##가 됩니다.",
				menu_making_miracles = "치명타 찾기",
				menu_making_miracles_desc = "베이직: ##$basic##\n치명타 피해 배율이 ##2.5##배로 증가시킵니다.\n\n에이스: ##$pro##\n치명타 피해 배율을 ##3##배로 더 증가시킵니다.",
				menu_close_enough = "더 가까이",
				menu_close_enough_desc = "베이직: ##$basic##\n$ICN_RPF 속사 무기의 총알은 단단한 표면을 ##도탄##하여 가장 가까운 적에게 ##50%##만큼의 피해를 줍니다.\n\n에이스: ##$pro##\n도탄된 총알의 치명타에는 데미지 페널티가 없어집니다.",
				
			--engineer
				menu_digging_in = "참호 파기",
				menu_digging_in_desc = "베이직: ##$basic##\n센트리 건을 ##90%##만큼 더 빠르게 배치하고 회수할 수 있습니다.\n\n에이스: ##$pro##\n센트리 건은 단단해져 거의 완전히 무적 상태가 되고 엄폐물로 사용하기에 적합하게 만듭니다.",
				menu_advanced_rangefinder = "고급 타겟팅",
				menu_advanced_rangefinder_desc = "베이직: ##$basic##\n센트리 건의 사거리와 명중률이 ##+100%##만큼 증가합니다.\n\n에이스: ##$pro##\n감시 모드는 저격수 외에 모든 특수 적 유형을 먼저 표적으로 정합니다.",
				menu_targeting_matrix = "작은 도우미",
				menu_targeting_matrix_desc = "베이직: ##$basic##\n수동 모드인 센트리 건은 ##+25%##만큼 피해를 입히고 조준하는 적을 즉시 마킹합니다.\n\n에이스: ##$pro##\n수동 모드인 센트리 건은 표시된 적에게 ##+25%##만큼 피해를 입힙니다.",
				menu_wrangler = "원격 조련 장치",
				menu_wrangler_desc = "베이직: ##$basic##\n수동 모드인 센트리 건은 열을 전혀 생성하지 않습니다.\n\n에이스: ##$pro##\n수동 모드인 센트리 건은 헤드샷 데미지를 ##+100%##만큼 얻습니다.",
				menu_hobarts_funnies = "호바트의 재미",
				menu_hobarts_funnies_desc = "베이직: ##$basic##\n철갑탄이나 테이저탄을 사용하는 센트리 건은 발사 속도를 ##+25%##만큼 얻습니다.\n\n에이스: ##$pro##\n발사 속도 보너스가 ##+50%##로 증가합니다.",
				menu_killer_machines = "킬러 머신",
				menu_killer_machines_desc = "베이직: ##$basic##\n모든 센트리 건 모드는 피해를 ##+50##만큼 입힙니다.\n\n에이스: ##$pro##\n센트리 건 소지량을 ##2##개로 늘립니다.",
				
			--thief
				menu_classic_thievery = "고전적인 도둑질",
				menu_classic_thievery_desc = "베이직: ##$basic##\n자물쇠 따기 속도가 ##100%##만큼 증가합니다.\n\n에이스: ##$pro##\n케이싱 모드에서 발각되는 시간이 ##25%##만큼 더 오래 걸립니다.",
				menu_people_watching = "보고있는 사람",
				menu_people_watching_desc = "베이직: ##$basic##\n케이싱 모드에서 적을 표시하고 아이템을 집을 수 있는 능력을 얻습니다.\n\n에이스: ##$pro##\n스텔스 상태일때 ##5##미터 내에 있는 적과 시민을 자동으로 표시합니다.\n##3##초 동안 가만히 서 있으면 반경이 ##15##미터로 증가합니다.",
				menu_blackout = "정전",
				menu_blackout_desc = "베이직: ##$basic##\nECM 재머의 지속 시간이 ##25%##만큼 증가합니다.\n\n에이스: ##$pro##\nECM 재머의 지속 시간을 추가로 ##25%##만큼 증가시켜 총 ##+50%##가 됩니다.",
				menu_tuned_out = "시청 거부",
				menu_tuned_out_desc = "베이직: ##$basic##\n##20##초 동안 카메라가 팀을 감지하지 못하도록 비활성화할 수 있습니다. 한 번에 하나의 카메라만 비활성화할 수 있습니다.\n\n에이스: ##$pro##\n비활성화 시간이 ##30##초로 증가합니다.\n한 번에 무제한의 카메라를 비활성화할 수 있습니다.",
				menu_electronic_warfare = "전자전",
				menu_electronic_warfare_desc = "베이직: ##$basic##\nECM 재머 수를 ##2##개로 늘립니다.\n\n에이스: ##$pro##\nECM 재머는 활성화 된 상태에서 페이저를 지연시킵니다.",
				menu_skeleton_key = "스켈레톤 키",
				menu_skeleton_key_desc = "베이직: ##$basic##\n자물쇠 따기 속도가 ##+100%##만큼 증가하고 금고 자물쇠 따기 기능을 얻습니다.\n\n에이스: ##$pro##\n이제 금고를 ##100%##만큼 더 빨리 열 수 있고 전자 잠금 장치를 열 수 있습니다.",
				
			--assassin
				menu_killers_notebook = "킬러의 수첩",
				menu_killers_notebook_desc = "베이직: ##$basic##\n$ICN_QUT 조용한 무기의 조준 속도가 ##90%##만큼 빨라집니다.\n\n에이스: ##$pro##\n$ICN_QUT 조용한 무기는 안정성을 ##+20##만큼 얻습니다.",
				menu_good_hunting = "좋은 사냥",
				menu_good_hunting_desc = "베이직: ##$basic##\n활은 예비 대신 모든 화살을 준비합니다. 화살은 적을 향해 휘어져 적의 머리를 공격합니다.\n\n에이스: ##$pro##\n쇠뇌는 헤드샷 후 즉시 재장전됩니다. 적을 죽이는 화살은 ##몸통 관통## 효과를 얻어 대상과 경로에 있는 다른 적을 관통합니다.",
				menu_comfortable_silence = "안락한 침묵",
				menu_comfortable_silence_desc = "베이직: ##$basic##\n$ICN_QUT 조용한 무기는 은폐성을 ##+2##만큼 얻습니다.\n\n에이스: ##$pro##\n$ICN_QUT 조용한 무기는 은폐성을 ##+4##만큼 얻습니다.",
				menu_toxic_shock = "유독성 충격",
				menu_toxic_shock_desc = "베이직: ##$basic##\n성공적으로 적을 $ICN_POI 중독시키면 반경 ##3##미터 내에 있는 적도 $ICN_POI 중독됩니다.\n\n에이스: ##$pro##\n$ICN_POI 독은 데미지를 ##+100%##만큼 줍니다.",
				menu_professionals_choice = "전문가의 선택",
				menu_professionals_choice_desc = "베이직: ##$basic##\n$ICN_QUT 조용한 무기는 발각도가 ##35##에서 ##3##씩 낮아질 ## 발사 속도 보너스 +2%##를 최대 ##+10%##까지 얻습니다.\n\n에이스: ##$pro##\n발사 속도 보너스가 ##+4%##로 증가하고 최대 보너스가 ##+20%##로 증가합니다.",
				menu_quiet_grave = "무덤처럼 조용하기",
				menu_quiet_grave_desc = "베이직: ##$basic##\n$ICN_QUT 조용한 무기는 뒤에서 적을 공격할 때 피해를 ##+25%##만큼 입힙니다.\n\n에이스: ##$pro##\n$ICN_QUT 조용한 무기는 현재 당신을 목표로 하고 있지 않은 적을 공격할 때 피해를 ##+25%##만큼 입힙니다.",
			
			--sapper
				menu_home_improvements = "집 개선",
				menu_home_improvements_desc = "베이직: ##$basic##\n설치하거나 업그레이드한 드릴과 톱은 ##조용해집니다##. 시민과 경비원은 경고를 받으려면 드릴이나 톱을 봐야 합니다.\n\n에이스: ##$pro##\n다른 플레이어가 배치한 드릴과 톱을 ##75%##만큼 더 빠르게 업그레이드합니다.",
				menu_perfect_alignment = "완벽한 조정",
				menu_perfect_alignment_desc = "베이직: ##$basic##\n드릴과 톱을 ##75%##만큼 더 빨리 배치합니다.\n\n에이스: ##$pro##\n당신이 배치하거나 업그레이드한 드릴과 톱이 ##30%##만큼 더 빠르게 작동합니다.",
				menu_static_defense = "정전기 방어",
				menu_static_defense_desc = "베이직: ##$basic##\n당신이 설치하거나 업그레이드한 드릴이나 톱을 적이 무력화시키려 하면 실패하는 동시에 ##5##초 동안 전기 충격을 받습니다. 이는 ##60##초마다 한 번만 발생할 수 있습니다.\n\n에이스: ##$pro##\n재사용 대기시간이 ##30##초로 감소합니다. 정전기 방어가 활성화되면 경고를 보냅니다.",
				menu_routine_maintenance = "일상적인 유지 보수",
				menu_routine_maintenance_desc = "베이직: ##$basic##\n고장난 드릴과 톱을 ##50%##만큼 더 빠르게 고칩니다.\n\n에이스: ##$pro##\n고장난 드릴이나 톱을 근접 공격하여 즉시 고칠 수 있지만 이는 드릴 또는 톱당 한 번만 가능합니다.",
				menu_automatic_reboot = "자동 재부팅",
				menu_automatic_reboot_desc = "베이직: ##$basic##\n드릴이나 톱을 설치하거나 업그레이드한 경우 고장났을 때 ##30##초 후에 자동으로 고쳐지지만 이는 드릴 또는 톱당 한 번만 가능합니다.\n\n에이스: ##$pro##\n드릴 또는 톱 고장남과 고침 사이의 지연 시간이 ##5##초로 줄어듭니다.",
				menu_explosive_impatience = "폭발적인 성급함",
				menu_explosive_impatience_desc = "베이직: ##$basic##\n성형작약탄 보유량을 ##6##개로 늘립니다.\n\n에이스: ##$pro##\n성형작약탄 보유량을 ##8##개로 늘립니다.",
		
			--dealer
				menu_high_low = "하이-로우 분할",
				menu_high_low_desc = "베이직: ##$basic##\n$ICN_MEL 근접 무기는 헤드샷을 할 수 있는 능력을 얻습니다. $ICN_THR 투척 무기의 속도가 ##+100%##만큼 증가하여 속도와 사거리가 증가합니다.\n\n에이스: ##$pro##\n모든 무기 유형에 스왑 속도와 넣는 속도를 ##+80%##만큼 얻습니다.",
				
				menu_face_value = "액면값",
				menu_face_value_desc = "베이직: ##$basic##\n$ICN_MEL 근접 무기의 충전 속도가 ##+100%##만큼 증가합니다.\n\n에이스: ##$pro##\n$ICN_MEL 근접 무기로 실드를 공격하면 실드가 비틀거립니다.",
			
				menu_value_bet = "가치 내기",
				menu_value_bet_desc = "베이직: ##$basic##\n$ICN_THR 투척 무기는 탄약을 ##+50%##만큼 얻습니다.\n\n에이스: ##$pro##\n$ICN_THR 투척 무기를 ##1##초 동안 들고 있으면 대미지를 ##+100%##까지 충전할 수 있습니다.",
			
				menu_wild_card = "와일드 카드",
				menu_wild_card_desc = "베이직: ##$basic##\n피해를 입으면 ##2##미터 내의 적들이 그 피해의 ##100%##만큼을 입습니다.\n\n에이스: ##$pro##\n와일드 카드로 피해를 입은 적은 이제 비틀거리게 됩니다.",
			
				menu_stacking_deck = "덱 쌓기",
				menu_stacking_deck_desc = "베이직: ##$basic##\n$ICN_THR 투척 무기는 적을 향해 휘어져 적의 머리를 공격합니다.\n\n에이스: ##$pro##\n$ICN_THR 투척 무기로 헤드샷으로 사살하면 대상으로부터 ##6##미터 내에 있는 대부분의 적에게 패닉을 일으켜 짧은 시간 동안 제어할 수 없는 공포에 휩싸이게 합니다.",
			
				menu_shuffle_and_cut = "셔플 앤 컷",
				menu_shuffle_and_cut_desc = "베이직: ##$basic##\n$ICN_THR 투척 무기로 적을 공격하면 다음 $ICN_MEL 근접 공격이 ##+500%##만큼 데미지가 강화됩니다. $ICN_MEL 근접 무기로 적을 공격하면 다음 $ICN_THR 투척 무기 공격이 ##+500%##만큼 데미지가 강화됩니다.\n\n한 번에 각 유형의 강화된 공격을 최대 ##5##까지 중첩이 가능합니다.\n\n에이스: ##$pro##\n강화된 $ICN_MEL 근접 무기 또는 $ICN_THR 투척 무기로 적을 처치하면 버프가 되돌려집니다.",
			
			
			--fixer
				menu_rolling_cutter = "롤링 커터",
				menu_rolling_cutter_desc = "베이직: ##$basic##\n$ICN_SAW OVE9000 톱은 더 이상 적에게 피해를 입힐 때 탄약을 소모하지 않으며 적중할 때마다 ##2##초 동안 ##10%##씩 피해를 최대 ##500%##까지 얻습니다.\n\n에이스: ##$pro##\n$ICN_SAW OVE9000 톱날 내구성을 ##+50##만큼 증가합니다.",
				menu_walking_toolshed = "걸어다니는 도구집",
				menu_walking_toolshed_desc = "베이직: ##$basic##\n예비 $ICN_SAW OVE9000 톱날을 ##2##개로 늘립니다.\n\n에이스: ##$pro##\n예비 $ICN_SAW OVE9000 톱날을 ##3##개로 늘립니다.",
				menu_handyman = "핸디맨",
				menu_handyman_desc = "베이직: ##$basic##\n$ICN_SAW OVE9000 톱을 보조 무기로 사용할 수 있습니다.\n\n에이스: ##$pro##\n$ICN_SAW OVE9000 톱의 사거리가 ##+25%##만큼 얻습니다.",
				menu_bloody_mess = "피비린내 나는 학살",
				menu_bloody_mess_desc = "베이직: ##$basic##\n$ICN_SAW OVE9000 톱으로 처치하면 ##2.5##미터 내의 적에게 치명타 피해를 줍니다.\n\n에이스: ##$pro##\n피비린내 나는 학살로 죽인 적은 근처의 적에게도 피해를 줍니다.",
				menu_not_safe = "안전하지 않음",
				menu_not_safe_desc = "베이직: ##$basic##\n$ICN_SAW OVE9000 톱은 실드를 절단할 수 있습니다. 또한 OVE9000 톱은 실드를 칠 때 더 이상 탄약을 소모하지 않습니다.\n\n에이스: ##$pro##\n$ICN_SAW OVE9000 톱은 도저와 장갑판에 피해를 ##+100%##만큼 입힙니다.",
				menu_into_the_pit = "구덩이 속으로",
				menu_into_the_pit_desc = "베이직: ##$basic##\n$ICN_SAW OVE9000 톱은 처음 적에게 피해를 입힐 때 반드시 치명타를 가합니다.\n\n에이스: ##$pro##\n$ICN_SAW OVE9000 톱으로 처치하면 ##6##미터 내에 있는 대부분의 적에게 패닉 상태가 발생하여 짧은 시간 동안 제어할 수 없는 공포에 휩싸이게 됩니다.",
				
				
			--demolitions
			
				menu_party_favors = "파티 피버",
				menu_party_favors_desc = "베이직: ##$basic##\n$ICN_GRN 수류탄이 탄약을 ##+33%##만큼 얻습니다.\n\n에이스: ##$pro##\n센서 모드의 트립 마인은 대상을 ##50%##만큼 더 오래 표시합니다.",
			
				menu_special_toys = "특별한 장난감",
				menu_special_toys_desc = "베이직: ##$basic##\n$ICN_SPC 전문 무기는 탄약을 ##+25%##만큼 더 얻습니다.\n\n에이스: ##$pro##\n$ICN_SPC 전문 무기는 재장전 속도를 ##+30%##만큼 얻습니다.",
			
				menu_smart_bombs = "스마트 폭탄",
				menu_smart_bombs_desc = "베이직: ##$basic##\n트립 마인의 폭발 반경이 ##+30%##만큼 증가합니다.\n\n에이스: ##$pro##\n트립 마인은 더 이상 시미 이나 인질에게 피해를 줄 수 없습니다.",
			
				menu_third_degree = "3도",
				menu_third_degree_desc = "베이직: ##$basic##\n$ICN_ARD 영역 차단 효과가 ##+50%##만큼 더 오래 지속됩니다.\n\n에이스: ##$pro##\n당신과 당신의 $ICN_ARD 영역 차단 효과는 불이 붙은 적에게 ##+25%##만큼 더 많은 피해를 줍니다.",
			
				menu_have_blast = "즐거운 하루",
				menu_have_blast_desc = "베이직: ##$basic##\n적에게 직접 트립 마인을 배치할 수 있는 능력을 얻습니다.\n그렇게 하면 대상과 ##10##미터 내의 모든 적이 폭발할 때까지 패닉에 빠지게 됩니다.\n\n에이스: ##$pro##\n도저에게 트립 마인을 설치하면 스턴하고 ##10##미터 내의 모든 적에게 ##10##초 동안 피해 취약성을 ##+100%##만큼 입힙니다.",
			
				menu_improv_expert = "개선 전문가",
				menu_improv_expert_desc = "베이직: ##$basic##\n탄약 상자를 ##50##개씩 얻을 때마다 $ICN_GRN 수류탄 ##+1##개를 줍니다. \n\n에이스: ##$pro##\n로켓 발사기와 화염 방사기는 탄약 상자에서 탄약을 얻을 수 있습니다. 유탄 발사기는 탄약 상자에서 탄약을 ##+50%##만큼 얻습니다.\n\n참고: 이것은 당신과 팀원이 주운 탄약 상자 모두에 적용됩니다.",
			
		--perk decks
				--crew chief
				menu_deck1_1 = "The Usual Suspects",
				menu_deck1_1_desc = "Your team gains ##+10%## Damage Resistance.\n\nYour team can only benefit from one set of Crew Chief passives at a time. If multiple Crew Chiefs are present, the team will only benefit from the highest leveled Crew Chief deck.",
				menu_deck1_2 = "One Hundred Steps",
				menu_deck1_2_desc = "Your team gains ##+10%## Stamina Recovery Rate.",
				menu_deck1_3 = "Reservoir Dogs",
				menu_deck1_3_desc = "Your team gains ##+10%## Maximum Health.",
				menu_deck1_4 = "Mean Streets",
				menu_deck1_4_desc = "Your team gains ##+10%## Maximum Stamina.",
				menu_deck1_5 = "Goodfellas",
				menu_deck1_5_desc = "Each member of your team regenerates ##1%## of their Missing Health per second.",
				menu_deck1_6 = "Heat",
				menu_deck1_6_desc = "Your team gains ##+10%## Interact Speed.",
				menu_deck1_7 = "Layer Cake",
				menu_deck1_7_desc = "Your team gains ##+10%## Maximum Armor.",
				menu_deck1_8 = "State of Grace",
				menu_deck1_8_desc = "Your team gains ##+10%## Armor Recovery Rate.",
				menu_deck1_9 = "Angels with Dirty Faces",
				menu_deck1_9_desc = "You can revive Downed players within your line of sight by Shouting at them when they are within ##10## meters of you. This effect has a ##20## second cooldown.",
				
				
				--Muscle
				menu_deck2_1 = "Dynamic Tension",
				menu_deck2_1_desc = "You gain ##+25%## Maximum Health and you become ##25%## more likely to be targeted over your teammates.",
				menu_deck2_2 = "Endurance Training",
				menu_deck2_2_desc = "You regenerate ##0.5%## of your Maximum Health per second.",
				menu_deck2_3 = "Chump Into Champ",
				menu_deck2_3_desc = "Increases your Maximum Health bonus to ##+50%##.",
				menu_deck2_4 = "Dauntless Improvement",
				menu_deck2_4_desc = "Your Health Regeneration increases to ##1%## of your Maximum Health per second.",
				menu_deck2_5 = "15 Minutes A Day",
				menu_deck2_5_desc = "Increases your Maximum Health bonus to ##+75%##.",
				menu_deck2_6 = "Tireless Physique",
				menu_deck2_6_desc = "Your Health Regeneration increases to ##1.5%## of your Maximum Health per second.",
				menu_deck2_7 = "Muscle Mystery",
				menu_deck2_7_desc = "Increases your Maximum Health bonus to ##+100%##.",
				menu_deck2_8 = "Flex Eternal",
				menu_deck2_8_desc = "Your Health Regeneration increases to ##2%## of your Maximum Health per second.",
				menu_deck2_9 = "Hero Of The Beach",
				menu_deck2_9_desc = "Each kill you make during a heist increases your Maximum Health by ##+1##, up to ##+200##. All stacks are lost upon being downed.",
				
				--Armorer
				menu_deck3_1 = "Reactive Armor",
				menu_deck3_1_desc = "You are rendered ##Invulnerable## to damage for ##2## seconds after your Armor breaks. This effect has a ##10## second cooldown.",
				menu_deck3_2 = "Mk1 Plating",
				menu_deck3_2_desc = "You gain ##+25%## Maximum Armor.",
				menu_deck3_3 = "Steadfast",
				menu_deck3_3_desc = "##Doubles## the Steadiness of your equipped Armor, ##reducing how much you Flinch## from taking Damage.",
				menu_deck3_4 = "Mk2 Plating",
				menu_deck3_4_desc = "Increases your Maximum Armor bonus to ##+50%##.",
				menu_deck3_5 = "Armored Grace",
				menu_deck3_5_desc = "Your Speed penalty for wearing Armor is reduced by ##50%##.",
				menu_deck3_6 = "Mk3 Plating",
				menu_deck3_6_desc = "Increases your Maximum Armor bonus to ##+75%##.",
				menu_deck3_7 = "Unbreakable Will",
				menu_deck3_7_desc = "You gain ##+25%## Armor Recovery.",
				menu_deck3_8 = "Mk4 Plating",
				menu_deck3_8_desc = "Increases your Maximum Armor bonus to ##+100%##.",
				menu_deck3_9 = "Ironclad",
				menu_deck3_9_desc = "You gain ##+10%## Damage Resistance when you have any amount of Armor.",
				
				--Rogue
				menu_deck4_1 = "Fat Chance",
				menu_deck4_1_desc = "You gain ##+10%## Dodge Chance.",
				menu_deck4_2 = "Hands Off",
				menu_deck4_2_desc = "You are ##guaranteed to Dodge an enemy Melee attack##. This effect has a ##10## second cooldown.",
				menu_deck4_3 = "Playing the Odds",
				menu_deck4_3_desc = "Increases your Dodge Chance bonus to ##+20%##.",
				menu_deck4_4 = "Elusive Target",
				menu_deck4_4_desc = "You are ##guaranteed to Dodge a Sniper shot##. This effect has a ##10## second cooldown.",
				menu_deck4_5 = "Tricky Business",
				menu_deck4_5_desc = "Increases your Dodge Chance bonus to ##+30%##.",
				menu_deck4_6 = "Kansas City Shuffle",
				menu_deck4_6_desc = "You are ##guaranteed to Dodge a Cloaker kick##. This effect has a ##10## second cooldown.",
				menu_deck4_7 = "Isai's Wisdom",
				menu_deck4_7_desc = "Increases your Dodge Chance bonus to ##+40%##.",
				menu_deck4_8 = "The Electric Slide",
				menu_deck4_8_desc = "You are ##guaranteed to Dodge a Taser shock##. This effect has a ##10## second cooldown.",
				menu_deck4_9 = "Smooth Criminal",
				menu_deck4_9_desc = "You gain a bonus ##+2%## Dodge Chance for every ##2## points of Detection Risk under ##35##, up to ##+20%##.",
				
				
				--Hitman
				menu_st_spec_5 = "Hitman",
				menu_deck5_1 = "Aerodynamic",
				menu_deck5_1_desc = "You gain ##+10%## Armor Recovery Rate.",
				menu_deck5_2 = "Revolution 909",
				menu_deck5_2_desc = "Your Armor will Recover ##2## seconds after being broken, no matter the situation. ",
				menu_deck5_3 = "High Fidelity",
				menu_deck5_3_desc = "Your Armor Recovery Rate bonus increases to ##+20%##.",
				menu_deck5_4 = "Rollin & Scratchin",
				menu_deck5_4_desc = "Revolution 909 now activates after ##1.75## seconds.",
				menu_deck5_5 = "Fresh",
				menu_deck5_5_desc = "Your Armor Recovery Rate bonus increases to ##+30%##.",
				menu_deck5_6 = "Steam Machine",
				menu_deck5_6_desc = "Revolution 909 now activates after ##1.5## seconds.",
				menu_deck5_7 = "Face to Face",
				menu_deck5_7_desc = "Your Armor Recovery Rate bonus increases to ##+40%##.",
				menu_deck5_8 = "Hitmen After All",
				menu_deck5_8_desc = "Revolution 909 now activates after ##1.25## seconds.",
				menu_deck5_9 = "One More Time",
				menu_deck5_9_desc = "You become ##Invulnerable while in bleedout##. While in bleedout, you can ##Revive yourself by killing an enemy and then pressing Jump##.",
				
				--Crook
				menu_st_spec_6 = "Crook",
				menu_deck6_1 = "Extra Padding",
				menu_deck6_1_desc = "Ballistic Vests gain ##+15## Maximum Armor.",
				menu_deck6_2 = "Bounce Back",
				menu_deck6_2_desc = "Ballistic Vests gain ##+20%## Armor Recovery Rate.",
				menu_deck6_3 = "Vital Protection",
				menu_deck6_3_desc = "Increases the Maximum Armor bonus for Ballistic Vests to ##+30##.",
				menu_deck6_4 = "Basic Tailoring",
				menu_deck6_4_desc = "When wearing a Ballistic Vest, you gain ##+15%## Dodge Chance.",
				menu_deck6_5 = "Custom Weave",
				menu_deck6_5_desc = "Increases the Maximum Armor bonus for Ballistic Vests to ##+45##.",
				menu_deck6_6 = "Keeping Cool",
				menu_deck6_6_desc = "Increases the Ballistic Vest Armor Recovery Rate bonus to ##+40%##.",
				menu_deck6_7 = "Prototype Material",
				menu_deck6_7_desc = "Increases the Maximum Armor bonus for Ballistic Vests to ##+60##.",
				menu_deck6_8 = "Perfect Fit",
				menu_deck6_8_desc = "Your Dodge Chance bonus for Ballistic Vests increases to ##+30%##.",
				menu_deck6_9 = "Borrowed Time",
				menu_deck6_9_desc = "Instead of being incapacitated when you lose all of your health, you will enter a grace period where you can continue to act for ##4## seconds before falling. During this grace period, you are ##invulnerable## and your weapons ##instantly reload##. Borrowed Time cannot be triggered by fall damage or fire damage.",
				
				--Burglar
				menu_deck7_1 = "Hands in the Dark",
				menu_deck7_1_desc = "You gain ##+10%## Object Interact Speed while in Stealth.",
				menu_deck7_2 = "The Toothpick",
				menu_deck7_2_desc = "You gain ##+232## Concealment.",
				menu_deck7_3 = "Deft Fingers",
				menu_deck7_3_desc = "Your Object Interact Speed bonus increases to ##+20%##.",
				menu_deck7_4 = "Ranzer's Edge",
				menu_deck7_4_desc = "You ##no longer take Fall Damage when falling from Non-Fatal heights##. Additionally, the distance you must fall before a fall is considered Fatal is ##doubled##.",
				menu_deck7_5 = "Silent Work",
				menu_deck7_5_desc = "Your Object Interact Speed bonus increases to ##+30%##.",
				menu_deck7_6 = "Long Haul",
				menu_deck7_6_desc = "You bag corpses ##+20%## faster and can Sprint ##while carrying heavy Bags##.",
				menu_deck7_7 = "Criminal Discretion",
				menu_deck7_7_desc = "Your Object Interact Speed bonus increases to ##+40%##.",
				menu_deck7_8 = "Fast Talker",
				menu_deck7_8_desc = "You answer Pagers ##+10%## faster.",
				menu_deck7_9 = "Blessing of the Strigidae",
				menu_deck7_9_desc = "You can ##freely rotate your camera## while Interacting with something.",
				
				--Infiltrator
				menu_deck8_1 = "Frontliner",
				menu_deck8_1_desc = "Charging your $ICN_MELMelee Weapon, holding the $ICN_SAW##OVE9000 Saw##, or hitting an enemy with a $ICN_MELMelee Weapon grants you ##+20%## Damage Resistance for ##5## seconds.",
				menu_deck8_2 = "Man Opener",
				menu_deck8_2_desc = "Killing an enemy with a $ICN_MELMelee Weapon or the $ICN_SAW##OVE9000 Saw## restores ##2%## of your Maximum Health.",
				menu_deck8_3 = "Eye of The Tiger",
				menu_deck8_3_desc = "You become ##immune to the visual effect of Flashbangs##.",
				menu_deck8_4 = "Bulk Up",
				menu_deck8_4_desc = "You gain ##+40%## Maximum Health.",
				menu_deck8_5 = "Grit",
				menu_deck8_5_desc = "You gain ##+10%## Damage Resistance.",
				menu_deck8_6 = "Playing Rough",
				menu_deck8_6_desc = "Killing an enemy with a $ICN_MELMelee Weapon or the $ICN_SAW##OVE9000 Saw## restores ##2%## of your Maximum Armor.",
				menu_deck8_7 = "Cross-Counter",
				menu_deck8_7_desc = "If you are struck by an enemy melee attack or Cloaker kick while Charging your $ICN_MELMelee Weapon, you will ##automatically counter-attack##, avoiding the attack and performing a fully Charged $ICN_MELMelee Attack in return.",
				menu_deck8_8 = "Scar Tissue",
				menu_deck8_8_desc = "You gain ##+40%## Maximum Armor.",
				menu_deck8_9 = "Insulated",
				menu_deck8_9_desc = "You ##automatically break out of being shocked## by a Taser after ##1.5## seconds.",
				
				--Sociopath
				menu_deck9_1 = "Richard",
				menu_deck9_1_desc = "Limits the amount of damage that you can take from any attack to ##1##, but reduces your Armor and Dodge by ##100%## and reduces your Health to ##4##. Taking damage ##renders you Invulnerable## for ##2## seconds.\n\nKilling an enemy within ##10## meters grants a stack of ##Combo## that lasts for ##10## seconds. Every ##5## stacks of ##Combo## restores ##1## Health. Every ##10## stacks of Combo reduces the amount of stacks required to restore Health by ##1##.\n\nNOTE: Sociopath reduces healing from First Aid Kits, gains fewer Shields from skills, and negates Regeneration effects and Team Health bonuses.",
				menu_deck9_2 = "Graham",
				menu_deck9_2_desc = "You gain ##+100%## Stamina.",
				menu_deck9_3 = "Tony",
				menu_deck9_3_desc = "Killing an enemy with a $ICN_MELMelee Weapon generates an additional ##Combo## stack.",
				menu_deck9_4 = "Rufus",
				menu_deck9_4_desc = "You gain ##+1## Maximum Health.",
				menu_deck9_5 = "Jake",
				menu_deck9_5_desc = "Killing an enemy with a $ICN_THRThrowing Weapon generates ##2## stacks of ##Combo##, regardless of range.",
				menu_deck9_6 = "Brandon",
				menu_deck9_6_desc = "You gain ##+10%## Movement Speed.",
				menu_deck9_7 = "Carl",
				menu_deck9_7_desc = "Killing an enemy with the $ICN_SAWOVE9000 Saw generates an additional ##Combo## stack.",
				menu_deck9_8 = "Earl",
				menu_deck9_8_desc = "Your Invulnerability period lasts ##+0.5## seconds longer.",
				menu_deck9_9 = "Rasmus",
				menu_deck9_9_desc = "Increases ##Combo## radius to ##15## meters. All enemies within ##Combo## range are Highlighted during Loud.",
				
				--Grinder
				menu_deck11_1 = "Break Out",
				menu_deck11_1_desc = "##0.5%## of the damage you deal is returned to you as Health.",
				menu_deck11_2 = "Life Tap",
				menu_deck11_2_desc = "You regain ##+0.5%## of your Maximum Health when you kill an enemy.",
				menu_deck11_3 = "Offensive Pressure",
				menu_deck11_3_desc = "Increases the amount of Health gained from damage dealt to ##1%##.",
				menu_deck11_4 = "Backcheck",
				menu_deck11_4_desc = "You gain ##+20%## Maximum Health.",
				menu_deck11_5 = "Strong Side",
				menu_deck11_5_desc = "Increases the amount of Health gained from damage dealt to ##1.5%##.",
				menu_deck11_6 = "Life Rush",
				menu_deck11_6_desc = "Increases the amount of Maximum Health gained from killing an enemy to ##1%##.",
				menu_deck11_7 = "Scoring Chance",
				menu_deck11_7_desc = "Increases the amount of Health gained from damage dealt to ##2%##.",
				menu_deck11_8 = "Forecheck",
				menu_deck11_8_desc = "Increases your Maximum Health bonus to ##+40%##.",
				menu_deck11_9 = "Bar Down",
				menu_deck11_9_desc = "Increases the amount of Health gained from damage dealt to ##2.5%##.",
				
				--Yakuza
				menu_deck12_1 = "Fujin Irezumi",
				menu_deck12_1_desc = "You gain ##+2%## Damage Resistance per ##10%## of Missing Health, up to ##+10%## Damage Resistance.\n\nCharging your $ICN_MELMelee Weapon for ##5## seconds causes you to ##lose 5%## Maximum Health per second spent Charging afterwards, up to ##50%##.\n\n##Yakuza negates Regeneration effects while equipped.##",
				menu_deck12_2 = "Raijin Irezumi",
				menu_deck12_2_desc = "Taking damage grants ##+10%## Damage Resistance for ##5## seconds.",
				menu_deck12_3 = "Taubushi",
				menu_deck12_3_desc = "Increases the Damage Resistance bonus per Missing Health to ##+4%##, up to ##+20%##.",
				menu_deck12_4 = "Gobu",
				menu_deck12_4_desc = "Increases the Damage Resistance bonus from taking damage to ##+20%##",
				menu_deck12_5 = "Hanzubon",
				menu_deck12_5_desc = "Increases the Damage Resistance bonus per Missing Health to ##+6%##, up to ##+30%##.",
				menu_deck12_6 = "Shichibu",
				menu_deck12_6_desc = "Increases the Damage Resistance bonus from taking damage to ##+30%##",
				menu_deck12_7 = "Munewari",
				menu_deck12_7_desc = "Increases the Damage Resistance bonus per Missing Health to ##+8%##, up to ##+40%##",
				menu_deck12_8 = "Nagasode",
				menu_deck12_8_desc = "Increases the Damage Resistance bonus from taking damage to ##+40%##.",
				menu_deck12_9 = "Donburi Soshinbori",
				menu_deck12_9_desc = "You become Invulnerable for ##1## second after taking damage from any source.",
				
				--Ex-President
				menu_deck13_1 = "Election",
				menu_deck13_1_desc = "When you ##have any amount of Armor##, kills generate ##5 Approval##, up to ##200##.\n\nWhen your Armor has been ##completely depleted and starts to regenerate##, ##Approval## is converted into healing to ##restore missing Health##.",
				menu_deck13_2 = "Inauguration",
				menu_deck13_2_desc = "If you are missing Health when you have any amount of Armor, ##5 Approval## is converted to Health every ##5## seconds.",
				menu_deck13_3 = "Appointment",
				menu_deck13_3_desc = "You gain ##+30%## Maximum Health.",
				menu_deck13_4 = "Delegation",
				menu_deck13_4_desc = "Reduces the amount of time to convert ##Approval## while Armored to ##4## seconds.",
				menu_deck13_5 = "Rough Times",
				menu_deck13_5_desc = "You gain ##+20%## Dodge Chance.",
				menu_deck13_6 = "Bad Decisions",
				menu_deck13_6_desc = "Reduces the amount of time to convert ##Approval## while Armored to ##3## seconds.",
				menu_deck13_7 = "Scandal",
				menu_deck13_7_desc = "You now generate ##10 Approval## per kill and the maximum amount of ##Approval## increases to ##300##.",
				menu_deck13_8 = "Impeachment",
				menu_deck13_8_desc = "Reduces the amount of time to convert ##Approval## while Armored to ##2## seconds.",
				menu_deck13_9 = "Departure",
				menu_deck13_9_desc = "When your Armor ##has been completely depleted##, you gain ##+20%## Armor Recovery Rate for every ##80 Approval## you have stored, up to ##+60%##.",
				
				--Anarchist
				menu_deck15_1 = "Nazi Punks Fuck Off",
				menu_deck15_1_desc = "Instead of ##fully regenerating Armor when out of combat##, you will ##constantly regenerate Armor based on your suit##. Heavier suits regenerates more Armor, but during longer intervals.\n\n##50%## of your Health is converted into Armor.",
				menu_deck15_2 = "Dog Bite",
				menu_deck15_2_desc = "Damaging an enemy generates ##5## Armor.",
				menu_deck15_3 = "Cesspools In Eden",
				menu_deck15_3_desc = "Increases the amount of Health converted into Armor to ##60%##.",
				menu_deck15_4 = "Life Sentence",
				menu_deck15_4_desc = "Killing an enemy generates ##5## Armor.",
				menu_deck15_5 = "Dead End",
				menu_deck15_5_desc = "Increases the amount of Health converted into Armor to ##70%##.",
				menu_deck15_6 = "I Spy",
				menu_deck15_6_desc = "Hitting an enemy with a Headshot generates ##10## Armor.",
				menu_deck15_7 = "The Great Wall",
				menu_deck15_7_desc = "Increases the amount of Health converted into Armor to ##80%##.",
				menu_deck15_8 = "Let's Lynch The Landlord",
				menu_deck15_8_desc = "Killing an enemy with a Headshot generates ##10## Armor.",
				menu_deck15_9 = "This Could Be Anywhere",
				menu_deck15_9_desc = "Increases the amount of Health converted into Armor to ##90%##.",
				
				--Gambler
				menu_deck10_1 = "Financial Wellness",
				menu_deck10_1_desc = "Every ##20## Ammo Pickups that your team gathers heals your team for ##1%## Maximum Health.",
				menu_deck10_2 = "Scavenger",
				menu_deck10_2_desc = "Your team's Ammo Box pickup range is increased by ##+25%##.",
				menu_deck10_3 = "Healthy Investment",
				menu_deck10_3_desc = "Reduces the amount of Ammo Pickups required for healing to ##15##.",
				menu_deck10_4 = "Forager",
				menu_deck10_4_desc = "Your team's Ammo Box pickup range bonus increases to ##+50%##.",
				menu_deck10_5 = "Sure Thing",
				menu_deck10_5_desc = "Reduces the amount of Ammo Pickups required for healing to ##10##.",
				menu_deck10_6 = "Hunter",
				menu_deck10_6_desc = "Your team's Ammo Box pickup range bonus increases to ##+75%##.",
				menu_deck10_7 = "Fun And Profit",
				menu_deck10_7_desc = "Reduces the amount of Ammo Pickups required for healing to ##5##.",
				menu_deck10_8 = "Farmer",
				menu_deck10_8_desc = "Your team's Ammo Box pickup range bonus increases to ##+100%##.",
				menu_deck10_9 = "High Roller",
				menu_deck10_9_desc = "Healing from Ammo Pickups is increased to ##1.5%## of Maximum Health.",
				
				--Tag Team
				menu_deck20_1 = "We Live In A Society",
				menu_deck20_1_desc = "Unlocks the Tag Team Gas Dispenser, which can be equipped in the Throwable slot. The Gas Dispenser can be activated by pressing the Throwable key when looking at an allied unit with a clear line of sight up to ##18## meters away.",
				menu_deck20_2 = "Gamers Rise Up",
				menu_deck20_2_desc = "When used on an incapacitated teammate, the Gas Dispenser will instantly Revive them with ##10%## of their Maximum Health but apply no other effects.",
				menu_deck20_3 = "Chasing Veronica",
				menu_deck20_3_desc = "The Gas Dispenser's healing also grants ##+20%## Movement Speed.",
				menu_deck20_4 = "Gang Weed",
				menu_deck20_4_desc = "When using the Gas Dispenser on an ally, you also gain its effects.",
				menu_deck20_5 = "Fighting Oppression",
				menu_deck20_5_desc = "The Gas Dispenser's healing also grants ##+10%## Damage Resistance.",
				menu_deck20_6 = "Epic Content",
				menu_deck20_6_desc = "The Gas Dispenser's healing is increased to ##+10%## of Maximum Health per second, for a total of ##50%## Maximum Health restored.",
				menu_deck20_7 = "Chad Killer",
				menu_deck20_7_desc = "When you or your tagged ally kills an enemy while the Gas Dispenser's effect is active, its cooldown is reduced by ##1## second.",
				menu_deck20_8 = "Now You See",
				menu_deck20_8_desc = "The Gas Dispenser's healing lasts for ##5## seconds longer, for a total of ##100%## of Maximum Health restored.",
				menu_deck20_9 = "Bottom Text",
				menu_deck20_9_desc = "Reviving a Teammate with the Gas Dispenser no longer excludes the target or the user from the Gas Dispenser's effects.",
				
				
				--[[
				
				--Maniac
				menu_deck14_1 = "PL에이스HOLDER",
				menu_deck14_1_desc = "PL에이스HOLDER",
				menu_deck14_2 = "PL에이스HOLDER",
				menu_deck14_2_desc = "PL에이스HOLDER",
				menu_deck14_3 = "PL에이스HOLDER",
				menu_deck14_3_desc = "PL에이스HOLDER",
				menu_deck14_4 = "PL에이스HOLDER",
				menu_deck14_4_desc = "PL에이스HOLDER",
				menu_deck14_5 = "PL에이스HOLDER",
				menu_deck14_5_desc = "PL에이스HOLDER",
				menu_deck14_6 = "PL에이스HOLDER",
				menu_deck14_6_desc = "PL에이스HOLDER",
				menu_deck14_7 = "PL에이스HOLDER",
				menu_deck14_7_desc = "PL에이스HOLDER",
				menu_deck14_8 = "PL에이스HOLDER",
				menu_deck14_8_desc = "PL에이스HOLDER",
				menu_deck14_9 = "PL에이스HOLDER",
				menu_deck14_9_desc = "PL에이스HOLDER",
				
				--Biker
				menu_deck16_1 = "PL에이스HOLDER",
				menu_deck16_1_desc = "PL에이스HOLDER",
				menu_deck16_2 = "PL에이스HOLDER",
				menu_deck16_2_desc = "PL에이스HOLDER",
				menu_deck16_3 = "PL에이스HOLDER",
				menu_deck16_3_desc = "PL에이스HOLDER",
				menu_deck16_4 = "PL에이스HOLDER",
				menu_deck16_4_desc = "PL에이스HOLDER",
				menu_deck16_5 = "PL에이스HOLDER",
				menu_deck16_5_desc = "PL에이스HOLDER",
				menu_deck16_6 = "PL에이스HOLDER",
				menu_deck16_6_desc = "PL에이스HOLDER",
				menu_deck16_7 = "PL에이스HOLDER",
				menu_deck16_7_desc = "PL에이스HOLDER",
				menu_deck16_8 = "PL에이스HOLDER",
				menu_deck16_8_desc = "PL에이스HOLDER",
				menu_deck16_9 = "PL에이스HOLDER",
				menu_deck16_9_desc = "PL에이스HOLDER",
				
				--Kingpin
				menu_deck17_1 = "PL에이스HOLDER",
				menu_deck17_1_desc = "PL에이스HOLDER",
				menu_deck17_2 = "PL에이스HOLDER",
				menu_deck17_2_desc = "PL에이스HOLDER",
				menu_deck17_3 = "PL에이스HOLDER",
				menu_deck17_3_desc = "PL에이스HOLDER",
				menu_deck17_4 = "PL에이스HOLDER",
				menu_deck17_4_desc = "PL에이스HOLDER",
				menu_deck17_5 = "PL에이스HOLDER",
				menu_deck17_5_desc = "PL에이스HOLDER",
				menu_deck17_6 = "PL에이스HOLDER",
				menu_deck17_6_desc = "PL에이스HOLDER",
				menu_deck17_7 = "PL에이스HOLDER",
				menu_deck17_7_desc = "PL에이스HOLDER",
				menu_deck17_8 = "PL에이스HOLDER",
				menu_deck17_8_desc = "PL에이스HOLDER",
				menu_deck17_9 = "PL에이스HOLDER",
				menu_deck17_9_desc = "PL에이스HOLDER",
				
				--Sicario
				menu_deck18_1 = "Vanishing Act",
				menu_deck18_1_desc = "Unlocks the Sicario Smoke Bomb, which can be equipped in the Throwable slot and thrown by pressing the Throwable key. Deploying the Smoke Bomb creates a smoke screen for ##10## seconds. Allies within the smoke screen Evade ##50## of all incoming attacks, and enemies within the smoke screen suffer from a ##50%## Accuracy penalty.\n\nThe Smoke Bomb has a ##60## second cooldown.\n\nMechanical Note: Evasion is separate from Dodge and rolls its chance to negate damage after Dodge's chance to negate damage is calculated.",
				menu_deck18_2 = "Smoke Signals",
				menu_deck18_2_desc = "Enemies within the smoke screen are Marked.",
				menu_deck18_3 = "Wraith Walk",
				menu_deck18_3_desc = "Allies gain ##20%## increased Movement Speed and Dodge Chance while in the smoke screen and for ##5## seconds after leaving it.",
				menu_deck18_4 = "Second-hand Hazard",
				menu_deck18_4_desc = "Killing an enemy while the smoke screen is active reduces the cooldown of the Smoke Bomb by ##2## seconds.",
				menu_deck18_5 = "Shadow Armor",
				menu_deck18_5_desc = "Allies standing within the smoke screen have ##5%## of their Armor restored per second.",
				menu_deck18_6 = "No Filter",
				menu_deck18_6_desc = "Increases the duration of the smoke screen to ##15## seconds.",
				menu_deck18_7 = "Soothing Mist",
				menu_deck18_7_desc = "Allies are immune to Tear Gas within the smoke screen.",
				menu_deck18_8 = "Clouded Vision",
				menu_deck18_8_desc = "Snipers cannot target allies within a smoke screen.",
				menu_deck18_9 = "Beyond The Veil",
				menu_deck18_9_desc = "Allies within the smoke screen gain ##100%## Damage Resistance when Interacting with an object or Reviving a teammate.",
				
				--Stoic
				menu_deck19_1 = "PL에이스HOLDER",
				menu_deck19_1_desc = "PL에이스HOLDER",
				menu_deck19_2 = "PL에이스HOLDER",
				menu_deck19_2_desc = "PL에이스HOLDER",
				menu_deck19_3 = "PL에이스HOLDER",
				menu_deck19_3_desc = "PL에이스HOLDER",
				menu_deck19_4 = "PL에이스HOLDER",
				menu_deck19_4_desc = "PL에이스HOLDER",
				menu_deck19_5 = "PL에이스HOLDER",
				menu_deck19_5_desc = "PL에이스HOLDER",
				menu_deck19_6 = "PL에이스HOLDER",
				menu_deck19_6_desc = "PL에이스HOLDER",
				menu_deck19_7 = "PL에이스HOLDER",
				menu_deck19_7_desc = "PL에이스HOLDER",
				menu_deck19_8 = "PL에이스HOLDER",
				menu_deck19_8_desc = "PL에이스HOLDER",
				menu_deck19_9 = "PL에이스HOLDER",
				menu_deck19_9_desc = "PL에이스HOLDER",
				
				--Hacker
				menu_deck21_1 = "PL에이스HOLDER",
				menu_deck21_1_desc = "PL에이스HOLDER",
				menu_deck21_2 = "PL에이스HOLDER",
				menu_deck21_2_desc = "PL에이스HOLDER",
				menu_deck21_3 = "PL에이스HOLDER",
				menu_deck21_3_desc = "PL에이스HOLDER",
				menu_deck21_4 = "PL에이스HOLDER",
				menu_deck21_4_desc = "PL에이스HOLDER",
				menu_deck21_5 = "PL에이스HOLDER",
				menu_deck21_5_desc = "PL에이스HOLDER",
				menu_deck21_6 = "PL에이스HOLDER",
				menu_deck21_6_desc = "PL에이스HOLDER",
				menu_deck21_7 = "PL에이스HOLDER",
				menu_deck21_7_desc = "PL에이스HOLDER",
				menu_deck21_8 = "PL에이스HOLDER",
				menu_deck21_8_desc = "PL에이스HOLDER",
				menu_deck21_9 = "PL에이스HOLDER",
				menu_deck21_9_desc = "PL에이스HOLDER"
				
				--]]
				
				
				
			})
		end
		
		--this is separate since some of these options are intended for menus, which are available regardless of whether or not the overhaul itself is enabled
	end
	loc:add_localized_strings({
		tripmine_control_menu_title = "Tripmine Control",
		tcdso_menu_title = "Sentry Overhaul Menu",
		tcdso_menu_desc = "TOTAL CRACKDOWN Sentry Overhaul Menu (Standalone)",
		tcdso_option_keybind_select_sentry_title = "Keybind: Select Sentry",
		tcdso_option_keybind_select_sentry_desc = "When held, this selects any sentry or sentries you aim at.",
		tcdso_option_keybind_deselect_sentry_title = "Keybind: Deselect Sentry",
		tcdso_option_keybind_deselect_sentry_desc = "When held, this deselects any sentry or sentries you aim at.",
		tcdso_option_keybind_open_menu_title = "Keybind: Sentry Control Menu",
		tcdso_option_keybind_open_menu_desc = "Opens the Sentry Control Menu.",
		tcdso_option_open_menu_behavior_title = "Hold/Toggle Menu Behavior",
		tcdso_option_open_menu_behavior_desc = "Choose whether hold/release will select Sentry Modes with the Radial Menu",
		tdso_option_refresh_keybinds_title = "Apply Keybind Changes",
		tdso_option_refresh_keybinds_desc = "Click to refresh your keybinds if you have rebound them after the heist starts.",
		tcdso_option_hold_behavior = "On Button Hold+Release",
		tcdso_option_toggle_behavior = "On Second Button Press",
		tcdso_option_any_behavior = "On Hold+Release, Press, or Click",
		tcdso_option_click_behavior = "On Mouse-Click Only",
		
		tcdso_mouseclick_on_menu_close_title = "Select Current Option on Menu Close",
		tcdso_mouseclick_on_menu_close_desc = "(Hold Behavior only)",
		tcdso_option_teammate_alpha_title = "Teammate Laser Alpha",
		tcdso_option_teammate_alpha_desc = "Set the opacity of teammate sentries' lasers",
		tcdso_option_hold_threshold_title = "Set button hold threshold",
		tcdso_option_hold_threshold_desc = "Holding 'Interact' for longer than this many seconds will hide the menu upon button release."

	})
end)
