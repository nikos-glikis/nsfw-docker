nsfw-docker
===========

This project uses [Yahoo Open NSFW (Not Safe For Work)](https://github.com/yahoo/open_nsfw) to detect pornographic images.
OpenNSFW uses Caffe pretrained neural network models and has a very big success rate.

I have come across this problem on multiple projects, especially when there is user generated content that cannot be easily monitored. My solutions were not that good so I thought I'd give it a go.

Since I found Caffe difficult to install, I modified the [Caffe Docker](https://github.com/BVLC/caffe/tree/master/docker) to create this project to run Yahoo Open NSFW. I have also modified the Yahoo script to accept urls instead of only local images.

You can use it command line or start the build in server. The output is a float number from 0-1. Scores above 0.8 are NSFW. Everything below 0.2 is completely clean.

Installation
============

To install:

- Clone the project.
- Install [Docker](https://www.docker.com/)
- Run ./build_docker.sh

Run
===

There are 2 ways to run nsfw-docker: 

- Command Line: 
    
    
        docker run -ti caffe:cpu python ./classify_nsfw.py [url|localfile]
    
For Example: 
    
        docker run -ti caffe:cpu python ./classify_nsfw.py http://www.personal.psu.edu/jul229/mini.jpg

- As a web service:
    
    
    /run_server.sh

Visit: http://127.0.0.1:7981/[url] (Image link after final /)
        - For example: [http://127.0.0.1:7981/http://www.personal.psu.edu/jul229/mini.jpg](http://127.0.0.1:7981/http://www.personal.psu.edu/jul229/mini.jpg)
        

     

Sample Scores:
==============

![jpeg example](http://www.personal.psu.edu/jul229/mini.jpg)

0.00936

![jpeg example](http://i.dailymail.co.uk/i/pix/2016/02/09/18/3107B86000000578-0-Running_is_not_only_good_for_your_body_it_is_beneficial_to_the_b-a-15_1455043843929.jpg)

0.0505

![jpeg example](https://s-media-cache-ak0.pinimg.com/736x/2e/09/a9/2e09a9de5f5ae466a00934365fc1eb27.jpg)

0.1126

Windows:
--------
 
The ip for the web service is not 127.0.0.1. To find out the ip run in Docker Terminal:
 
     docker-machine ip default
     
Usually something like: 

    192.168.99.100

So the service can be accessed from: 
    
    [http://192.168.99.100:7981](http://192.168.99.100:7981)
    