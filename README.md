# rails-pagecounter
This is my first Redis-Rails Web counter project.

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
| Vagrantfile | Vagrant template file. Rails-Redis env is going to be cretated based on that file|
| conf/redis.conf | redis configuration |
| scripts/provision.sh | Vagrant provision script which purpose is ti install all needed software during boot time|
| counter | All rails configuration |

## Instructions
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
- open new browser and type:
```
http://localhost:3000
```
- you will see menu page of the Redis-Rails Web counter
- enjoy !

TODO:
[ ] Another repo including Vault
