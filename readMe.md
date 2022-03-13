<h1>docker-lambda</h1>
Project to demonstrate containerizing Lambdas using Docker along with related AWS infrastructure as code.
<br /><br />
<h3>NPM Commands</h3>
<code>
  npm run docker-build  // Build Docker image. <br />
  npm run docker-start  // Run Docker image locally on port 9000.  <br />
  npm run stop          // Shutdown and delete all related containers.  <br />
</code> <br />
To test locally POST <a>http://localhost:9000/2015-03-31/functions/function/invocations</a>