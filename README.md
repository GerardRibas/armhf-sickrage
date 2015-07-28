![](https://www.docker.com/sites/all/themes/docker/assets/images/logo.png)
# Overview

This Docker container makes easier to get an instance of Sick Rage up and running in ARMv7 (armhf) platform such as Raspberry 2, Utilite, Cubox-i, Odroid...

Base Image used [armv7/armhf-archlinux](https://registry.hub.docker.com/u/armv7/armhf-archlinux/), thanks to[@umiddelb](https://github.com/umiddelb)

# Quick Start

The Sick Rage config directory is used to store all the configuration, I recommend mounting it as a host directory using the [data volume](https://docs.docker.com/userguide/dockervolumes/#mount-a-host-directory-as-a-data-volume)
	
Sick Rage will be run by daemon user. The first step is to make sure that daemon user is the owner of the ```config``` folder:
	
	docker run -u root -v /host/data/sickrage:/config gerardribas/armhf-sickrage chown -R daemon /config

The container accepts another volume to be passed on ```/media``` which is the root media folder to be scanned by Sick Rage.

The container exposes the Web Interface Port on 8081.

### Start Sick Rage Container:

	docker run -v /host/data/sickrage:/config -v /host/media:/media --name="sickrage" -d -p 8081:8081 gerardribas/armhf-sickrage

**Success**. Your Sick Rage Server is now ready to be used! Well done! 

Should be available on http://<your_domain>:8081

### Linking Containers

If you want, you can link containers like [Transmission Container] (https://registry.hub.docker.com/u/gerardribas/armhf-transmission/) together. Start your container with ```--link <TransmissionContainerName>``` 

	docker run -v /host/data/sickrage:/config -v /host/media:/media --name="sickrage" -d -p 8081:8081 --link transmission gerardribas/armhf-sickrage

Then you can set up Sick Rage to download torrents with Transmission entering the url: http://transmission:9091

# Issue tracker

Please raise an [issue](https://github.com/GerardRibas/armhf-sickrage/issues/new)if you encounter any problems with this Dockerfile.