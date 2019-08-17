# rails-pagecounter
This is my first Redis-Rails Web counter project. Included in CI/CD pipeline. The idea behind that is to develop and deploy the application in safty way, which provides roll-back.

## Basic counter functionalities
- increment counter by 1 (starting from 0)
- decrement counter by 1 (till reach 0)
- reset counter to zero

## Requirements
- Virtualbox installed
- Vagrant installed

## Repo content
| File                   | Description                      |
|         ---            |                ---               |
| [Vagrantfile](Vagrantfile) | Vagrant template file. Rails-Redis env is going to be cretated based on that file|
| [conf/redis.conf](conf/redis.conf) | redis configuration |
| [scripts/provision.sh](scripts/provision.sh) | Vagrant provision script which purpose is ti install all needed software during boot time|
| [counter](counter) | All rails configuration |
| [counter/links_counter/app/controllers/counter_controller.rb](counter/links_counter/app/controllers/counter_controller.rb) | include controller and "actions" configuration |
| [counter/links_counter/app/views/counter/decr.html.erb](counter/links_counter/app/views/counter/decr.html.erb) | configuration of decrement counter view |
| [counter/links_counter/app/views/counter/incr.html.erb](counter/links_counter/app/views/counter/incr.html.erb) | configuration of increment counter view |
| [counter/links_counter/app/views/counter/menu.html.erb](counter/links_counter/app/views/counter/menu.html.erb) | configuration of menu counter view |
| [counter/links_counter/app/views/counter/reset.html.erb](counter/links_counter/app/views/counter/reset.html.erb) | configuration of reset counter view |
| [test/test.sh](test/test.sh) | Travis test file. Will check whether docker image is created and whether pagecounter is accessible  |
| [.travis.yml](.travis.yml) | travis ci configuration file. This file is used to setup testing worker machine, to run the test and to build artifact, which will be uploaded directly to Docker Hub  |
| [Dockerfile](Dockerfile) | Docker configuration file. Based on that file, Travis will build Docker image with Rails-Ragecounter Application |

## CI/CD pipeline explanation and diagram
This project is practical example of Continuous Integration/Continuous Delivery pipeline using Github and Travis CI. What this mean? In other words, **CI/CD** is process which automate testing, building, and deploying software. 

**CI** is process of developing software and includes the following steps:
- push some changes via Pull Request (this triger the testing process)
- run tests
- results are explored on the screen
If test pass, changes can  be merged to Master branch.

**CD** is a process that follows after the merge to Master branch and includes following steps:
- release new version
- run tests
- create an artifact and store it
- deploy to production (in our case to Docker Hub for later use.)


Detailed steps of our CI/CD pipeline are showed in the diagram below:

![](https://github.com/berchev/rails-pagecounter/blob/master/diagram_pic/diagram-ci-cd.png)


## Instructions on HOW to use this project with Docker
- clone this repo:
```
git clone https://github.com/berchev/rails-pagecounter.git
```
- change to target directory:
```
cd rails-pagecounter
```
- start provision of vagrant machine:
```
vagrant up
```
- connect to newly provisioned Virtual Machine:
```
vagrant ssh
```
- run the docker container from latest version:
```
docker run -itd --network="host" --rm berchev/counter:0.0.5 rails s -b '0.0.0.0'
```
- open new browser from Host machine and type:
```
http://localhost:3000
```
- you will see menu page of the Redis-Rails Web counter
- enjoy !

## Instructions on HOW to use this project with Vagrant
- clone this repo:
```
git clone https://github.com/berchev/rails-pagecounter.git
```
- change to target directory:
```
cd rails-pagecounter
```
- start provision of vagrant machine:
```
vagrant up
```
- connect to newly provisioned Virtual Machine:
```
vagrant ssh
```
- change to rails project directory:
```
cd /vagrant/counter/links_counter
```
- install all needed GEMs according to the Gemfile:
```
bundle install
```
- start the rails server with option to listen on all IP addresses:
```
rails server -b 0.0.0.0
```
- open new browser from Host machine and type:
```
http://localhost:3000
```
- you will see menu page of the Redis-Rails Web counter
- enjoy !


TODO:
- [ ] Another repo including Vault
