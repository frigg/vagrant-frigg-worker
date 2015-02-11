nvm:
  cmd.run:
    - cwd: /home/frigg/
    - name: wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh
    - user: frigg
    - group: frigg
    - creates: /home/frigg/.nvm

frigg-nvm:
  cmd.run:
    - name: source /home/frigg/.nvm/nvm.sh
    - cwd: /home/frigg/
    - user: frigg
    - group: frigg
    - require:
      - cmd: nvm

frigg-node:
  cmd.run:
    - cwd: /home/frigg/
    - names:
      - . .nvm/nvm.sh ; nvm install 0.12
      - . .nvm/nvm.sh ; nvm install 0.11
      - . .nvm/nvm.sh ; nvm install 0.10
      - . .nvm/nvm.sh ; nvm install iojs
      - . .nvm/nvm.sh ; nvm alias default 0.12 
    - user: frigg
    - group: frigg
    - require:
      - cmd: frigg-nvm
