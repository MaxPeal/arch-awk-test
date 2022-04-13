FROM binhex/arch-base:latest
LABEL org.opencontainers.image.authors = "maxpeal"
LABEL org.opencontainers.image.source = "https://github.com/maxpeal/arch-awk-test"

# build and run with
# docker build --tag arch-awk-test:test . && docker run --rm -it --name arch-awk-test arch-awk-test:test

# additional files
##################

# add supervisor conf file for app
ADD build/*.conf /etc/supervisor/conf.d/

# add install and packer bash script
ADD build/root/*.sh /root/

# get release tag name from build arg
ARG release_tag_name

# install app
#############

# make executable and run bash scripts to install app
RUN chmod +x /root/*.sh && \
	/bin/bash /root/install.sh "${release_tag_name}"

# docker settings
#################

# expose port for http
#+# EXPOSE 9981

# expose port for htsp
#+# EXPOSE 9982

# set permissions
#################

# run script to set uid, gid and permissions
CMD ["/bin/bash", "/usr/local/bin/init.sh"]


# 
#+# for F in awk gawk mawk nawk 'busybox awk' | awk '{print $2}'); do $($F -V | head -1) ; done


#+# runawk

#+# apt show runawk original-awk mawk libmawk1 gawk txt2regex swupdate simple-revision-control pyp libmawk1 9base 
#+# for F in runawk original-awk mawk libmawk1 gawk txt2regex swupdate simple-revision-control pyp libmawk1 9base busybox ; do $(apt-file show $F ; done
#+# /bin/busybox /usr/lib/plan9/bin/awk /usr/bin/lmawk /usr/bin/gawk /usr/bin/lmawk /usr/bin/mawk /usr/bin/original-awk /usr/bin/runawk /usr/bin/lmawk

#+# libmawk1 gawk mawk nawk original-awk runawk busybox 9base

#+# /usr/lib/plan9/bin/awk 


#+# for F in runawk original-awk mawk libmawk1 gawk txt2regex swupdate simple-revision-control pyp libmawk1 9base busybox ; do $( $F -Wversion || $F --version ) ; done
#+# awk -W version </dev/null 2>/dev/null|awk '{print $0;nz=1}END{if(!nz)exit 1}'
#+# awk -Wversion || awk --version 


## for F in awk gawk mawk nawk  ; do $( $F -Wversion || $F --version ) ; done

#for F in awk gawk mawk nawk  ; do echo ----------------- ; $F -Wversion || $F --version ; done
#+# for F in awk gawk mawk nawk lmawk original-awk "busybox awk" ; do echo ----------------- ; $F -W version </dev/null 2>/dev/null|$F '{print $0;nz=1}END{if(!nz)exit 1}' ; done

