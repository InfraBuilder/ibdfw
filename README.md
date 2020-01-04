# ibdfw
infraBuilder firewall

[![ibdfw](https://snapcraft.io//ibdfw/badge.svg)](https://snapcraft.io/ibdfw) ![Twitter Follow](https://img.shields.io/twitter/follow/infrabuilder?style=social)

## how to install ibdfw

**ibdfw** is published in Snapcraft store : https://snapcraft.io/ibdfw

Installation is as simple as :

```bash
sudo snap install ibdfw
```

You can generate your first config file with : 
```bash
ibdfw config | sudo tee /var/snap/ibdfw/common/conf.d/main.conf
```

When applying rules for the first time, you must have to connect firewall-control interface to ibdfw snap (error will be explicit, and will display the fixing command) : 
```bash
ubuntu@fw:~$ sudo ibdfw apply
Could not use iptables. Please run:
  'sudo snap connect ibdfw:firewall-control'
```

## Configuration

Configuration is made by all files finishing with ".conf" that are in `/var/snap/ibdfw/common/conf.d/`

You can generate a config sample with the command `ibdfw config` also available here : [src/conf.d/main.conf.sample](src/conf.d/main.conf.sample)

## Features

- Easy NAT configuration for unidirectionnal (snat), bidirectionnal (1:1) and port-forward NAT

- Comprehensive syntax for configuration

  ```
  Default input,forward drop
  Default output accept
  Forward from ip 10.1.1.0/24 to ip 10.2.2.0/24
  Forward from iprange 10.0.0.1-10.0.0.145 to ip 10.24.78.0/24 ports tcp 80,443
  Input port tcp 22,80,443
  Input from ip 10.1.1.0/24 port tcp 8080
  Nat unidirectionnal 10.0.0.0/8 via 5.6.7.8
  Nat port-forward 5.6.7.8:1022 to 10.0.0.1:22
  ```

- ibdfw is written in bash and is based on iptables

- Standard input/output/default rules

- Better router security with routing restrictions ( `Forward` instructions )

- Support custom complex scenarii with `Raw` rules acting as iptables commands passthrough

