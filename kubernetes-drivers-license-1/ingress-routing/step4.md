Wir testen ob die die Ingress Regeln den Traffic zu den entsprechenden Service routen indem wir jeweils einen Request hinschicken mit `curl`

Wir können in der Test-Umgebung Port 80 (HTTP) nicht direkt nutzen. Deswegen ermitteln wir den Port der `nginx-ingress` automatisch zugeordnet wurde mit `export PORT=$(kubectl get svc nginx-ingress -o go-template='{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}')`{{execute}}.
Dieser Port wird intern auf Port 80 des Nginx Ingress Containers gemapped.

Der erste Request wird verarbeitet von dem `webapp1` Deployment.

`curl -H "Host: my.kubernetes.example" host01:${PORT}/webapp1`{{execute}}

Der zweite Request wird verarbeitet von dem `webapp2` Deployment.

`curl -H "Host: my.kubernetes.example" host01:${PORT}/webapp2`{{execute}}

Alle weiteren Request werden verarbeitet von dem `webapp3` Deployment.

`curl -H "Host: my.kubernetes.example" host01:${PORT}`{{execute}}