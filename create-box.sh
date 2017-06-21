#!/bin/bash
mkdir target
vagrant up --no-provision
vagrant package --output target/josso-playground.box --vagrantfile Vagrantfile
vagrant box add --force --name atricore/josso-playground target/josso-playground.box 
