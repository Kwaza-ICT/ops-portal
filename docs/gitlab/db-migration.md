# Run incomplete database migrations

Database migrations can be stuck in an incomplete state, with a down status in the output of the sudo gitlab-rake db:migrate:status command.

### Display status of database migrations

See the background migrations documentation for how to check that migrations are complete when upgrading GitLab.
To check the status of specific migrations, you can use the following Rake task:

```shell
sudo gitlab-rake db:migrate:status
```

### To complete these migrations, use the following Rake task

```shell
sudo gitlab-rake db:migrate
```

After the migration is done, you should run the status again and be sure that they are all **UP**

