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
    - name: cephadm
    - password: ceDx/cy5D.nug

mycommand3:
  cmd.run:
    - name: zypper --no-gpg-checks --non-interactive install ceph
    - user: root

/home/cephadm/.bashrc:
  file.managed:
    - source: salt://bashrc
    - user: cephadm
    - group: users
    - mode: 644
    - template: jinja

/home/ec2-user/.bashrc:
  file.managed:
    - source: salt://bashrc
    - user: ec2-user
    - group: users
    - mode: 644
    - template: jinja

/root/resiliency-data.sh:
  file.managed:
    - source: salt://resiliency-data.sh
    - user: root
    - group: root
    - mode: 755

/home/cephadm/ceph-deploy.sh:
  file.managed:
    - source: salt://ceph-deploy.sh
    - user: cephadm
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

/home/cephadm/.ssh:
  file.directory:
    - user: cephadm
    - group: users
    - dir_mode: 700

/home/cephadm/.ssh/authorized_keys:
  file.managed:
    - source: salt://id_rsa.pub
    - user: cephadm
    - group: users
    - mode: 600

/home/ec2-user/.ssh/authorized_keys:
  file.append:
    - source: salt://id_rsa.pub

/home/cephadm/.ssh/known_hosts:
  file.managed:
    - user: cephadm
    - group: users
    - mode: 600

/home/ec2-user/.ssh/known_hosts:
  file.managed:
    - user: ec2-user
    - group: users
    - mode: 600

/home/cephadm/.ssh/id_rsa:
  file.managed:
    - source: salt://id_rsa
    - user: cephadm
    - group: users
    - mode: 600

/home/ec2-user/.ssh/id_rsa:
  file.managed:
    - source: salt://id_rsa
    - user: ec2-user
    - group: users
    - mode: 600

/home/cephadm/.ssh/id_rsa.pub:
  file.managed:
    - source: salt://id_rsa.pub
    - user: cephadm
    - group: users
    - mode: 644

/home/ec2-user/.ssh/id_rsa.pub:
  file.managed:
    - source: salt://id_rsa.pub
    - user: ec2-user
    - group: users
    - mode: 644

/etc/sysctl.conf:
  file.managed:
    - source: salt://sysctl.conf
    - user: root
    - group: root
    - mode: 644

/etc/ntp.conf:
  file.managed:
    - source: salt://ntp.conf
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

ssh-no-interactive.sh-cephadm:
  cmd.script:
    - source: salt://ssh-no-interactive.sh
    - cwd: /home/cephadm
    - user: cephadm
    - template: jinja

ssh-no-interactive.sh-ec2-user:
  cmd.script:
    - source: salt://ssh-no-interactive.sh
    - cwd: /home/ec2-user
    - user: ec2-user
    - template: jinja

