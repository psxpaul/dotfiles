#!/bin/bash

export JAVA_HOME=$HOME/src/software/java/jdk1.7.0_15-x86_64
export M2_HOME=$HOME/src/software/maven/2.2.1

#export MALLOC_CHECK=0
export MAVEN_OPTS="-Xmx1024m -XX:+UseConcMarkSweepGC -XX:+CMSPermGenSweepingEnabled -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=512m"

export P4CLIENT=proberts-laptop
export P4USER=proberts
export P4PORT=p4proxy-cj.wl.corpsys.vclk.net:5666
#export P4PORT=p4cj.vclk.net:1666

export PATH="$HOME/bin:$JAVA_HOME/bin:$HOME/src/software/bin:$HOME/src/software/perforce/bin:$PATH"
export EDITOR="vim"

#export DEVDB_HOST="devdbf08.db.cj.com"
#export DEVDB_PORT="1541"
#export DEVDB_SID="devdbf08"
export DEVDB_HOST="localhost"
export DEVDB_PORT="1521"
export DEVDB_SID="devdb"

export TNSDBS="CCOD CCOP CCOT CIMP DBIRPT DCJODW4 DCJORPT1 DCJORPT2 DCJORPT3 DCJORPT4 DCJORPT5 DCJOTRF1 DCJOTRF2 DCJOTRF3 DCJOTRF4 DCJOTRF5 DCJOWEB1 DCJOWEB2 DCJOWEB3 DCJOWEB4 DCJOWEB5 DENT1 DENT2 DENT3 DENT4 DENT5 DEVDB DFINRPT DODS DPC1 DPC2 DPC3 DPC4 DPC5 DSEM DUTIL1 DUTIL2 DUTIL3 DUTIL4 DUTIL5 ENG_ARCH ENG_PROD FR1 PBIRPT PC1 PCJOCOM PCJODW PCJORPT PCJOTRF PCOG PENT PFINRPT PODS PSEM PUTIL RPT1 RPT2 SHOPCART TBIRPT TCJOCOM TCJODW4 TCJODW5 TCJODW TCJORPT1 TCJORPT2 TCJORPT3 TCJORPT4 TCJORPT5 TCJORPT6 TCJORPT7 TCJOTRF1 TCJOTRF2 TCJOTRF3 TCJOTRF4 TCJOTRF5 TCJOTRF6 TCJOTRF7 TCJOWEB1 TCJOWEB2 TCJOWEB3 TCJOWEB4 TCJOWEB5 TCJOWEB6 TCJOWEB7 TCJOWEBD TCOG TENT1 TENT2 TENT3 TENT4 TENT5 TENT6 TENT7 TFINRPT TODS TPC1 TPC2 TPC3 TPC4 TPC5 TPC6 TPC7 TSEM TUTIL1 TUTIL2 TUTIL3 TUTIL4 TUTIL5 TUTIL6 TUTIL7 TXN TXN TXN TXN TXN ZCJOWEB ZENT TCJX7"
export TNSUSERS="$USER cj cjorpt cjent cjotrf cms quartz engine sem finrpt birpt cjcore cjo agnitas webapp_usage cjxap_app cjx_application"
export TNSPWDS="test qa%555 openemm cms w4rs birpt pepper chilli"

export cj_useLatestSelenium=true


# source your bashrc for tmux
case $- in
*i*)
    . ~/.bashrc
    stty -ixon
    ;;
esac
