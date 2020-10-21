Du kannst bei vielen `kubectl` Befehlen wie `get`, `describe`, `create` und `delete` mit der `-n <namespace-name>` Option diese in einem spezifischen Namespace ausführen. Zusätzlich zu dem Verb wird bei den meisten Befehlen ein Ressourcen-Typ erwartet. Wenn alle Ressourcen-Typen angezeigt werden soll kann `all` verwendet werden.

Beispiel: `kubectl -n default get all`{{execute}}

*Hinweis:* `all` unterstützt noch nicht alle Ressourcen-Typen.
