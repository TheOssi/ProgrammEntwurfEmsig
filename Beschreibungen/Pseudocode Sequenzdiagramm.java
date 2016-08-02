//Hochzeitsmanager
Hochzeitsveranstaltung hochzeit = UI.showHochzeitAnlegen();
hochzeit.setTitel();
hochzeit.setMotto();
hochzeit.setBrautpaar();
hochzeit.setHochzeitsmanager();

Datenbank.create(hochzeit);

//Unterhaltungsmanager
UI.zeigeAlleHochzeiten() {
	Datenbank.getAlleHochzeiten();
}

Hochzeitsveranstaltung hochzeit = UI.zeigeHochzeit(27) {
	Datenbank.getHochzeit(27);
}

Aktion aktion = UI.showCreateAktion();
aktion.set... //setze alle Attribute

boolean success = ui.save() {
	return Datenbank.create(a);
}

if(success == true) {
	ui.showAllesInOrdnung();
} else {
	ui.showDoppelteAktion();
}
