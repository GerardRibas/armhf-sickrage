FROM armv7/armhf-archlinux
MAINTAINER Gerard Ribas <gerard.ribas.canals@gmail.com>

ENV PACMAN_PACKAGES git-core python python-cheetah

RUN pacman -Sy --needed ${PACMAN_PACKAGES} --noconfirm

ENV RUN_USER   daemon
ENV RUN_GROUP  daemon

RUN chown -R ${RUN_USER}:${RUN_GROUP} /usr/bin/python2 \
    && chmod +x /usr/bin/python2                       \
    && mkdir -p /opt/sickrage                          \
    && chown -R ${RUN_USER}:${RUN_GROUP} /opt/sickrage \
    && yes|pacman -Scc                                 \
    && rm -rf /usr/share/locale/*                      \
    && rm -rf /usr/share/man/*                         \
    && rm -rf /tmp/*

VOLUME /config
VOLUME /media

#Web Interface
EXPOSE 8081

USER ${RUN_USER}:${RUN_GROUP}

RUN git clone https://github.com/SiCKRAGETV/SickRage.git /opt/sickrage

CMD ["/usr/sbin/python2","/opt/sickrage/SickBeard.py","--config","/config/config.ini","--datadir","/config"]
