{% if grains.get('role') == 'suse_manager_server' %}

{% if '3.0' in grains['product_version'] %}
suse_manager_pool_repo:
  file.managed:
    - name: /etc/zypp/repos.d/SUSE-Manager-3.0-x86_64-Pool.repo
    - source: salt://repos/repos.d/SUSE-Manager-3.0-x86_64-Pool.repo
    - template: jinja

suse_manager_update_repo:
  file.managed:
    - name: /etc/zypp/repos.d/SUSE-Manager-3.0-x86_64-Update.repo
    - source: salt://repos/repos.d/SUSE-Manager-3.0-x86_64-Update.repo
    - template: jinja
{% endif %}

{% if '3.1' in grains['product_version'] %}
suse_manager_pool_repo:
  file.managed:
    - name: /etc/zypp/repos.d/SUSE-Manager-3.1-x86_64-Pool.repo
    - source: salt://repos/repos.d/SUSE-Manager-3.1-x86_64-Pool.repo
    - template: jinja

suse_manager_update_repo:
  file.managed:
    - name: /etc/zypp/repos.d/SUSE-Manager-3.1-x86_64-Update.repo
    - source: salt://repos/repos.d/SUSE-Manager-3.1-x86_64-Update.repo
    - template: jinja
{% endif %}

{% if '3.2' in grains['product_version'] %}
suse_manager_pool_repo:
  file.managed:
    - name: /etc/zypp/repos.d/SUSE-Manager-3.2-x86_64-Pool.repo
    - source: salt://repos/repos.d/SUSE-Manager-3.2-x86_64-Pool.repo
    - template: jinja

suse_manager_update_repo:
  file.managed:
    - name: /etc/zypp/repos.d/SUSE-Manager-3.2-x86_64-Update.repo
    - source: salt://repos/repos.d/SUSE-Manager-3.2-x86_64-Update.repo
    - template: jinja
{% endif %}

{% if 'uyuni-released' in grains['product_version'] %}
suse_manager_pool_repo:
  file.managed:
    - name: /etc/zypp/repos.d/Uyuni-Stable-x86_64-Pool.repo
    - source: salt://repos/repos.d/Uyuni-Stable-x86_64-Pool.repo
    - template: jinja
{% endif %}

{% if 'head' in grains['product_version'] %}
suse_manager_pool_repo:
  file.managed:
    {% if grains['osfullname'] == 'Leap' %}
    - name: /etc/zypp/repos.d/Uyuni-Master-x86_64-Pool.repo
    - source: salt://repos/repos.d/Uyuni-Master-x86_64-Pool.repo
    {% else %}
    - name: /etc/zypp/repos.d/SUSE-Manager-Head-x86_64-Pool.repo
    - source: salt://repos/repos.d/SUSE-Manager-Head-x86_64-Pool.repo
    {% endif %}
    - template: jinja

suse_manager_devel_repo:
  file.managed:
    {% if grains['osfullname'] == 'Leap' %}
    - name: /etc/zypp/repos.d/systemsmanagement_Uyuni_Master.repo
    - source: salt://repos/repos.d/systemsmanagement_Uyuni_Master.repo
    {% else %}
    - name: /etc/zypp/repos.d/Devel_Galaxy_Manager_Head.repo
    - source: salt://repos/repos.d/Devel_Galaxy_Manager_Head.repo
    {% endif %}
    - template: jinja
{% endif %}

{% if '3.0-nightly' in grains['product_version'] %}
suse_manager_devel_repo:
  file.managed:
    - name: /etc/zypp/repos.d/Devel_Galaxy_Manager_3.0.repo
    - source: salt://repos/repos.d/Devel_Galaxy_Manager_3.0.repo
    - template: jinja
{% endif %}

{% if '3.1-nightly' in grains['product_version'] %}
suse_manager_devel_repo:
  file.managed:
    - name: /etc/zypp/repos.d/Devel_Galaxy_Manager_3.1.repo
    - source: salt://repos/repos.d/Devel_Galaxy_Manager_3.1.repo
    - template: jinja
{% endif %}

{% if '3.2-nightly' in grains['product_version'] %}
suse_manager_devel_repo:
  file.managed:
    - name: /etc/zypp/repos.d/Devel_Galaxy_Manager_3.2.repo
    - source: salt://repos/repos.d/Devel_Galaxy_Manager_3.2.repo
    - template: jinja
{% endif %}

{% if 'test' in grains['product_version'] %}
suse_manager_pool_repo:
  file.managed:
    {% if grains['osfullname'] == 'Leap' %}
    - name: /etc/zypp/repos.d/Uyuni-Master-x86_64-Pool.repo
    - source: salt://repos/repos.d/Uyuni-Master-x86_64-Pool.repo
    {% else %}
    - name: /etc/zypp/repos.d/SUSE-Manager-Head-x86_64-Pool.repo
    - source: salt://repos/repos.d/SUSE-Manager-Head-x86_64-Pool.repo
    {% endif %}
    - template: jinja

suse_manager_devel_repo:
  file.managed:
    {% if grains['osfullname'] == 'Leap' %}
    - name: /etc/zypp/repos.d/systemsmanagement_Uyuni_Master.repo
    - source: salt://repos/repos.d/systemsmanagement_Uyuni_Master.repo
    {% else %}
    - name: /etc/zypp/repos.d/Devel_Galaxy_Manager_Head.repo
    - source: salt://repos/repos.d/Devel_Galaxy_Manager_Head.repo
    {% endif %}
    - template: jinja

suse_manager_test_repo:
  file.managed:
    - name: /etc/zypp/repos.d/Devel_Galaxy_Manager_TEST.repo
    - source: salt://repos/repos.d/Devel_Galaxy_Manager_TEST.repo
    - template: jinja
{% endif %}

{% if grains.get('log_server') | default(false, true) %}
filebeat_repo:
  file.managed:
    - name: /etc/zypp/repos.d/filebeat.repo
    - source: salt://repos/repos.d/filebeat.repo
    - template: jinja
{% endif %}

{% if grains.get('monitored') | default(false, true) %}
prometheus_repo:
  file.managed:
    - name: /etc/zypp/repos.d/systemsmanagement-sumaform-tools.repo
    - source: salt://repos/repos.d/systemsmanagement-sumaform-tools.repo
    - template: jinja
{% endif %}

{% endif %}

# HACK: work around #10852
{{ sls }}_nop:
  test.nop: []
