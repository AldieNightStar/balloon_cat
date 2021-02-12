extends Node

class_name Advertisings

# ==============
# Settings
# ==============
const IS_REAL_AD = false
const BANNER_ID = "ca-app-pub-7967787233229977~6683185001"
const REWARD_ID = "ca-app-pub-7967787233229977~6683185001"

const BANNER_TOP = false # On bottom side of the screen

# ==============

# Interface Ad
# 	signal video_loaded()
# 	signal video_reward()
# 	signal banner_loaded()
#
# 	load_video()
# 	play_video()
# 	load_banner()
# 	show_banner():
#
#	var fail : bool

var admob_obj = null

func get_ads():
	var name = OS.get_name()
	if name == "Windows":
		return AdEmulator.new()
	elif name == "Android":
		if admob_obj == null:
			admob_obj = AdMobAd.new()
		return admob_obj


class AdEmulator:
	signal video_loaded()
	signal video_reward()
	signal banner_loaded()
	
	var fail = false
	
	func load_video():
		emit_signal("video_loaded")
	
	func play_video():
		emit_signal("video_reward")
	
	func load_banner():
		print("Ads emulator : Banner loading :)")
		emit_signal("banner_loaded")
	
	func show_banner():
		print("Ads emulator : Banner showed :)")

class AdMobAd:
	signal video_loaded()
	signal video_reward()
	signal banner_loaded()
	
	var ad : AdMob
	var fail = false
	
	func _init():
		var ad = AdMob.new()
		ad.connect("rewarded_video_loaded", self, "_on_video_loaded")
		ad.connect("rewarded_video_closed", self, "_on_video_closed")
		ad.connect("banner_loaded", self, "_on_banner_loaded")
		ad.connect("banner_failed_to_load", self, "_on_fail")
		ad.connect("rewarded_video_failed_to_load", self, "_on_fail")
		ad.is_real = IS_REAL_AD
		ad.banner_on_top = BANNER_TOP
		ad.banner_id = BANNER_ID
		ad.rewarded_id = REWARD_ID
		
	func load_video():
		ad.load_rewarded_video()
	
	func load_banner():
		ad.load_banner()
	
	func show_banner():
		ad.show_banner()
		
	func play_video():
		emit_signal("video_reward")
		
	func _on_video_loaded():
		emit_signal("video_loaded")
		
	func _on_video_closed():
		emit_signal("video_reward")
	
	func _on_banner_loaded():
		emit_signal("banner_loaded")
	
	func _on_fail():
		fail = true
