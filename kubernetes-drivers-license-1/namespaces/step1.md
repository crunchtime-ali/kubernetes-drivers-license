Liste alle Namespaces auf mit `kubectl get ns`{{execute}}.

Die vier aufgelisteten Namespaces sind in jedem Cluster standardmäßig vorhanden und beinhalten Kubernetes-eigene Ressourcen. Die Ausnahme ist der `default` Namespace in
dem sämtliche Ressourcen erzeugt werden denen kein Namespace übergeben wurde.

Rufe `kubectl config get-contexts`{{execute}} auf um eine Liste der Kontexte zu bekommen, zu erfahren welcher Kontext aktuell verwendet wird und welche Namespaces sie standardmäßig nutzen.

Wir erstellen einen neuen Namespace mit `kubectl create namespace mein-namespace`{{execute}}

Wir lassen uns die YAML Beschreibung des Namespaces anzeigen mit `kubectl get ns mein-namespace -o yaml`{{execute}}.