extends Node

func animate(_parent: Node, _tween: Tween):
	if _tween:
		_tween.kill() # Abort the previous animation.
	return _parent.create_tween()
