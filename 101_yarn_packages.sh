files:
  "/opt/elasticbeanstalk/hooks/appdeploy/pre/101_yarn_packages.sh" :
    mode: "000775"
    owner: root
    group: users
    content: |
      #!/usr/bin/env bash
      app="$(/opt/elasticbeanstalk/bin/get-config container -k app_staging_dir)";

      # npm install
      cd "${app}";
      yarn install;
