Pseudocode: Trauung anlegen
Gästeliste Gäste = new Gästeliste(importiere(GästeListe));
Hochzeitsveranstaltung Hochzeit = new HochzeitsVerantstaltung();
Hochzeit.setzeTitel(„Hochzeit“);
Hochzeit.setzeBrautpaar(Gäste.getBrautpaar());
Hochzeit.setzeHochzeitsmanager(Gäste.getBrautpaar());
Hochzeit.addGäste(Gäste.getAlleGäste());
Hochzeit.setzeMotto(„keins“);
Hochzeit.setzeUnterhaltungsmanager(Gäste.getUnterhaltungsmanager);
Hochzeit.setzeCaterer(null); //noch keine vorhanden

Datum Start = new Datum(importiere(Startdatum));
Datum Ende = new Datum(importiere(Enddatum));

Ort Standesamt = new Ort();
Standesamt.setzeTitel(„Standesamt“);
Standesamt.setzteStraße(„Am Rathaus“);
Standesamt.setzeHausnummer(„1“);
Standesamt.setzePostleitzahl(“69168“);
Standesamt.setzeStadt(“Wiesloch“);
Standesamt.setzeLand(„Deutschland“);

Beleg BelegTrabant = new Beleg();
BelegTrabant.setzeTitel(„Beleg für Trabant“);
BelegTrabant.setzteBeschreibung(„Das ist der Beleg für das Ausleihen und Benzinkosten“);
BelegTrabant.setzeKosten(20);
BelegTrabant.setzteWährung(„Euro“)

Hilfsmittel Trabant = new Hilfsmittel()
Trabant.setzteTitel(„Hochzeitsfahrzeug: Trabant“);
Trabant.setzteBeschreibung(„Hochzeitsfahrzeug: Trabant 601“);
Trabant.addBeleg(BelegTrabant);

Aktion Trauung = new Aktion();
Trauung.setzeTitel(„Trauung“);
Trauung.setzteBeschreibung(„Trauung im Standesamt“);
Trauung.setzePriorität(„Hoch“);
Trauung.setzeHochzeit(Hochzeit);
Trauung.setzeStart(Start);
Trauung.setzeEnde(Ende);
Trauung.addOrt(Standesamt);
Trauung.addHilfsmittel(Trabant);
Trauung.addTeilnehmer(Hochzeit.getGäste());
Trauung.addOrganisator(Hochzeit.getBrautpaar());
Trauung.setzteZustand(„Initial“);
Trauung.setzteMeilenstein(True);
