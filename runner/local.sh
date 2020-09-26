#!/usr/bin/env bash

export BROWSERSTACK_USERNAME=prashanthsams3
export BROWSERSTACK_ACCESS_KEY=ESxXzCB6KDyDd9xpFBKv

# shellcheck disable=SC2102
rake vivino:run[android] BROWSERSTACK=ON
#allure generate reports/allure-results-json/ --clean && allure open