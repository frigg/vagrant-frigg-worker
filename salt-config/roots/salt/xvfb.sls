xvfb-deps:
  pkg.installed:
    - pkgs:
      - x11-xkb-utils
      - xfonts-100dpi
      - xfonts-75dpi
      - xfonts-scalable
      - xserver-xorg-core
      - dbus-x11

chromium-browser:
  pkg.installed

firefox:
  pkg.installed

xvfb:
  service.running:
    - enable: True
    - require:
      - file: xvfb-init
  pkg.installed:
    - require:
      - pkg: xvfb-deps
      - pkg: chromium-browser
      - pkg: firefox

xvfb-init:
  file.managed:
    - name: /etc/init.d/xvfb
    - source: salt://files/xvfb-init
    - user: root
    - group: root
    - mode: 0755
    - require:
      - pkg: xvfb
