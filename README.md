jku-stridercd Cookbook
==================

Installs jku-stridercd (http://jku-stridercd.com/) and does the initial configuration.

Requirements
------------

## Platforms

* Debian / Ubuntu derivatives

## Chef

* Chef 11+

## Cookbooks

The following Chef Software cookbooks are dependencies:

- `mongodb` - jku-stridercd needs mongodb to store data.
- `nodejs` - with NPM, to install jku-stridercd

Attributes
----------

Check attributes/default.rb file for description.

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['jku-stridercd']['admin-email']</tt></td>
    <td>String</td>
    <td>Strider admin's log in e-mail address</td>
    <td><tt>admin@your_servers_fqdn</tt></td>
  </tr>
  <tr>
    <td><tt>['jku-stridercd']['admin-password']</tt></td>
    <td>String</td>
    <td>Strider admin's log in password</td>
    <td><tt>password</tt></td>
  </tr>
  <tr>
    <td><tt>['jku-stridercd']['server-name']</tt></td>
    <td>String</td>
    <td>Address at which server will be accessible on the Internet</td>
    <td><tt>Your server's fqdn</tt></td>
  </tr>
    <td><tt>['jku-stridercd']['server-port']</tt></td>
    <td>Integer</td>
    <td>Port that strider runs on, optional</td>
    <td><tt>8001</tt></td>
  </tr>
    <td><tt>['jku-stridercd']['log-file']</tt></td>
    <td>String</td>
    <td>Location of the log file</td>
    <td><tt>/var/log/strider.sys.log</tt></td>
  </tr>
    <td><tt>['jku-stridercd']['pid-file']</tt></td>
    <td>String</td>
    <td>Location of the pid file</td>
    <td><tt>/tmp/strider.pid</tt></td>
  </tr>
    <td><tt>['jku-stridercd']['system-user']</tt></td>
    <td>String</td>
    <td>System user that will own the log file and home directory/td>
    <td><tt>strider</tt></td>
  </tr>
    <td><tt>['jku-stridercd']['service-name']</tt></td>
    <td>String</td>
    <td>Name for Strider service (also /etc/init/_service_name_here_.conf file)</td>
    <td><tt>strider</tt></td>
  </tr>
    <td><tt>['jku-stridercd']['db-uri']</tt></td>
    <td>String</td>
    <td>MongoDB URI</td>
    <td><tt>mongodb://localhost/strider-foss</tt></td>
  </tr>
    <td><tt>['jku-stridercd']['smtp-host']</tt></td>
    <td>String</td>
    <td>SMTP host for sending e-mails from Strider</td>
    <td><tt>nil</tt></td>
  </tr>
    <td><tt>['jku-stridercd']['smtp-port']</tt></td>
    <td>Integer</td>
    <td>SMTP port for sending e-mails from Strider</td>
    <td><tt>587</tt></td>
  </tr>
    <td><tt>['jku-stridercd']['smtp-user']</tt></td>
    <td>String</td>
    <td>SMTP user for sending e-mails from Strider</td>
    <td><tt>nil</tt></td>
  </tr>
    <td><tt>['jku-stridercd']['smtp-pass']</tt></td>
    <td>String</td>
    <td>SMTP user for sending e-mails from Strider</td>
    <td><tt>nil</tt></td>
  </tr>
    <td><tt>['jku-stridercd']['smtp-from']</tt></td>
    <td>String</td>
    <td>E-mail from field for sending e-mails from Strider</td>
    <td><tt>Strider from your_servers_fqdn</tt></td>
  </tr>
    <td><tt>['jku-stridercd']['github-appid']</tt></td>
    <td>String</td>
    <td>GitHub app ID (register here: https://github.com/settings/applications/new)</td>
    <td><tt>nil</tt></td>
  </tr>
    <td><tt>['jku-stridercd']['github-appsecret']</tt></td>
    <td>String</td>
    <td>GitHub app secret that goes in pair with above attribute</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

Usage
-----
#### jku-stridercd::default

* You need to register your instance of Strider at GitHub to get GitHub App Id and App secret
* `$ start strider` - to start strider service
* `$ stop strider` - to stop strider service

Just include `jku-stridercd` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[jku-stridercd]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Jakub Kułak <jakub.kulak@gmail.com>
