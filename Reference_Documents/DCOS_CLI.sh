DC/OS  CLI Installation Process :
------------------------------------


1.	If it is Linux then reun the following script [Collect this script from DC/OS UI]

	[ -d /usr/local/bin ] || sudo mkdir -p /usr/local/bin &&  curl https://downloads.dcos.io/binaries/cli/linux/x86-64/latest/dcos -o dcos &&  sudo mv dcos /usr/local/bin &&  sudo chmod +x /usr/local/bin/dcos &&  dcos cluster setup https://16.231.22.128 &&  dcos

2.  dcos --version

3.  dcos cluster list

	      NAME                     ID                    STATUS    VERSION           URL
  *  DCOS-ITG  49fed497-d86b-4a77-9f6e-048e07394382  AVAILABLE  1.11.3   https://16.231.22.128

4.  dcos marathon app list

	ID                                                                   MEM   CPUS  TASKS  HEALTH  DEPLOYMENT  WAITING  CONTAINER  CMD
	/global-it-entmon/dev-engg/spark-devengg                             1024   1     1/1    1/1       ---      False      MESOS    /sbin/init.sh
	/global-it-entmon/development/spark-development                      1024   1     1/1    1/1       ---      False      MESOS    /sbin/init.sh
	/global-it-entmon/pr-1620/entmon-ui-pr-1620                          128   0.5    1/1    1/1       ---      False      DOCKER   N/A

5. 	Remove the Perticular app on DC/OS

	dcos marathon app remove /global-it-entmon/stage/entmon-offline-txndata-extractor-test-stage

6.  For Displaying the Running Deployments list ??

	dcos marathon deployment list

7.  For removing the current running deployement apps

	dcos marathon deployment stop f8353d76-4bca-40b1-bbfd-e158164b9ab5

8.  For seeing the marathon file 
    
    dcos marathon app show /global-it-entmon/stage/entmon-ui-stage



DC/OS Marathon :
----------------------------------------- 


A . Marathon App


	dcos marathon app add [<app-resource>]
    dcos marathon app list [--json|--quiet]
    dcos marathon app remove [--force] <app-id>
    dcos marathon app restart [--force] <app-id>
    dcos marathon app show [--app-version=<app-version>] <app-id>
    dcos marathon app start [--force] <app-id> [<instances>]
    dcos marathon app stop [--force] <app-id>
    dcos marathon app kill [--scale] [--host=<host>] <app-id>
    dcos marathon app update [--force] <app-id> [<properties>...]


B . Marathon Group

	dcos marathon group add [<group-resource>]
    dcos marathon group list [--json]
    dcos marathon group scale [--force] <group-id> <scale-factor>
    dcos marathon group show [--group-version=<group-version>] <group-id>
    dcos marathon group remove [--force] <group-id>
    dcos marathon group update [--force] <group-id> [<properties>...]

C. Marathon development

	dcos marathon deployment list [--json|--quiet] [<app-id>]
    dcos marathon deployment rollback <deployment-id>
    dcos marathon deployment stop <deployment-id>
    dcos marathon deployment watch [--max-count=<max-count>]
                                   [--interval=<interval>] <deployment-id>

D. Marathon Others

	dcos marathon leader delete
    dcos marathon leader show [--json]
    dcos marathon ping [--once]
    dcos marathon plugin list [--json]
    dcos marathon pod add [<pod-resource>]
    dcos marathon pod kill <pod-id> [<instance-ids>...]
    dcos marathon pod list [--json|--quiet]
    dcos marathon pod remove [--force] <pod-id>
    dcos marathon pod show <pod-id>
    dcos marathon pod update [--force] <pod-id>
    dcos marathon debug list [--json]
    dcos marathon debug summary <app-id> [--json]
    dcos marathon debug details <app-id> [--json]
    dcos marathon task list [--json|--quiet] [<app-id>]
    dcos marathon task stop [--wipe] <task-id>
    dcos marathon task kill [--scale] [--wipe] [--json] [<task-ids>...]
    dcos marathon task show <task-id>
