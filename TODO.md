- ud-viz/config.js should be generated out of the ENV/ARG variables, the way
  vegetalisation-partdieu demo does it
- remove the hardwired `depends_on` delays of the docker-compose (refer to
  the comments docker-compose.yml for suggestions)
- Get the pg_dump restoration to work. Note: maybe we don't need to do this 
  through the application but we could
   * use postgres-data/ ad-hoc saves (with the postgres ad-hoc format)
   * and after the application is terminated
   * manually use a postgres container lo reload that directory to memory
   * trigger a `pg_dump` command using the above service (note that this
     dump requires no installation because it could be also done with a
     container on the same image: this is because postgres docker images
     also install many commands like `pg_isready`, `psql`...)
   Maybe some technical difficulty could here come from the necessety (check
   it out) to retrieve authentication parameters from the docker-compose ?
   Or maybe that this dump command could be done within the docker-compose
   on exit ?
