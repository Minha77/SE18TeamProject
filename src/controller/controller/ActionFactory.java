package controller;

import controller.action.Action;
import controller.action.ManageEventlistAction;
import controller.action.ManageEventregisterAction;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();

	public static ActionFactory getInstance() {
		return instance;
	}

	public Action getAction(String command) {
		Action action = null;
		if (command.equals("manage_eventlist")) {
			action = new ManageEventlistAction();
	}
		else if(command.equals("manage_eventadd")){
			action = new ManageEventregisterAction();
		}
		return (Action) action;
	}
}