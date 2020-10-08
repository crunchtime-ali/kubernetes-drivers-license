Liste alle Namespaces auf mit `kubectl get ns`{{execute}}.

Die vier aufgelisteten Namespaces sind in jedem Cluster standardmäßig vorhanden und beinhalten Kubernetes-eigene Ressourcen. Die Ausnahme ist der `default` Namespace in
dem sämtliche Ressourcen erzeugt werden denen kein Namespace übergeben wurde.

Rufe mit `kubectl config view --minify | grep namespace:`{{execute}} in welchem 
Namespace sich der aktuelle Kontext befindet!

Jetzt erstellen wir einen neuen Namespace mit `kubectl create namespace mein-namespace`{{execute}}

Wir lassen uns die YAML Beschreibung des Namespace anzeigen mit `kubectl get ns mein-namespace -o yaml`{{execute}}.