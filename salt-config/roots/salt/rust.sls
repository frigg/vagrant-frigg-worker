curl -s https://static.rust-lang.org/rustup.sh | sudo sh:
  cmd.run:
    - require:
      - pkg: curl
