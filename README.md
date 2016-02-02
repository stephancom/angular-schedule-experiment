# angular-schedule-experiment
An experiment with a local storage simulation of the Heroku job scheduler

## Install

1. clone repository
2. ```npm install```
3. ```bower insteall```

## Running

```gulp serve```

## TODO

* form validation (partly done)
* testing
* better styling maybe?

### bonus feature

note that 'next due' is computed by the modulo of repetitions of the frequency since last run, just to be amusing.  "last run" should really update itself accordingly, but... eh... that really should be done on the back end.  So in practice "last run" is the creation date.

```
# by: _            _
#  __| |_ ___ _ __| |_  __ _ _ _    __ ___ _ __
# (_-<  _/ -_) '_ \ ' \/ _` | ' \ _/ _/ _ \ '  \
# /__/\__\___| .__/_||_\__,_|_||_(_)__\___/_|_|_|
#            |_|              stephan@stephan.com
```
