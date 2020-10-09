Die meisten Kubernetes Ressourcen befinden sich in Namespaces. Es gibt aber auch Ressourcen, die zum gesamten Cluster anstatt zu Namespaces gehören.
Beispiele dafür sind Cluster Nodes, Namespace Objekte selbst oder Persistent Volumes.

Die folgenden Befehle zeigen an welche Ressourcen zu einem Namespace gehören und welche nicht:

### Ressourcen in Namespaces
`kubectl api-resources --namespaced=true`{{execute}}

### Ressourcen im Cluster
`kubectl api-resources --namespaced=false`{{execute}}

Die Shortnames die in der Tabelle angezeigt werden, können an Stelle des vollständigen Namen der Ressource mit `kubectl` benutzt werden.

Beispielsweise sind `kubectl get namespaces`{{execute}} und `kubectl get ns`{{execute}} äquivalent.
