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
<br>
If you encounter some issues while migrating, then I suggest you to read [here](https://docs.gitlab.com/ee/user/admin_area/monitoring/background_migrations.html#database-migrations-failing-because-of-batched-background-migration-not-finished) and follow this process. 
Here is what I had to run in order to the db migrate finish properly. 

```shell
sudo gitlab-rake gitlab:background_migrations:finalize[CopyColumnUsingBackgroundMigrationJob,ci_stages,id,'[["id"]\, ["id_convert_to_bigint"]]']
sudo gitlab-rake gitlab:background_migrations:finalize[CopyColumnUsingBackgroundMigrationJob,ci_builds_metadata,id,'[["id"]\, ["id_convert_to_bigint"]]']
sudo gitlab-rake gitlab:background_migrations:finalize[CopyColumnUsingBackgroundMigrationJob,ci_builds_metadata,id,'[["build_id"]\, ["build_id_convert_to_bigint"]]']
sudo gitlab-rake gitlab:background_migrations:finalize[CopyColumnUsingBackgroundMigrationJob,push_event_payloads,event_id,'[["event_id"]\, ["event_id_convert_to_bigint"]]']
sudo gitlab-rake gitlab:background_migrations:finalize[CopyColumnUsingBackgroundMigrationJob,deployments,id,'[["deployable_id"]\, ["deployable_id_convert_to_bigint"]]']
sudo gitlab-rake gitlab:background_migrations:finalize[CopyColumnUsingBackgroundMigrationJob,taggings,id,'[["id"\, "taggable_id"]\, ["id_convert_to_bigint"\, "taggable_id_convert_to_bigint"]]']
```

### Some services are down

If you see that some services are down, you can run

```shell
sudo gitlab-ctl restart
```
