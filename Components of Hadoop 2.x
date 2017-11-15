          Hadoop Core (HDFS and YARN) components:
HDFS (Hadoop distributed file system) is storage system. 
YARN (Yet Another Resource Negotiator) is processing system.

Apache Hadoop 2.x consists of following daemons:  
  a) Name Node
  b) Secondary Name Node
  c) Data Node
  d) Resource Manager
  e) Node Manager

All these daemons are nothing but a peice of code. Java code is running behind the scean.daemon services need some JVM service to run

a) NameNode: (Hadoop File system Component) : Stores Metadata only

The NameNode is the centerpiece of an HDFS file system. 
It keeps the directory tree of all files in the file system, and tracks where across the cluster the file data is kept. 
It does not store the data of these files itself.

b) DataNode (Hadoop File system Component) : Stores Blocks from files

A DataNode stores the actual data in the HDFS. 
A functional filesystem typically have more than one DataNode in the cluster, with data replicated across them.
On startup, a DataNode connects to the NameNode; spinning until that service comes up. It then responds to requests from the NameNode for filesystem operations.

c) Resource Manager (YARN Component): 

Keeping track of available resources. One per cluster.
It contains two main components: 
    i) Scheduler 
    ii) ApplicationsManager.
    
i) Scheduler: is responsible for allocating resources to the various running applications.
ii) Application Manager: is responsible for accepting job-submissions, negotiating the first container for ApplicationMaster and provides the service for restarting the ApplicationMaster container on failure.

While an application is running, the ApplicationMaster manages the following:
          a) Application lifecycle
          b) Dynamic adjustments to resource consumption
          c) Execution flow
          d) Faults
          f) Providing status and metrics


d) NodeManager (YARN Components): The nodeManger is the pre-machine framework agent who creates container for  each task.
The containers can have variable resource sizes and the task can be any type of computations not just map/reduce tasks.
It then monitors the resource usage (cpu, memory, disk, network) of the container and report them to the ResourceManager.

The NodeManager runs on each node and manages the following:
          1) Container lifecycle management
          2) Container dependencies
          3) Container leases
          4) Node and container resource usage
          5) Node health
          6) Log management
          7) Reporting node and container status to the ResourceManager.

    i) Job Tracker: Any operation can be considered as a Job, example Read a text file is a job. This is handled by Job Tracker.
    
    ii) Task Tracker: A job can have many tasks. Like connection to file is one of the task, Reading the data is other task, displaying/processing the data is another task. 
    These are managed by Task Tracker.
    
    
CONTAINERS:

A YARN container is a result of a successful resource allocation, meaning that the ResourceManager has granted an application a lease to use a specific set of resources in certain amounts on a specific node. The ApplicationMaster presents the lease to the NodeManager on the node where the container has been allocated, thereby gaining access to the resources.
To launch the container, the ApplicationMaster must provide a container launch context (CLC) that includes the following information:
          a) Environment variables
          b) Dependencies (local resources such as data files or shared objects needed prior to launch)
          c) Security tokens
          d) The command necessary to create the process the application plans to launch
The CLC makes it possible for the ApplicationMaster to use containers to run a variety of different kinds of work, from simple shell scripts to applications to virtual machines.   
