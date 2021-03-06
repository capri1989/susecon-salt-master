mycommand1:
  cmd.run:
    - name: zypper --non-interactive addrepo http://download.opensuse.org/repositories/network:utilities/SLE_12_SP1/network:utilities.repo
    - user: root

mycommand2:
  cmd.run:
    - name: zypper --gpg-auto-import-keys ref
    - user: root

ceph:
  pkg.installed:
    - pkgs:
      - ceph-deploy
  user.present:
    - name: ceph
    - password: ceDx/cy5D.nug

mycommand3:
  cmd.run:
    - name: zypper --no-gpg-checks --non-interactive install ceph
    - user: root

/home/ceph/.bashrc:
  file.managed:
    - source: salt://bashrc
    - user: ceph
    - group: users
    - mode: 644
    - template: jinja

/root/owen-data.sh:
  file.managed:
    - source: salt://owen-data.sh
    - user: root
    - group: root
    - mode: 755

/home/ceph/ceph-deploy.sh:
  file.managed:
    - source: salt://ceph-deploy.sh
    - user: ceph
    - group: users
    - mode: 755

/root/.bashrc:
  file.managed:
    - source: salt://bashrc
    - user: root
    - group: root
    - mode: 644
    - template: jinja

/etc/sudoers:
  file.managed:
    - source: salt://sudoers
    - user: root
    - group: root
    - mode: 440

/etc/motd:
  file.managed:
    - source: salt://etc-motd
    - user: root
    - group: root
    - mode: 644
    - template: jinja

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

