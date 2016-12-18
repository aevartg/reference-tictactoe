----

1. Jenkins URL and username and password.

2. Game URL (AWS)



## Scripts

Outline what script files you created and the purpose of each file. Each file should be commented. This could be

- [Docker build](https://github.com/aevartg/reference-tictactoe/blob/master/test.sh)
aðal scriptan sem keyrir installar npm, keyrir unit test, apitest, færir skrár í build og setur í container á Docker

- [Dockerfile](https://github.com/aevartg/reference-tictactoe/blob/master/Dockerfile)
segir docker hvað hann á að gera til þess að fá forritið í container

- [Docker compose](https://github.com/aevartg/reference-tictactoe/blob/master/docker-compose.yml)
sækir containerinn og postgres og sameinar í keyranlegt forrit

- [AWS Provisioning](https://github.com/aevartg/reference-tictactoe/blob/master/deployToAws.sh)
stoppar docker containerinn ef hann er keyrandi, færir compose og .env filea úr jenkins yfir í aws og keyrir

- [Migrate database](https://github.com/aevartg/reference-tictactoe/blob/master/run.sh)
bíður í smá stund áður en hann gerir migratedb til þess að hann virki


## Testing & logic

- UnitTests
-- Reyndi að gera þau með TDD sem best.

- Gerði fyrsta Api testið en náði ekki að gera meira.

- Is the game playable? Nei



## Data migration

- [Gerði migration](https://github.com/aevartg/reference-tictactoe/tree/master/server/migrations) sem bætir við dálk í töflu



## Jenkins

- [Commit Stage](https://github.com/aevartg/reference-tictactoe/blob/master/test.sh)

- Acceptance Stage

- Capacity Stage

- Other



Did you use any of the following features in Jenkins?

- Schedule or commit hooks

- Pipeline

- Jenkins file

- Test reports

- Other



## Monitoring

Did you do any monitoring?

- URL to monitoring tool. Must be open or include username and pass.



## Other

Anything else you did to improve you deployment pipeline of the project itself?