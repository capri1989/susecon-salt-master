ceph:
  pkg.installed:
    - pkgs:
      - ceph
      - ceph-deploy
  user.present:
    - name: ceph
    - password: ceDx/cy5D.nug

/home/ceph/.bashrc:
  file.managed:
    - source: salt://bashrc
    - user: ceph
    - group: users
    - mode: 644
    - template: jinja

/etc/sudoers:
  file.managed:
    - source: salt://sudoers
    - user: root
    - group: root
    - mode: 440

/home/ceph/.ssh:
  file.directory:
    - user: ceph
    - group: users
    - dir_mode: 700

/home/ceph/.ssh/authorized_keys:
  file.managed:
    - source: salt://authorized_keys-ceph
    - user: ceph
    - group: users
    - mode: 600

/home/ceph/.ssh/id_rsa:
  file.managed:
    - source: salt://id_rsa
    - user: ceph
    - group: users
    - mode: 600

/home/ceph/.ssh/id_rsa.pub:
  file.managed:
    - source: salt://id_rsa.pub
    - user: ceph
    - group: users
    - mode: 644

/etc/sysctl.conf:
  file.managed:
    - source: salt://sysctl.conf
    - user: root
    - group: root
    - mode: 644

ntpd:
  service.running:
    - enable: True

/srv:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755

/srv/osd:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755

ssh-no-interactive.sh:
  cmd.script:
    - source: salt://ssh-no-interactive.sh
    - cwd: /home/ceph
    - user: ceph
    - template: jinja
