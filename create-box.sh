#!/bin/bash
mkdir target
vagrant init --no-provision
vagrant package --output target/josso-playground.box --vagrantfile Vagrantfile
vagrant box add --name atricore/josso-playground target/josso-playground.box 
