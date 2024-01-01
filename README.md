# template.hs

[Homepage][repository]

By Alex Brandt <alunduil@gmail.com>

## Description

You can use recollect.hs as an example of serving abstract data types over a
network API.

## Terms of use

You are free to copy, modify, and distribute recollect.hs with attribution under
the terms of the MIT licence.  See the [LICENSE] file for details.

## Prerequisites

## How to use this example

1. `cabal run recollect &`
1. `curl -v -X POST http://localhost:8080/ -d "arbitrary data"  # push an item on the stack`
1. `curl -v -X GET http://localhost:8080/  # peek at the top item on the stack`
1. `curl -v -X DELETE http://localhost:8080/  # pop the top item on the stack`

## Documentation

* [LICENSE]: The license governing use of template.hs

## Getting Help

* [GitHub Issues][issues]: Support requests, bug reports, and feature requests

## How to Help

* Submit [issues] for problems or questions
* Submit [pull requests] for proposed changes

[issues]: https://github.com/alunduil/recollect.hs/issues
[LICENSE]: ./LICENSE
[pull requests]: https://github.com/alunduil/recollect.hs/pulls
[repository]: https://github.com/alunduil/recollect.hs
