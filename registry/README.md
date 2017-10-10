# Add to gitlab

```
echo "gitlab_rails['registry_enabled'] = true" >> /srv/gitlab/app/config/gitlab.rb
echo "gitlab_rails['registry_host'] = 'oxyta.net'" >> /srv/gitlab/app/config/gitlab.rb
echo "gitlab_rails['registry_port'] = '5000'" >> /srv/gitlab/app/config/gitlab.rb
docker exec git_app_1 gitlab-ctl reconfigure
```
