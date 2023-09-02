
this app is being tested off `insomnia` 
https://insomnia.rest/products/insomnia

to import the api collection after cloning the app just import
```Insomnia_2023-09-02.json``` file which is part of the repo.

#### Running the app

```git clone git@github.com:mboya/quikk_notifier.git```

```bundle install```

```cp config/database.yml.sample config/database.yml```

```cp .env.sample .env```

```rake db:create db:migrate```

```rails server```