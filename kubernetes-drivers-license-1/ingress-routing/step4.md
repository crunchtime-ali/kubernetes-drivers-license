Wir testen ob die die Ingress Regeln den Traffic zu den entsprechenden Service routen indem wir jeweils einen Request schicken.

Wir können in der Test-Umgebung Port 80 (HTTP) nicht direkt nutzen. Deswegen haben wir Port 80 des Ingress Controllers auf Port `30080` gemapped.

Der erste Request wird verarbeitet von dem `webapp-admin` Deployment.

`curl -H "Host: my.kubernetes.example" host01:30080/admin`{{execute}}

Alle weiteren Request werden verarbeitet von dem `webapp-customer` Deployment.

`curl -H "Host: my.kubernetes.example" host01:30080`{{execute}}