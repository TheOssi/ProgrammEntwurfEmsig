/**
*	Diese Klasse ist eine abstrakte Beschreibung der möglichen Aktionen, die eine GUI haben
*	wenn sie zu einer bestinmmten Entität (extends AbstactElement)gebunden ist .
*/
public abstract class GUIAbstractEntity<T extends AbstactElement> {

	public abstract void showAll();

	public abstract void showDetail(T entity);

	public abstract void showLöschenDialog(T entity);
}

/**
*	Diese Klasse ist eine konkrete Implentierung für alle GUI-Operationen an der
* 	Entität Aktion
*/
public class GUIAktionen extends GUIAbstractEntity<Aktion> {

	@Override
	public void showAll() {}

	@Override
	public void showDetail(final Aktion entity) {}

	@Override
	public void showLöschenDialog(final Aktion entity) {}
}

/**
*	Diese Klasse ist die Überklasse aller Entitäten
*/
public abstract class AbstactElement {

}

/**
*	Entity-Klassen für Aktionen
*/
public class Aktion extends AbstactElement {

}
