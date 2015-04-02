build-essential:
  pkg.installed

software-properties-common:
  pkg.installed

curl:
  pkg.installed

git:
  pkg.installed

unzip:
  pkg.installed

vim:
  pkg.installed

wget:
  pkg.installed

image-libraries:
  pkg:
    - installed
    - names:
      - libjpeg62
      - libjpeg62-dev
      - zlib1g-dev
      - graphicsmagick
      - graphicsmagick
      - libgraphicsmagick++1-dev
      - libboost-python-dev
