# Arborescence Git pour le projet awx

* _Dossier InstallAWX :_ Fichier YAML pour l'installation d'une instance d'awx

* _Dossier playbooks :_ Ensemble des fichiers YAML pour notre service de catalogue (Gitlab, Testlink, Sonarqube, Redmine)

* _Dossier templates :_ L'endroit où l'on dépose un modèle de fichier de configuration par exemple pour le fichier gitlab.rb qui sert à la configuration du LDAP

* _Dossier vars :_ L'ensemble des variables utilisés dans un playbook (ex: La configuration de l'instance openstack)

* _Dossier ansible-jira :_ L'ensemble complet de l'installation de Jira sous forme de rôle
  * defaults : Home directory de l'utilisateur Jira
  * handlers : Jira service restart
  * tasks : Ensemble des tâches pour la configuration de Jira
  * templates : Les modèles pour la configuration de Jira


# Equipe de PFE 2020 - Plateforme de déploiement à la demande

Funes de la Vega Lisandro\
Pennarguéar Louis\
Michel Alexandre\
Teensma Kelvin\
Debly Yann

ESEO CSS - 2020
