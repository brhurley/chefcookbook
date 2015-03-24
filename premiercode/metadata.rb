
name "elssetup"
maintainer "Brian Hurley"
maintainer_email "brian1@premiercodeinc.com"
description "Chef recipes"
long_description "Recipes for chef"
version "1.0"
recipe "java8", "Install latest Oracle Java"

depends          "java"
depends          "tomcat-all"
