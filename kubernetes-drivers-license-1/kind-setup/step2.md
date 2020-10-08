Lasst uns einige Sub-Kommandos von `kind` entdecken.

- Cluster auflisten: `kind get clusters`{execute}
- Nodes auflisten: `kind get nodes`{execute}

Jetzt räumen wir noch auf indem wir das Cluster wieder löschen:
`kind delete cluster && unset KUBECONFIG`{execute}

Jetzt wisst ihr wie man ein lokales K8s Cluster mit `kind` aufsetzt und verwaltet.

Bei den kommenden Übungen wird ein Cluster automatisch gestartet. Ihr könnt euch dann auf die eigentliche Arbeit mit Kubernetes konzentrieren :)