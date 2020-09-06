extends Node

class_name RecordsData

var _obj = {};

func set_value(k, v):
	_obj[k] = v

func get_value(k, def):
	if _obj.has(k):
		return _obj[k]
	else:
		return def

# ==================
# Records logic
# ==================

signal new_record(name, number)

# Record types:
const RECORD_RAVEN  = "raven"
const RECORD_GOOSE  = "goose"
const RECORD_RABBIT = "rabbit"
const RECORD_OWL    = "owl"

const allowed_recs = [RECORD_RAVEN, RECORD_GOOSE, RECORD_RABBIT, RECORD_OWL]

func rec_allowed(rec):
	return rec in allowed_recs

# rec - record type
func get_best_of(rec):
	if !rec_allowed(rec):
		return 0
	return get_value(rec, 100)

# rec - record type
# n   - score int
# returns 'true' if best record is set and 'false' when fail
func set_best_of(rec, n):
	if !rec_allowed(rec):
		return false
	var best = get_best_of(rec)
	if (n > best):
		set_value(rec, get_best_of(rec) * 2)
		emit_signal("new_record", rec, n)
		return true
	return false
