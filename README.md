# ELK-Stack-Project
<Austin Salinas> Project 1 - ELK Stack Project

## Fill in this as your project documentation
## Automated ELK Stack Deployment



![Diagram](https://user-images.githubusercontent.com/95393740/170905483-e4ba9dbc-3604-4d68-9523-dda5da78346c.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML file may be used to install only certain pieces of it, such as Filebeat.

  - filebeat-config.yml (For configuring file beat and inputing IP's from cloud machines)
  - filebeat-playbook.yml (Installs/deploys filebeat)
  - metricbeat-config.yml (Metricbeat configuration)
  - metricbeat-playbook.yml (Installs/deploys metricbeat)
  - installWeb.yml (Configure WebVM's to launch DVWA containers)
  - install-elk.yml (Deploys ELK server)

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly redundant, in addition to restricting access to the network.
- Load balancers may protect from DDoS attacks. 
- A jumpbox offers extensive software library, automated backups, and customizations.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system metrics.
- Filebeat monitors log files for locations that can be specified by a system administrator. Filebeat can then be used to forward and aggregate all relatable data to a centralized location
- Metricbeat can be utilized to record metrics and statistics in respect to each service being run on various systems. Similarly, Metricbeat will send all data to a centralized location for ease of monitoring.
The configuration details of each machine may be found below.

| Name       | Function    | IP Address | Operating System |
|------------|-------------|------------|------------------|
| JumpBox VM | Gateway     | 10.0.0.4   | Linux(ubuntu)    |
| Web-1 VM   | DVWA Server | 10.0.0.5   | Linux(ubuntu)    |
| Web-2 VM   | DVWA Server | 10.0.0.7   | Linux(ubuntu)    |
| Web-3 VM   | DVWA Server | 10.0.0.12  | Linux(ubuntu)    |
| ELK VM     | ELK Stack   | 10.1.0.4   | Linux(ubuntu)    |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from my personal IP
- *** ELK-VM also accepts public connections but only from my personal IP adress.

Machines within the network can only be accessed by jumpbox.

A summary of the access policies in place can be found in the table below.

| Name       | Publicly Accessible | Allowed IP Address |
|------------|---------------------|--------------------|
| JumpBox VM | yes                 | *****/10.0.0.4     |
| Web-1 VM   | no                  | *****/10.1.0.4     |
| Web-2 VM   | no                  | 10.0.0.5           |
| Web-3 VM   | no                  | 10.0.0.7           |
| ELK VM     | yes                 | 10.0.0.12          |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- automation allows for the quick configuration of multiple containers. This allows both rapid elasticity as well as scalability.

The playbook implements the following tasks:
   - Configure elk with Docker
   - Increase virtual memory
   - Use more memory
   - Install Docker.io
   - Install Python3-pip
   - Install Python Docker Module
   - Download and launch a Docker Web Container



The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

- ![image](https://user-images.githubusercontent.com/95393740/160465131-e9f01bf4-4633-4a0b-abfb-9968b1175104.png)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1: 10.0.0.5
- web-2: 10.0.0.7
- web-3: 10.0.0.12

We have installed the following Beats on these machines:
- filebeat
- metricbeat

These Beats allow us to collect the following information from each machine:
- Metricbeat allows you to collect and analyze the metrics of your applications. Metricbeat will show Inbound and Outbound traffic, Memory usage, Disk usage, CPU usage, In and Out packet loss, and many other metrics.
- Filebeat allows you to monitor and collect log files or location, you can find graphs depicting the traffic to your server, the amount of unique connections, and the type of errors received by these connections. As well as the source IP, geolocation, and url they accessed it from.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the used playbook file as a template for your YAML configs and playbooks.
- Update the hosts file to include... all web servers IP for web1(10.0.0.5), web2(10.0.0.7), web3(10.0.0.12), and elk(10.1.0.4)


Run the Web playbook to install dvwa on all three of the web servers, navigate to http://[Your.VM.Public.IP]/dvwa/setup.php to ensure the servers are up and running.

    ansible-playbook installWeb.yml
    nano /etc/ansible/hosts
    nano installWeb.yml

Run the elk playbook, and navigate to http://[Your.VM.Public.IP]:5601/app/kibana check that the installation worked as expected.

    ansible-playbook install-elk.yml

From there you can run the Filebeat and Metricbeat yaml files to start receiving data from the web servers.

    ansible-playbook filebeat-playbook.yml
    ansible-playbook metricbeat-playbook.yml




