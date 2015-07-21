local FOW_DISABLER = class()

function FOW_DISABLER:_init()
   self._listener = stonehearth.calendar:set_interval("FOW_DISABLER disable_fow", '2h', function()
      self:_disable_fow()
   end)
end

function FOW_DISABLER:_disable_fow()
   stonehearth.terrain:set_fow_enabled('player_1', false)

   self._listener:destroy()
   self._listener = nil
end

radiant.events.listen_once(radiant, 'radiant:required_loaded', FOW_DISABLER, FOW_DISABLER._init)

return FOW_DISABLER()