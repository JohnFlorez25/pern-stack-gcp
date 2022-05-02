module.exports = {
 apps : [
        {
                name          : 'frontend-yelp-geek-app',
                script        : 'npx',
                interpreter   : 'none',
                args          : 'serve -l 5000 -s build',
                env : {
                        NODE_ENV: 'production'
                }
        }

        ],

  deploy : {
    production : {
      user : 'JohnFlorez25',
      host : 'https://github.com/JohnFlorez25/pern-stack-gcp/new/master/client',
      ref  : 'origin/main',
      repo : 'https://github.com/JohnFlorez25/pern-stack-gcp/new/master/client',
      path : '/var/www/production',
      'post-deploy' : 'npm install && pm2 reload ecosystem.config.js --env production'
    }
  }
};
