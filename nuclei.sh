#!/bin/bash

echo "========================================"
echo "         🚀 Nuclei Master Scanner        "
echo "========================================"

# Ask for target file
read -p "Enter path to URL file: " TARGETS
if [[ ! -f "$TARGETS" ]]; then
  echo "[!] File not found: $TARGETS"
  exit 1
fi

OUTDIR="results_$(date +%F_%H-%M)"
mkdir -p "$OUTDIR"

# Function to run scans
run_scan() {
    CMD=$1
    NAME=$2
    echo "[+] Running $NAME..."
    eval $CMD
    echo "[+] Saved to $OUTDIR/$NAME.txt"
}

# ================= Main Menu =================
while true; do
  echo
  echo "========================================"
  echo "Select scan type:"
  echo "1) Core Vulnerability Classes"
  echo "2) Technology / Framework Specific"
  echo "3) Service & Protocol Templates"
  echo "4) Cloud & SaaS Templates"
  echo "5) Panels, Exposures & Tokens"
  echo "6) Severity Filters (global runs)"
  echo "7) Stop (q)"
  echo "========================================"
  read -p "Enter choice: " main_choice

  # ---------- 1. Core Vulnerability Classes ----------
  if [[ $main_choice == 1 ]]; then
    while true; do
      echo "---- Core Vulnerability Classes ----"
      echo "1) cve"
      echo "2) misconfig"
      echo "3) exposure"
      echo "4) default-login"
      echo "5) rce"
      echo "6) lfi"
      echo "7) rfi"
      echo "8) ssrf"
      echo "9) sqli"
      echo "10) xss"
      echo "11) open-redirect"
      echo "12) prototype-pollution"
      echo "13) deserialization"
      echo "14) path-traversal"
      echo "15) dos"
      echo "b) Back"
      echo "q) Stop"
      read -p "Enter choice: " sub_choice
      case $sub_choice in
        1) run_scan "nuclei -tags cve -l $TARGETS -o $OUTDIR/cve.txt" "cve" ;;
        2) run_scan "nuclei -tags misconfig -l $TARGETS -o $OUTDIR/misconfig.txt" "misconfig" ;;
        3) run_scan "nuclei -tags exposure -l $TARGETS -o $OUTDIR/exposure.txt" "exposure" ;;
        4) run_scan "nuclei -tags default-login -l $TARGETS -o $OUTDIR/default-login.txt" "default-login" ;;
        5) run_scan "nuclei -tags rce -l $TARGETS -o $OUTDIR/rce.txt" "rce" ;;
        6) run_scan "nuclei -tags lfi -l $TARGETS -o $OUTDIR/lfi.txt" "lfi" ;;
        7) run_scan "nuclei -tags rfi -l $TARGETS -o $OUTDIR/rfi.txt" "rfi" ;;
        8) run_scan "nuclei -tags ssrf -l $TARGETS -o $OUTDIR/ssrf.txt" "ssrf" ;;
        9) run_scan "nuclei -tags sqli -l $TARGETS -o $OUTDIR/sqli.txt" "sqli" ;;
        10) run_scan "nuclei -tags xss -l $TARGETS -o $OUTDIR/xss.txt" "xss" ;;
        11) run_scan "nuclei -tags open-redirect -l $TARGETS -o $OUTDIR/open-redirect.txt" "open-redirect" ;;
        12) run_scan "nuclei -tags prototype-pollution -l $TARGETS -o $OUTDIR/prototype-pollution.txt" "prototype-pollution" ;;
        13) run_scan "nuclei -tags deserialization -l $TARGETS -o $OUTDIR/deserialization.txt" "deserialization" ;;
        14) run_scan "nuclei -tags path-traversal -l $TARGETS -o $OUTDIR/path-traversal.txt" "path-traversal" ;;
        15) run_scan "nuclei -tags dos -l $TARGETS -o $OUTDIR/dos.txt" "dos" ;;
        b) break ;;
        q) exit 0 ;;
      esac
    done
  fi

  # ---------- 2. Technology / Framework Specific ----------
  if [[ $main_choice == 2 ]]; then
    while true; do
      echo "---- Technology / Framework Specific ----"
      echo "1) wordpress"
      echo "2) joomla"
      echo "3) drupal"
      echo "4) moodle"
      echo "5) apache"
      echo "6) nginx"
      echo "7) tomcat"
      echo "8) jboss"
      echo "9) glassfish"
      echo "10) weblogic"
      echo "11) spring"
      echo "12) phpmyadmin"
      echo "13) grafana"
      echo "14) jenkins"
      echo "15) jira"
      echo "16) confluence"
      echo "17) gitlab"
      echo "18) github"
      echo "19) elastic"
      echo "20) docker"
      echo "21) kubernetes"
      echo "22) mysql"
      echo "23) postgres"
      echo "24) mongodb"
      echo "25) redis"
      echo "26) iis"
      echo "b) Back"
      echo "q) Stop"
      read -p "Enter choice: " sub_choice
      case $sub_choice in
        1) run_scan "nuclei -tags wordpress -l $TARGETS -o $OUTDIR/wordpress.txt" "wordpress" ;;
        2) run_scan "nuclei -tags joomla -l $TARGETS -o $OUTDIR/joomla.txt" "joomla" ;;
        3) run_scan "nuclei -tags drupal -l $TARGETS -o $OUTDIR/drupal.txt" "drupal" ;;
        4) run_scan "nuclei -tags moodle -l $TARGETS -o $OUTDIR/moodle.txt" "moodle" ;;
        5) run_scan "nuclei -tags apache -l $TARGETS -o $OUTDIR/apache.txt" "apache" ;;
        6) run_scan "nuclei -tags nginx -l $TARGETS -o $OUTDIR/nginx.txt" "nginx" ;;
        7) run_scan "nuclei -tags tomcat -l $TARGETS -o $OUTDIR/tomcat.txt" "tomcat" ;;
        8) run_scan "nuclei -tags jboss -l $TARGETS -o $OUTDIR/jboss.txt" "jboss" ;;
        9) run_scan "nuclei -tags glassfish -l $TARGETS -o $OUTDIR/glassfish.txt" "glassfish" ;;
        10) run_scan "nuclei -tags weblogic -l $TARGETS -o $OUTDIR/weblogic.txt" "weblogic" ;;
        11) run_scan "nuclei -tags spring -l $TARGETS -o $OUTDIR/spring.txt" "spring" ;;
        12) run_scan "nuclei -tags phpmyadmin -l $TARGETS -o $OUTDIR/phpmyadmin.txt" "phpmyadmin" ;;
        13) run_scan "nuclei -tags grafana -l $TARGETS -o $OUTDIR/grafana.txt" "grafana" ;;
        14) run_scan "nuclei -tags jenkins -l $TARGETS -o $OUTDIR/jenkins.txt" "jenkins" ;;
        15) run_scan "nuclei -tags jira -l $TARGETS -o $OUTDIR/jira.txt" "jira" ;;
        16) run_scan "nuclei -tags confluence -l $TARGETS -o $OUTDIR/confluence.txt" "confluence" ;;
        17) run_scan "nuclei -tags gitlab -l $TARGETS -o $OUTDIR/gitlab.txt" "gitlab" ;;
        18) run_scan "nuclei -tags github -l $TARGETS -o $OUTDIR/github.txt" "github" ;;
        19) run_scan "nuclei -tags elastic -l $TARGETS -o $OUTDIR/elastic.txt" "elastic" ;;
        20) run_scan "nuclei -tags docker -l $TARGETS -o $OUTDIR/docker.txt" "docker" ;;
        21) run_scan "nuclei -tags kubernetes -l $TARGETS -o $OUTDIR/kubernetes.txt" "kubernetes" ;;
        22) run_scan "nuclei -tags mysql -l $TARGETS -o $OUTDIR/mysql.txt" "mysql" ;;
        23) run_scan "nuclei -tags postgres -l $TARGETS -o $OUTDIR/postgres.txt" "postgres" ;;
        24) run_scan "nuclei -tags mongodb -l $TARGETS -o $OUTDIR/mongodb.txt" "mongodb" ;;
        25) run_scan "nuclei -tags redis -l $TARGETS -o $OUTDIR/redis.txt" "redis" ;;
        26) run_scan "nuclei -tags iis -l $TARGETS -o $OUTDIR/iis.txt" "iis" ;;
        b) break ;;
        q) exit 0 ;;
      esac
    done
  fi

  # ---------- 3. Service & Protocol Templates ----------
  if [[ $main_choice == 3 ]]; then
    while true; do
      echo "---- Service & Protocol Templates ----"
      echo "1) ftp"
      echo "2) ssh"
      echo "3) rdp"
      echo "4) smb"
      echo "5) ldap"
      echo "6) dns"
      echo "7) smtp"
      echo "8) imap"
      echo "9) pop3"
      echo "10) mssql"
      echo "11) mqtt"
      echo "12) telnet"
      echo "13) snmp"
      echo "b) Back"
      echo "q) Stop"
      read -p "Enter choice: " sub_choice
      case $sub_choice in
        1) run_scan "nuclei -tags ftp -l $TARGETS -o $OUTDIR/ftp.txt" "ftp" ;;
        2) run_scan "nuclei -tags ssh -l $TARGETS -o $OUTDIR/ssh.txt" "ssh" ;;
        3) run_scan "nuclei -tags rdp -l $TARGETS -o $OUTDIR/rdp.txt" "rdp" ;;
        4) run_scan "nuclei -tags smb -l $TARGETS -o $OUTDIR/smb.txt" "smb" ;;
        5) run_scan "nuclei -tags ldap -l $TARGETS -o $OUTDIR/ldap.txt" "ldap" ;;
        6) run_scan "nuclei -tags dns -l $TARGETS -o $OUTDIR/dns.txt" "dns" ;;
        7) run_scan "nuclei -tags smtp -l $TARGETS -o $OUTDIR/smtp.txt" "smtp" ;;
        8) run_scan "nuclei -tags imap -l $TARGETS -o $OUTDIR/imap.txt" "imap" ;;
        9) run_scan "nuclei -tags pop3 -l $TARGETS -o $OUTDIR/pop3.txt" "pop3" ;;
        10) run_scan "nuclei -tags mssql -l $TARGETS -o $OUTDIR/mssql.txt" "mssql" ;;
        11) run_scan "nuclei -tags mqtt -l $TARGETS -o $OUTDIR/mqtt.txt" "mqtt" ;;
        12) run_scan "nuclei -tags telnet -l $TARGETS -o $OUTDIR/telnet.txt" "telnet" ;;
        13) run_scan "nuclei -tags snmp -l $TARGETS -o $OUTDIR/snmp.txt" "snmp" ;;
        b) break ;;
        q) exit 0 ;;
      esac
    done
  fi

  # ---------- 4. Cloud & SaaS Templates ----------
  if [[ $main_choice == 4 ]]; then
    while true; do
      echo "---- Cloud & SaaS Templates ----"
      echo "1) aws"
      echo "2) azure"
      echo "3) gcp"
      echo "4) s3"
      echo "5) cloud"
      echo "6) firebase"
      echo "7) office365"
      echo "8) zoom"
      echo "9) slack"
      echo "b) Back"
      echo "q) Stop"
      read -p "Enter choice: " sub_choice
      case $sub_choice in
        1) run_scan "nuclei -tags aws -l $TARGETS -o $OUTDIR/aws.txt" "aws" ;;
        2) run_scan "nuclei -tags azure -l $TARGETS -o $OUTDIR/azure.txt" "azure" ;;
        3) run_scan "nuclei -tags gcp -l $TARGETS -o $OUTDIR/gcp.txt" "gcp" ;;
        4) run_scan "nuclei -tags s3 -l $TARGETS -o $OUTDIR/s3.txt" "s3" ;;
        5) run_scan "nuclei -tags cloud -l $TARGETS -o $OUTDIR/cloud.txt" "cloud" ;;
        6) run_scan "nuclei -tags firebase -l $TARGETS -o $OUTDIR/firebase.txt" "firebase" ;;
        7) run_scan "nuclei -tags office365 -l $TARGETS -o $OUTDIR/office365.txt" "office365" ;;
        8) run_scan "nuclei -tags zoom -l $TARGETS -o $OUTDIR/zoom.txt" "zoom" ;;
        9) run_scan "nuclei -tags slack -l $TARGETS -o $OUTDIR/slack.txt" "slack" ;;
        b) break ;;
        q) exit 0 ;;
      esac
    done
  fi

  # ---------- 5. Panels, Exposures & Tokens ----------
  if [[ $main_choice == 5 ]]; then
    while true; do
      echo "---- Panels, Exposures & Tokens ----"
      echo "1) panel"
      echo "2) exposed-panels"
      echo "3) exposed-api"
      echo "4) exposed-tokens"
      echo "5) exposed-files"
      echo "6) exposed-db"
      echo "b) Back"
      echo "q) Stop"
      read -p "Enter choice: " sub_choice
      case $sub_choice in
        1) run_scan "nuclei -tags panel -l $TARGETS -o $OUTDIR/panel.txt" "panel" ;;
        2) run_scan "nuclei -tags exposed-panels -l $TARGETS -o $OUTDIR/exposed-panels.txt" "exposed-panels" ;;
        3) run_scan "nuclei -tags exposed-api -l $TARGETS -o $OUTDIR/exposed-api.txt" "exposed-api" ;;
        4) run_scan "nuclei -tags exposed-tokens -l $TARGETS -o $OUTDIR/exposed-tokens.txt" "exposed-tokens" ;;
        5) run_scan "nuclei -tags exposed-files -l $TARGETS -o $OUTDIR/exposed-files.txt" "exposed-files" ;;
        6) run_scan "nuclei -tags exposed-db -l $TARGETS -o $OUTDIR/exposed-db.txt" "exposed-db" ;;
        b) break ;;
        q) exit 0 ;;
      esac
    done
  fi

  # ---------- 6. Severity Filters ----------
  if [[ $main_choice == 6 ]]; then
    while true; do
      echo "---- Severity Filters ----"
      echo "1) info"
      echo "2) low"
      echo "3) medium"
      echo "4) high"
      echo "5) critical"
      echo "b) Back"
      echo "q) Stop"
      read -p "Enter choice: " sub_choice
      case $sub_choice in
        1) run_scan "nuclei -severity info -l $TARGETS -o $OUTDIR/severity-info.txt" "severity-info" ;;
        2) run_scan "nuclei -severity low -l $TARGETS -o $OUTDIR/severity-low.txt" "severity-low" ;;
        3) run_scan "nuclei -severity medium -l $TARGETS -o $OUTDIR/severity-medium.txt" "severity-medium" ;;
        4) run_scan "nuclei -severity high -l $TARGETS -o $OUTDIR/severity-high.txt" "severity-high" ;;
        5) run_scan "nuclei -severity critical -l $TARGETS -o $OUTDIR/severity-critical.txt" "severity-critical" ;;
        b) break ;;
        q) exit 0 ;;
      esac
    done
  fi

  # ---------- 7. Stop ----------
  if [[ $main_choice == 7 || $main_choice == "q" ]]; then
    echo "[+] Exiting. Results saved in $OUTDIR/"
    exit 0
  fi
done
