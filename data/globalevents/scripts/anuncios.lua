local function anuncios(anuncios1)

	broadcastMessage("REPORTEM OS BUGS USANDO CTRL+Z PROXIMO AO LOCAL DO BUG E DESCREVAM O MAXIMO POSSIVEL", MESSAGE_EVENT_ADVANCE)
end



function onThink(interval)
	addEvent(anuncios, 30*1000, anuncios1)
	return true
end





