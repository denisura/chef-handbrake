handbrake Cookbook
==================
A Chef cookbook for Handbrake CLI

Requirements
------------
#### packages
- `build-essential`
- `xml`

#### Platform

The following platforms are supported and tested using Vagrant 1.3.1:

* Ubuntu 12.04

Other Debian family distributions are assumed to work.


Attributes
----------
#### handbrake::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['handbrake']['url']</tt></td>
    <td>String</td>
    <td>Download URL</td>
    <td><tt>http://downloads.sourceforge.net/project/handbrake</tt></td>
  </tr>
  <tr>
    <td><tt>['handbrake']['version']</tt></td>
    <td>String</td>
    <td>handbrake version</td>
    <td><tt>0.9.9</tt></td>
   </tr>
  <tr>
    <td><tt>['handbrake']['checksum']</tt></td>
    <td>String</td>
    <td>checksum</td>
    <td><tt>ee81337a46f8af76599d6038f193a2c1</tt></td>
   </tr>
  <tr>
    <td><tt>['handbrake']['configure_options']</tt></td>
    <td>String</td>
    <td>Build configure options</td>
    <td><tt>%W{ --launch --disable-gtk }</tt></td>
   </tr>
</table>


#### handbrake::source
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['handbrake']['repository']</tt></td>
    <td>String</td>
    <td>SVN repository URL</td>
    <td><tt>svn://svn.handbrake.fr/HandBrake/trunk</tt></td>
  </tr>
  <tr>
    <td><tt>['handbrake']['configure_options']</tt></td>
    <td>String</td>
    <td>Build configure options</td>
    <td><tt>%W{ --launch --disable-gtk }</tt></td>
   </tr>
</table>


Usage
-----
#### handbrake::default
Just include `handbrake` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[handbrake]"
  ]
}
```

#### handbrake::source
Just include `handbrake` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[handbrake::source]"
  ]
}
```


Contributing
------------
e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
- Author: Denis Uraganov (<github@uraganov.net>)

Copyright 2013, Denis Uraganov

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.