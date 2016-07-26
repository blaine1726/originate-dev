# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'blaine.muri@originate.com', password: 'password', password_confirmation: 'password')

Quote.create! :quote => 'Career Opportunities',
  :route => 'careers'

Quote.create! :quote => "We use design and technology to solve the world's most ambitious problems",
  :route => 'design'

Quote.create! :quote => 'Our people are some of the most brilliant on the planet',
  :route => 'people'

Quote.create! :quote => 'Welcome to our library of open-source tools, resources and articles',
  :route => 'resources'

Quote.create! :quote => 'We partner with forward-looking businesses in a variety of businesses',
  :route => 'solutions'

Quote.create! :quote => 'We build and operate all sorts of technologies',
  :route => 'technology'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/627998886590742528/Pnlj1Rer.png',
  :github => 'https://github.com/Originate/git-town',
  :title => 'Git Town',
  :description => 'Easy git branch management for team projects',
  :long_description => 'Git Town makes software development teams who use Git even more productive and happy. It adds Git commands that support GitHub Flow, Git Flow, the Nvie model, GitLab Flow, and other workflows more directly, and it allows you to perform many common Git operations faster and easier.',
  :readme => "![Git Town](http://originate.github.io/git-town/documentation/logo-horizontal.svg)

[![Build Status](https://circleci.com/gh/Originate/git-town/tree/master.svg?style=shield)](https://circleci.com/gh/Originate/git-town/tree/master)
[![License](http://img.shields.io/:license-MIT-blue.svg?style=flat)](LICENSE)

Git Town makes software development teams who use Git even more productive and happy.
It adds Git commands that support
[GitHub Flow](http://scottchacon.com/2011/08/31/github-flow.html),
[Git Flow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow),
the [Nvie model](http://nvie.com/posts/a-successful-git-branching-model),
[GitLab Flow](https://about.gitlab.com/2014/09/29/gitlab-flow/),
and other workflows more directly,
and it allows you to perform many common Git operations faster and easier.

See [git-town.com](http://www.git-town.com) for documentation.


## Commands

Git Town provides these additional Git commands:

__Development Workflow__

* [git hack](/documentation/commands/git-hack.md) - cuts a new up-to-date feature branch off the main branch
* [git sync](/documentation/commands/git-sync.md) - updates the current branch with all ongoing changes
* [git new-pull-request](/documentation/commands/git-new-pull-request.md) - create a new pull request
* [git ship](/documentation/commands/git-ship.md) - delivers a completed feature branch and removes it


__Repository Maintenance__

* [git kill](/documentation/commands/git-kill.md) - removes a feature branch
* [git prune-branches](/documentation/commands/git-prune-branches.md) - delete all merged branches
* [git rename-branch](/documentation/commands/git-rename-branch.md) - rename a branch
* [git repo](/documentation/commands/git-repo.md) - view the repository homepage


__Configuration and Help__

* [git town](/documentation/commands/git-town.md) - general Git Town help, view and change Git Town configuration


## Installation

Git Town runs anywhere Git and [Bash](https://www.gnu.org/software/bash/bash.html) run.
Check out our [installation instructions](http://www.git-town.com/install.html) for more details.


## Configuration

Git Town is configured on a per-repository basis.
Upon first use in a repository, you will be prompted for the required configuration.
Use the [git town](/documentation/commands/git-town.md) command to view or update your configuration at any time.

#### Required configuration

* the main development branch
* the [perennial branches](/documentation/development/branch_hierarchy.md#perennial-branches)

#### Optional Configuration

The following configuration options have defaults, so the configuration wizard does not ask about them.

* the pull branch strategy
  * how to sync the main branch / perennial branches with their upstream
  * default: `rebase`
  * possible values: `merge`, `rebase`

* the git-hack push flag
  * whether or not newly-hacked branches should be pushed to remote repo
  * default: `true`
  * possible values: `true`, `false`


## Documentation

In addition to the online documentation here,
you can run `git town` on the command line for an overview of the Git Town commands,
or `git help <command>` (e.g. `git help sync`) for help with an individual command.


## Contributing

Found a bug or have an idea for a new feature?
[Open an issue](https://github.com/Originate/git-town/issues/new)
or - even better - get down, go to town, and fire a feature-tested
[pull request](https://help.github.com/articles/using-pull-requests/)
our way! Check out our [contributing guide](/CONTRIBUTING.md) to start coding.",
  :category => 'framework',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/observable-process',
  :title => 'Node.js Child Process Observer',
  :description => 'High-level support for running, observing, and interacting with child processes in Node.js',
  :long_description => '',
  :readme => "# Node.js Child Process Observer

[![Circle CI](https://circleci.com/gh/Originate/observable-process.svg?style=shield)](https://circleci.com/gh/Originate/observable-process)
[![Dependency Status](https://david-dm.org/originate/observable-process.svg)](https://david-dm.org/originate/observable-process)
[![devDependency Status](https://david-dm.org/originate/observable-process/dev-status.svg)](https://david-dm.org/originate/observable-process#info=devDependencies)


High-level support for running, observing, and interacting with child processes
in Node.js


```javascript
ObservableProcess = require('observable-process')
process = new ObservableProcess('my-server --port 3000')
```

You can also provide the process to run as an _argv_ array:

```javascript
process = new ObservableProcess(['my-server', '--port', '3000'])
```


## Set the working directory of the subshell

```js
process = new ObservableProcess('my-server', { cwd: '~/tmp' })
```


## Set environment variables in the subshell


```javascript
process = new ObservableProcess('my-server', { env: { foo: 'bar' } })
```

## Waiting for output

You can be notified when the process prints given text on the console:

```javascript
process.wait('listening on port 3000', function() {
  // this method runs after the process prints \"listening on port 3000\"
});
```

This is useful for waiting until slow-starting services are fully booted up.


## Configure console output

By default the output of the observed process is printed on the console.
To disable logging:

```js
process = new ObservableProcess('my-server', { console: false });
```

You can also customize logging by providing a custom `console` object
(which needs to have the method `log`):

```javascript
myConsole = {
  log: (text) => { file.write(text) }
}
process = new ObservableProcess('my-server', { console: myConsole })
```

You can use [dim-console](https://github.com/kevgo/dim-console-node)
to print output from the subshell dimmed,
so that it is easy to distinguish from output of the main thread.

```javascript
dimConsole = require('dim-console')
process = new ObservableProcess('my-server', { console: dimConsole.console })
```

To get more detailed output (including lifecycle events of the subshell):

```javascript
process = new ObservableProcess('my-server', { verbose: true })
```


## Kill the process

If the process is running, you can kill it via:

```javascript
process.kill()
```

To let ObservableProcess notify you when a process ended,
subscribe to the `ended` event:

```javascript
process.on 'ended', (err, exitCode) => {
  // the process has ended here
  // you can also access the exit code via process.exitCode
}
```


## related libraries

* [nexpect](https://github.com/nodejitsu/nexpect):
  Allows to define expectations on command output,
  and send it input,
  but doesn't allow to add more listeners to existing long-running processes,
  which makes declarative testing hard.",
  :category => 'web',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/exosphere-sdk',
  :title => 'Exosphere SDK',
  :description => 'Command-line interface for Exosphere developers',
  :long_description => 'This is the command-line interface of the Exosphere SDK. It allows to develop Exosphere applications locally on OS X, Linux, and Windows machines.',
  :readme => "# Exosphere SDK [![Circle CI](https://circleci.com/gh/Originate/exosphere-sdk.svg?style=shield&circle-token=fc8148ed828cc81e6ca44920672af8f773106795)](https://circleci.com/gh/Originate/exosphere-sdk)
> Command-line interface for Exosphere developers

This is the command-line interface of the Exosphere SDK.
It allows to develop Exosphere applications locally
on OS X, Linux, and Windows machines.

* check out the
  [end-user documentation](https://github.com/Originate/exosphere-website)
* get an overview of the [SDK parts](documentation/sdk-parts.md)
* see our [developer guidelines](CONTRIBUTING.md)",
  :category => 'framework',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/node-text-stream-search',
  :title => 'Node.js Text Stream Search',
  :description => 'Searches for occurrences of a given search term in a Node.js text stream',
  :long_description => 'Super simple and robust way to reliably recognize text in text streams.',
  :readme => "# Node.js Text Stream Search
> Searches for occurrences of a given search term in a Node.js text stream

[![Circle CI](https://circleci.com/gh/Originate/node-text-stream-search.svg?style=shield)](https://circleci.com/gh/Originate/node-text-stream-search)
[![Dependency Status](https://david-dm.org/originate/node-text-stream-search.svg)](https://david-dm.org/originate/node-text-stream-search)
[![devDependency Status](https://david-dm.org/originate/node-text-stream-search/dev-status.svg)](https://david-dm.org/originate/node-text-stream-search#info=devDependencies)

Super simple and robust way to reliably recognize text in text streams.


```javascript

streamSearch = require('text-stream-search');

new TextStreamSearch(myStream).wait('hello', function() { console.log('found hello') });

// Now if the given stream emits someting including the word \"hello\",
// the callback above is called exactly once.
```

More details about the wait command is [here](features/wait.feature).

TextStreamSearch uses the [debug](https://github.com/visionmedia/debug)
library.
To see the parsed text, run your code that uses TextStreamSearch
with the environment variable `DEBUG` set to `text-stream-search` or `*`.


## Related Projects

* [StreamSnitch](https://github.com/dmotz/stream-snitch): does the same thing with regular expressions,
  but is buggy and blocks the event queue


## Development

See our [developer guidelines](CONTRIBUTING.md)",
  :category => 'web',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/lodash-match-pattern',
  :title => 'Lodash Match Pattern',
  :description => 'Deep JSON pattern matching library',
  :long_description => 'Match Pattern is a Swiss Army Knife for validating JSON objects. Its primary goal is to enable the highly flexible, expressive, and resilient feature testing of JSON based APIs. It includes facilities for deep matching, partial matching, unordered lists, and several advanced features for complex patterns. It also bundles a variety of validation functions from the lodash and checkit modules, and it supports custom matching and mapping functions.',
  :readme => "# Match Pattern
[![NPM](https://nodei.co/npm/lodash-match-pattern.png?downloads=true)](https://www.npmjs.com/package/lodash-match-pattern)

![CircleCI](https://circleci.com/gh/Originate/lodash-match-pattern.svg?style=shield&circle-token=:circle-token)
[![David Dependencies](https://david-dm.org/Originate/lodash-match-pattern.svg)](https://david-dm.org/Originate/lodash-match-pattern)
[![David devDependencies](https://david-dm.org/Originate/lodash-match-pattern/dev-status.svg)](https://david-dm.org/Originate/lodash-match-pattern#info=devDependencies)


Related Modules:
[![chai-match-pattern](https://img.shields.io/npm/v/chai-match-pattern.svg?label=chai-match-pattern)](https://www.npmjs.com/package/chai-match-pattern)
[![lodash-checkit](https://img.shields.io/npm/v/lodash-checkit.svg?label=lodash-checkit)](https://www.npmjs.com/package/lodash-checkit)

**Match Pattern** is a Swiss Army Knife for validating JSON objects. Its primary goal is to enable the highly flexible, expressive, and resilient feature testing of JSON based APIs. It includes facilities for deep matching, partial matching, unordered lists, and several advanced features for complex patterns.  It also bundles a variety of validation functions from the [`lodash`](https://lodash.com/docs) and [`checkit`](https://github.com/tgriesser/checkit) modules, and it supports custom matching and mapping functions.

#### Basic Usage
```
npm install lodash-match-pattern --save-dev
```
Copy the first two lines from this example to your test file.
```javascript
var matchPattern = require('lodash-match-pattern');
var _ = matchPattern.getLodashModule(); // Use our lodash extensions (recommended)

// TRIVIAL EXAMPLE
var trivialTestData = {a: 1, b: 'abc'};

var successResult = matchPattern(trivialTestData, {a: 1, b: _.isString});
// returns null for a successful match.

var failResult = matchPattern(trivialTestData, {a: _.isString, b: 'abc'});
// returns \"{a: 1} didn't match target {a: isString}\"

// REAL EXAMPLE
var realTestData = {
  name: 'Gale',
  email: 'gale.force@winds.com',
  age: 23,
  friends: [
    { name: 'Breeze', age: 14 },
    { name: 'Cyclone', age: 29 },
    { name: 'Gust', age: 22 }
  ]
};

//  partial match using Pattern Notation and matcher functions
var partialMatchResult = matchPattern(realTestData, `{
  name: _.isString,
  email: _.isEmail,
  age: _.isBetween|20|30
  ...
}`);

// EXTRA FANCY EXAMPLE
// with regex matcher and 'filterPattern' transform
// This checks that \"Gale\" has two friends between the ages of 20 and 30
// and that one of them is named \"Breeze\".
var extraFancyResult = matchPattern(realTestData, `{
  name: /^[A-Z]\w+$/,
  email: _.isEmail,
  age: _.isBetween|20|30,
  friends: {
    <-.filterPattern|'{age: _.isBetween|20|30 ...}': _.isSize|2,
    <=.get|name: [
      'Breeze',
      ...
    ]
  }
}`);
```

#### Here's what this module does for you

You may not need all of these features, but they're worth skimming. You'll likely find lots of flexibility for your specific use cases. The included examples are illustrated with live code as cucumber-js tests in [`examples/example1/features/`](https://github.com/Originate/lodash-match-pattern/blob/master/examples/example1/features/) and as mocha tests in
[`examples/example1/test/`](https://github.com/Originate/lodash-match-pattern/blob/master/examples/example1/test/).

1. [Deep JSON matching](#deep-json-matching)
1. [Matching property types](#matching-property-types)
1. [Partial objects](#partial-objects)
1. [Partial, superset, and unordered arrays](#partial-superset-and-unordered-arrays)
1. [Omitted items](#omitted-items)
1. [Parametrized matchers](#parametrized-matchers)
1. [Transforms](#transforms)
  1. [Apply transform example](#apply-transform-example)
  1. [Map pattern transform example](#map-pattern-transform-example)
  1. [Map values transform example](#map-values-transform-example)
  1. [Composition and multiple transforms](#composition-and-multiple-transforms)
1. [Memoization of test values](#memoization-of-test-values)
1. [Customization](#customization)
1. [Extras](#extras)

#### Specification with \"Pattern Notation\" or JavaScript Objects

As illustrated in the [cucumber examples](https://github.com/Originate/lodash-match-pattern/blob/master/examples/example1/features), our target use case is pattern matching in [CucumberJS](https://github.com/cucumber/cucumber-js). The \"Pattern Notation\" is a JSON-like DSL designed for readability in Cucumber tests. However almost all of the functionality is also available using actual JSON objects which may be more convenient for \"mocha\" and other unit testing frameworks. For a comparision see the [mocha examples](https://github.com/Originate/lodash-match-pattern/blob/master/examples/example1/features_mocha)


## Deep JSON matching

Just for starters, suppose we have a `joeUser` object and want to validate its exact contents.  Then `matchPattern` will do a deep match of the object and succeed as expected. *[[code](https://github.com/Originate/lodash-match-pattern/blob/jm20160625/examples/example1/features/basic.feature#L6)]*

```cucumber

  Given I have joeUser
  Then joeUser matches the pattern
    \"\"\"
    {
      id: 43,
      email: 'joe@matchapattern.org',
      website: 'http://matchapattern.org',
      firstName: 'Joe',
      lastName: 'Matcher',
      phone: '(333) 444-5555',
      createDate: '2016-05-22T00:23:23.343Z',
      tvshows: [
        'Match Game',
        'Sopranos',
        'House of Cards'
      ],
      mother: {
        id: 23,
        email: 'mom@aol.com'
      },
      friends: [
        {id: 21, email: 'pat@mp.co', active: true},
        {id: 89, email: 'gerri@mp.co', active: false},
        {id: 14, email: 'kim@mp.co', active: true}
      ]
    }
    \"\"\"
```

Unfortunately, deep matching of exact JSON patterns creates over-specified and brittle feature tests. In practice such deep matches are only occasionally useful. Just for example, suppose you wanted to match the exact `createDate` of the above user. Then you'd need to do some complex mocking of the database to spoof a testable exact value. But the good news is that we don't really care about the exact date, and we can trust that the database generated it correctly. All we really care about is that the date looks like a date. To solve this and other over-specification problems `lodash-match-pattern` enables a rich and extensible facility for data type checking.


## Matching property types

There's a bucket full of `_.isXxxx` matchers available to check property types, and if those aren't enough, you can match by regex as well. All you need to do is slug in the pattern matching function (or regex) and that function will be applied to the candidate value. *[[code](https://github.com/Originate/lodash-match-pattern/blob/jm20160625/examples/example1/features/basic.feature#L34)]*

```javascript
{
  id: _.isInteger,
  email: _.isEmail,
  website: _.isUrl,
  firstName: /[A-Z][a-z]+/,
  lastName: _.isString,
  phone: /\(\d{3}\)\s*\d{3}[- ]\d{4}/,
  createDate: _.isDateString,
  tvshows: [
    _.isString,
    _.isString,
    _.isString
  ],
  mother: _.isObject,
  friends: _.isArray
}
```

* The available matching functions are
  1. All `isXxxx` functions from `lodash`.
  1. All validation functions from `checkit` with `is` prepended.
  1. Case convention matchers constructed from lodash's `...Case` functions.
  1. Any regular expression -- intepreted as `/<regex>/.test(<testval>)`.
  1. `isPrinted`, `isDateString`, `isSize`, `isOmitted` which have been added via [lodash mixins](https://github.com/Originate/lodash-match-pattern/blob/master/lib/mixins.js).
  1. Any `isXxxx` (or `hasXxxx`) function you insert as a lodash mixin through [customization](#customization).

To see the full list run this:
```javascript
console.log(
  Object.keys(require('lodash-match-pattern').getLodashModule())
  .filter(function (fname) { return /^(is|has)[A-Z]/.test(fname) })
);
```

## Partial objects

Most feature tests are interested in how objects change, so we're not usually concerned with properties that aren't involved in the change. In fact best practices of feature testing suggest elimination of such incidental details.  Matching only partial objects can create a huge simplification which focuses on the subject of the test. For example if we only wanted to test changing our user's email to say `billyjoe@duckduck.go` then we can simply match the pattern *[[code](https://github.com/Originate/lodash-match-pattern/blob/jm20160625/examples/example1/features/basic.feature#L55)]*:

```javascript
{
  id: 43,
  email: 'billyjoe@duckduck.go'
  ...
}
```

The `...` indicates that only the specified keys are matched, and all others in `joeUser` are ignored.

_Note: All the following examples will use partial matching._

## Partial, Superset, and Unordered Arrays

Similarly matching of partial arrays (as well as supersets and set equality) can be easily specified, but with a couple caveats:

1. The array entries must be numbers or strings, no nested objects or arrays.
2. The partial (and supersets) arrays are matched as sets -- no order assumed.

*[[code](https://github.com/Originate/lodash-match-pattern/blob/jm20160625/examples/example1/features/basic.feature#L66)]*:

```javascript
{
  tvshows: [
    'House of Cards',
    'Sopranos',
    ...
  ]
  ...
}
```

_Note that the above has two partial symbols \"`...`\" One for the partial array (`joeUser.tvshows`) and one for the partial object (`joeUser`).

Supersets are similarly specified by `^^^`. The following says that `joeUser.tvshows` is a subset of the list in the pattern below:

```javascript
{
  tvshows: [
    'House of Cards',
    'Match Game',
    'Sopranos',
    \"Grey's Anatomy\",
    ^^^
  ]
  ...
}
```

Or to compare equality of arrays as sets by unordered membership, use `===`:

```
{
  tvshows: [
    'House of Cards',
    'Match Game',
    'Sopranos',
    ===
  ]
  ...
}
```

## Omitted items

Sometimes an important API requirement specifies fields that should not be present, such as a `password`. This can be validated with an explicit `_.isOmitted` check. Note that it works properly with partial objects. *[[code](https://github.com/Originate/lodash-match-pattern/blob/jm20160625/examples/example1/features/basic.feature#L94)]*:

```javascript
{
  id: 43,
  password: _.isOmitted
  ...
}
```

## Parametrized matchers

Some of the matching functions take parameters. These can be specified with \"|\" separators at the end of the matching function. *[[code](https://github.com/Originate/lodash-match-pattern/blob/jm20160625/examples/example1/features/basic.feature#L104)]*:

```javascript
{
  id: _.isBetween|42.9|43.1,
  tvshows: _.isContainerFor|'House of Cards',
  ...
}
```

## Transforms

Transforms modify the test data in some way before applying a match pattern. Transforms can be applied at any level of the match object and they may be composed. _(Although they are can be very handy, you should use transforms sparingly since they tend to make the patterns less readable, and they could be a code smell of excessively complex tests. In many cases separate tests or a custom matcher will be clearer.)_

#### Apply Transform Example

As motivation consider matching a compound object such at the `joeUser`'s friends list. We may not be able to guarantee order of items in the list, and probably don't care anyway. So simply matching the friends list with a set order will likely be an unreliable test. To fix this a `<-.sortBy` transform can be applied to force the test data into a specific order that can be reliably tested. *[[code](https://github.com/Originate/lodash-match-pattern/blob/jm20160625/examples/example1/features/transforms.feature#L6)]*

```javascript
{
  friends: {
    <-.sortBy|email: [
      {id: 89, email: 'gerri@mp.co', active: false},
      {id: 14, email: 'kim@mp.co', active: true},
      {id: 21, email: 'pat@mp.co', active: true}
    ]
  }
  ...
}
```

Any function in `lodash-checkit` is available for transforms, along with a few [extras](#extras) below, and any function you add via customization. The functions are applied with the `testValue` as the function's first argument, and additional `|` separated arguments can be specified after the function name.

Important Note: The transform functions are applied to the test value, NOT the corresponding test pattern. In this example we're testing the `joeUser.friends` list. So this list is sorted by `email` and the resulting array is tested against the above pattern.

#### Map Pattern Transform Example

Suppose you just wanted to check that all of of joeUser's friends have emails `...@mp.co`. *[[code](https://github.com/Originate/lodash-match-pattern/blob/jm20160625/examples/example1/features/transforms.feature#L21)]*

```javascript
{
  friends: {
    <=: { email: /@mp.co$/, ...}
  }
  ...
}
```

The `<=` says that the pattern is applied to each of the entries of the `joeUser.friends` array. In contrast, the `<-` operator would say that the pattern is matched against the array as a whole.


#### Map Values Transform Example

Suppose you want to check that `joeUser`'s friends are in a \"whitelist\" of emails. Then you need to extract the emails, and since the whitelist check is case insensitive you need to compare them all in lower case. *[[code](https://github.com/Originate/lodash-match-pattern/blob/jm20160625/examples/example1/features/transforms.feature#L32)]*

```javascript
{
  friends: {
    <=.get|email: {
      <=.toLower: [
        'pat@mp.co',
        'gerri@mp.co',
        'kim@mp.co',
        'paula@mp.co',
        ^^^
      ]
    }
  }
  ...
}
```

Here `<=.get|email` says that `_.get(..., 'email')` is applied to each of the entries of the `joeUser.friends` array and creates a new array which is passed in turn to `<=.toLower` which creates a mapped array with all emails in lower case. The result is then compared to the given whitelist.

Map transforms (`<=.`) can be applied to objects as well as arrays. For arrays `<=.lodashFunction` uses `_.map` to apply the `_.<lodashFunction>` to each array element. For objects `_.mapValues` is used instead.


#### Composition and Multiple Transforms

Transformations can be mixed and matched. Multiple transforms can also appear as keys in a single object. In that case they check the test value against all their respective pattern values. Notice, as suggested in the previous example, transform compositions are always applied to the test value from the outside to the inside where they result in the final pattern match.

The following artificial example verifies that `joeUser` has `2` active friends, in four different ways. *[[code](https://github.com/Originate/lodash-match-pattern/blob/jm20160625/examples/example1/features/transforms.feature#L51)]*

```javascript
  friends: {
    <-.filter|active: {
      <-.size: 2,
      <-: _.isSize|2,
      <-.isSize|2: true
    },
    <=.get|active: {
      <=.toNumber: {
        <-.sum: 2
      }
    }
  }
  ...
}
```

## Memoization of test values

Sometimes we're interested in comparing values from two steps. In this example, we want to check that duplicating a user copies some fields and updates others. So we memoize fields we're interested in and compare them to the dup. *[[code](https://github.com/Originate/lodash-match-pattern/blob/jm20160625/examples/example1/features/memoization.feature#L6)]*
```cucumber
  Scenario: Dupicating a user updates id and createDate but copies email and tvshows
    When the user matches the pattern
      \"\"\"
      {
        id: {<-.setMemo|id: _.isInteger},
        email: _.isSetAsMemo|email,
        createDate: _.isSetAsMemo|createDate,
        tvshows: _.isSetAsMemo|tvshows,
        ...
      }
      \"\"\"
    And the user is duplicated
    Then the duplicate user matches the pattern
      \"\"\"
      {
        id: _.isNotEqualToMemo|id,
        email: _.isEqualToMemo|email,
        createDate: _.isNotEqualToMemo|createDate,
        tvshows: _.isEqualToMemo|tvshows,
        ...
      }
      \"\"\"
```
Memoization notes:

1. The above demonstrates both the transform `_.setMemo`, and the similar matcher `_.isSetAsMemo`. As lodash functions the only difference is that `_.setMemo` passes the source value through so that it can be matched downstream. In contrast `_.isSetAsMemo` is a matcher that always returns true.  Use `_.isSetAsMemo` when you're just interested saving the source value as a memo.
2. Obviously memoizing is more valuable for cucumber feature tests. You can just use native JavaScript variables in mocha unit tests.
3. In addition to the above there is also a `_.clearMemos` function that should be executed in the `Before` or `After` routine for each test to ensure a clean slate of memos.

## Customization

In many cases, application of transforms will create unintuitive and hard to understand pattern specifications. Fortunately creating custom matchers and custom transforms is easy via lodash mixins. Here we've added two custom lodash mixins:
```
var matchPattern = require('lodash-match-pattern');
var _ = matchPattern.getLodashModule();

_.mixin({
  literalSetToken: function (elem) {
    if (elem === '...') return 'LITERAL...';
    if (elem === '^^^') return 'LITERAL^^^';
    if (elem === '===') return 'LITERAL===';
    return elem;
  },

  isActiveSize: function (array, size) {
    if (! _.isArray(array)) return false;
    var activeSize = _.size(_.filter(array, 'active'));
    return activeSize === size;
  }
});
```
This gives us yet another (but simpler) method for counting joeUser's active friends. *[[code](https://github.com/Originate/lodash-match-pattern/blob/jm20160625/examples/example1/features/customization.feature#L6)]*
```
{
  friends: _.isActiveSize|2,
  ...
}
```

The custom `literalSetToken` transform can be used to enable literal pattern matching of \"...\" and \"---\" in arrays. So for example, suppose for some reason `joeUser` had this as his actual `tvshows` list:
```
  [
    \"===\",
    \"Mannix\",
    \"Game of Thrones\",
    \"...\",
    \"^^^\"
  ]
```
Then the following now has a successful pattern match:

```javascript
{
  tvshows: {
    <=.literalSetToken: [
      'LITERAL===',
      'Mannix',
      'Game of Thrones',
      'LITERAL...',
      'LITERAL^^^'
    ]
  },
  ...
}
```

## Extras

Here are some miscellaneous lodash additions that may come in handy. The source code of each of these is just a few lines in [lib/mixins.js](https://github.com/Originate/lodash-match-pattern/blob/master/lib/mixins.js).

* `_.isPrinted` -- a matcher that always matches, but prints the source values that it is matching against. This is super useful for seeing the results of transforms.
* `_.extractUrls` -- a transform that takes a string and returns an array of parsed Url objects from the string.
* `_.filterPattern` -- a transform function that takes a pattern as an argument. This is most useful for filtering rows from a database whose column values match certain characteristics.
  * For example `<-.filterPattern|\"{age: _.isInRange|0|18 ...}\"` will filter leaving only the rows where `age` is in the range `[0, 18]`.  Notice that this is taking advantage of partial pattern matching with the `...`
* `_.isDateString` -- a matcher for strings that are parseable into dates (e.g. ISO Date strings).
* `_.isOmitted` -- an alias for `_.isUndefined`. As shown in an example above this is more semantically meaningful for matching intentionally omitted properties of an object.
* `_.isSize` -- the matcher corresponding to the standard lodash `_.size`. It checks it's argument against the `_.size` of the source object.",
  :category => 'web',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/exosphere-users-service',
  :title => 'Exosphere Users Service',
  :description => 'An ExoSphere service that stores user accounts',
  :long_description => 'An Exosphere service for storing user data',
  :readme => "# Users Service

[![Circle CI](https://circleci.com/gh/Originate/exosphere-users-service.svg?style=shield&circle-token=b8da91b53c5b269eeb2460e344f521461ffe9895)](https://circleci.com/gh/Originate/exosphere-users-service)
[![Dependency Status](https://david-dm.org/originate/exosphere-users-service.svg)](https://david-dm.org/originate/exosphere-users-service)
[![devDependency Status](https://david-dm.org/originate/exosphere-users-service/dev-status.svg)](https://david-dm.org/originate/exosphere-users-service#info=devDependencies)

> An Exosphere service for storing user data




## Installation

* install ZeroMQ

  ```
  brew install zeromq
  ```

* install MongoDB

  ```
  brew install mongodb
  ```

* install dependencies

  ```
  npm install
  ```


## running

* start MongoDB

 ```
 mongod --config /usr/local/etc/mongod.conf
 ```

* start the service

  ```
  env EXOCOMM_PORT=4000 EXORELAY_PORT=4001 bin/start
  ```


## Development

See your [developer documentation](CONTRIBUTING.md)",
  :category => 'framework',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/exosphere-mongodb-service',
  :title => 'Exosphere MongoDB Service',
  :description => 'A generic Exosphere service that stores data in MongoDB',
  :long_description => 'A generic Exosphere service that stores data in MongoDB',
  :readme => "# Exosphere MongoDB Service

[![Circle CI](https://circleci.com/gh/Originate/exosphere-mongodb-service.svg?style=shield&circle-token=389739b88cceec7155d0253e1560339a8409fd98)](https://circleci.com/gh/Originate/exosphere-mongodb-service)
[![Dependency Status](https://david-dm.org/originate/exosphere-mongodb-service.svg)](https://david-dm.org/originate/exosphere-mongodb-service)
[![devDependency Status](https://david-dm.org/originate/exosphere-mongodb-service/dev-status.svg)](https://david-dm.org/originate/exosphere-mongodb-service#info=devDependencies)


A generic Exosphere service that stores data in MongoDB


## Installation

* install and start MongoDB

* install dependencies:

  ```
  brew install zeromq
  npm install
  ```

## Development

See our [developer documentation](CONTRIBUTING.md)",
  :category => 'framework exosphere',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/exosphere-tweets-service',
  :title => 'Tweets Service',
  :description => 'An Exosphere service for storing entry data',
  :long_description => 'An Exosphere service for storing entry data',
  :readme => "# Tweets Service

[![Circle CI](https://circleci.com/gh/Originate/exosphere-tweets-service.svg?style=shield&circle-token=b571517a2b36b03bd440ad7056d2a072c463dc63)](https://circleci.com/gh/Originate/exosphere-tweets-service)
[![Dependency Status](https://david-dm.org/originate/exosphere-tweets-service.svg)](https://david-dm.org/originate/exosphere-tweets-service)
[![devDependency Status](https://david-dm.org/originate/exosphere-tweets-service/dev-status.svg)](https://david-dm.org/originate/exosphere-tweets-service#info=devDependencies)

An Exosphere service for storing entry data


## Installation

* install MongoDB

  ```
  brew install mongodb
  ```

* install dependencies

  ```
  npm install
  ```


## running

* start MongoDB

  ```
  mongod --config /usr/local/etc/mongod.conf
  ```

* start the service

  ```
  env EXOCOMM_PORT=4000 EXORELAY_PORT=4001 bin/start
  ```


## Development

See your [developer documentation](CONTRIBUTING.md)",
  :category => 'framework exosphere',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/exoservice-js',
  :title => 'JavaScript Exoservice Framework',
  :description => 'opinionated framework for creating Exosphere lambda services in Node.JS',
  :long_description => 'opinionated framework for creating Exosphere lambda services in Node.JS',
  :readme => "# JavaScript Exoservice Framework

> opinionated framework for creating
[Exosphere lambda services](https://github.com/Originate/exosphere/blob/master/documentation/services.md#lambda-services)
in Node.JS

[![Circle CI](https://circleci.com/gh/Originate/exoservice-js.svg?style=shield&circle-token=33fbf4fc2b0c128479443c5e8bff337815205ec7)](https://circleci.com/gh/Originate/exoservice-js)
[![Dependency Status](https://david-dm.org/originate/exoservice-js.svg)](https://david-dm.org/originate/exoservice-js)
[![devDependency Status](https://david-dm.org/originate/exoservice-js/dev-status.svg)](https://david-dm.org/originate/exoservice-js#info=devDependencies)

## Installation

```bash
npm install -g exoservice-js
```


## Creating a micro-service

Let's create the simplest possible microservice:
when receiving the message \"ping\", it replies with the message \"pong\".

1. create an empty service scaffold
  * `yo exoservice ping`

1. start your server: `SERVICE_NAME=pinger EXORELAY_PORT=3000 EXOCOM_PORT=3100 exo-js`
  * `SERVICE_NAME` is as what your service should identify to Exosphere
  * `EXORELAY_PORT` is the port at which your service listens to Exosphere messages
  * `EXOCOM_PORT` is the port at which your local ExoCom instance runs


## Testing

Test a running service manually:

```bash
$ curl -d '{\"id\": \"123\" }' -H \"Content-Type: application/json\" -i http://localhost:3000/run/hello-world
```


## Development

See your [developer guidelines](CONTRIBUTING.md)",
  :category => 'framework web exosphere',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/exorelay-js',
  :title => 'Exosphere Communication Relay for JavaScript',
  :description => 'Communication relay between JavaScript code bases and the Exosphere environment',
  :long_description => 'Communication relay between JavaScript code bases and the Exosphere environment',
  :readme => "# Exosphere Communication Relay for JavaScript

> Communication relay between JavaScript code bases and the Exosphere environment

[![Circle CI](https://circleci.com/gh/Originate/exorelay-js.svg?style=shield&circle-token=012a2c6405c702e0a8271de804eed0c4c179772f)](https://circleci.com/gh/Originate/exorelay-js)
[![Dependency Status](https://david-dm.org/originate/exorelay-js.svg)](https://david-dm.org/originate/exorelay-js)
[![devDependency Status](https://david-dm.org/originate/exorelay-js/dev-status.svg)](https://david-dm.org/originate/exorelay-js#info=devDependencies)

This library allows you to add Exosphere communication to any Node.JS codebase.
It is intended to be used in your web or API server,
or with legacy Node code bases.
If you want to write a new micro-service in Node,
please use [ExoService-JS](https://github.com/Originate/exoservice-js),
which uses this library internally.


## Add an ExoRelay to your application

Each code base should have only one ExoRelay instance.

```coffeescript
ExoRelay = require 'exorelay'

exoRelay = new ExoRelay exocomPort: <port>, serviceName: <name of the service using ExoRelay>
exoRelay.on 'online', (port) ->  # yay, we are online!
exoRelay.on 'error', (err) ->    # examine, print, or log the error here
exoRelay.listen 4000
```

More details and how to customize the port is described in the [spec](features/listen.feature).

## Events

ExoRelay instances are [EventEmitters](https://nodejs.org/api/events.html).
They emit the following events to signal state changes:

<table>
  <tr>
    <th>online</th>
    <td>The instance is completely online now. Provides the port it listens on.
  </tr>
  <tr>
    <th>offline</th>
    <td>The instance is offline now.</td>
  </tr>
  <tr>
    <th>error</th>
    <td>An error has occurred. The instance is in an invalid state, your application should crash.</td>
  </tr>
</table>


## Handle incoming messages

Let's say we build a service that greets users.
Here is how to register a handler for incoming \"hello\" messages:

```coffeescript
exoRelay.registerHandler 'hello', (name) -> console.log \"hello \#{name}!\"
```

More details on how to define message listeners are [here](features/receiving-messages.feature).


## Send outgoing messages

Send a message to Exosphere:

```coffeescript
exoRelay.send 'hello', name: 'world'
```

Sending a message is fire-and-forget, i.e. you don't have to wait for the
sending process to finish before you can do the next thing.
More details on how to send various data are [here](features/sending.feature).


## Send outgoing replies to incoming messages

If you are implementing services, you want to send outgoing replies to incoming messages:

```coffeescript
exoRelay.registerHandler 'user.create', (userData, {reply}) ->
  # on this line we would save userData in the database
  reply 'user.created', id: 456, name: userData.name
```

More details and a working example of how to send replies is [here](features/outgoing-replies.feature).


## Handle incoming replies

If a message you send expects a reply,
you can provide the handler for it right when you send it:

```coffeescript
exoRelay.send 'users.create', name: 'Will Riker', (createdUser) ->
  console.log \"the remove service has finished creating user \#{createdUser.id}\"
```

More examples for handling incoming replies are [here](features/incoming-replies.feature).


## Development

See our [developer guidelines](CONTRIBUTING.md)",
  :category => 'exosphere web',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/exocom-dev',
  :title => 'Exosphere Communication Server',
  :description => 'Development version of the Exosphere communication platform',
  :long_description => 'This is a lightweight, fast, in-memory implementation of the Exosphere Communication infrastructure, optimized for running easily without dependencies, for example on developer machines, without production-grade features like persistence or horizontal scalability.',
  :readme => "# Exosphere Communication Server

[![Circle CI](https://circleci.com/gh/Originate/exocom-dev.svg?style=shield&circle-token=0f68f90da677a3c5bffc88d9d41910c00f10b81e)](https://circleci.com/gh/Originate/exocom-dev)
[![Dependency Status](https://david-dm.org/originate/exocom-dev.svg)](https://david-dm.org/originate/exocom-dev)
[![devDependency Status](https://david-dm.org/originate/exocom-dev/dev-status.svg)](https://david-dm.org/originate/exocom-dev#info=devDependencies)

This is a lightweight, fast, in-memory implementation of the **Exo**sphere **Com**munication infrastructure,
optimized for running easily without dependencies,
for example on developer machines,
without production-grade features like persistence or horizontal scalability.


## Features

* [broadcasting](features/broadcasting-messages.feature) of messages to other services
* optional [translating](features/translating-messages.feature) of messages along the way


## Distribution

This implementation is bundled into the
[Exosphere SDK](https://github.com/Originate/exosphere-sdk),
no need to install it separately.


## Development

[developer guidelines](CONTRIBUTING.md)",
  :category => 'exosphere server',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/exocom-mock-js',
  :title => 'Mock implementation of ExoCom in JavaScript',
  :description => 'A mock implementation of the ExoComm development server in JavaScript, for testing',
  :long_description => 'a mock implementation of ExoCom-Dev for sending and receiving messages to your ExoServices in test',
  :readme => "# Mock implementation of ExoCom in JavaScript

[![Circle CI](https://circleci.com/gh/Originate/exocom-mock-js.svg?style=shield&circle-token=4f522d83e80f98f58b30cd1c9ad7f2e24f8e0b58)](https://circleci.com/gh/Originate/exocom-mock-js)
[![Dependency Status](https://david-dm.org/originate/exocom-mock-js.svg)](https://david-dm.org/originate/exocom-mock-js)
[![devDependency Status](https://david-dm.org/originate/exocom-mock-js/dev-status.svg)](https://david-dm.org/originate/exocom-mock-js#info=devDependencies)

> a mock implementation of [ExoCom-Dev](https://github.com/Originate/exocom-dev)
for sending and receiving messages to your ExoServices in test


## Installation

```
$ npm i --save-dev exocom-mock
```


## Usage

* create an instance

  ```coffeescript
  ExoComMock = require('exocom-mock')
  exocom = new ExoComMock
  ```

* register a service to send messages to

  ```coffeescript
  exocom.registerService name: 'users', port: 4001
  ```

* send a message to the service

  ```coffeescript
  exocom.sendMessage service: 'users', name: 'users.create', payload: { name: 'Jean-Luc Picard' }
  ```

* verifying messages sent out by the service under test

  ```coffeescript
  # ... make your service sent out a request here via exocom.sendMessage...

  # wait for the message to arrive
  exocom.waitUntilReceive =>

    # verify the received message
    expect(exocom.receivedMessages()).to.eql [
      {
        name: 'users.created'
        payload:
          name: 'Jean-Luc Picard'
      }
    ]
  ```

* if you want to verify more received messages later, you can reset the register of received messages so far

  ```coffeescript
  exocom.reset()
  ```

* finally, close your instance when you are done, so that you can create a fresh one for your next test

  ```coffeescript
  exocom.close()
  ```


## Development

See our [developer documentation](CONTRIBUTING.md)",
  :category => 'exosphere test',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/OriginateUI',
  :title => 'OriginateUI',
  :description => 'A lightweight UI theming framework for iOS applications',
  :long_description => 'A collection of classes and categories making life easier when writing user interface related code.',
  :readme => "# OriginateUI
[![CI Status](http://img.shields.io/travis/Originate/OriginateUI.svg?style=flat)](https://travis-ci.org/Originate/OriginateUI)

> A collection of classes and categories making life easier when writing user interface related code.

# Installation with CocoaPods
Add the following lines to your Podfile and run `pod install`.

```ruby
source 'https://github.com/Originate/CocoaPods.git'
pod 'OriginateUI'
```

# Requirements
- iOS 8.0+

# Usage

## Import the Framework

Add the following line wherever you want to access the framework:
```objective-c
@import OriginateUI;
```

You now have access to a wide range of categories and classes that simplify everyday life when writing user interface related code.

## Text Fields
`UITextField` has no convenient accessors to specify insets for the text rendering or other elements. `OriginateTextField` solves the problem by exposing the following interface:

```objective-c
OriginateTextField *textField = [[OriginateTextField alloc] init];
textField.textEdgeInsets = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);
```

### Validating Text Fields
When implementing registration forms, login masks or other types of forms that would benefit from validation, use `OriginateValidatedTextField`.

```objective-c
OriginateValidatedTextField * textField = [[OriginateValidatedTextField alloc] init];
textField.validationMode = OriginateTextFieldValidationModeLive;
textField.validationBlock = ^BOOL(NSString *text) {
    return ([text length] > 5);
};
textField.validationChangedBlock = ^(BOOL isValid, OriginateValidatedTextField *textField) {
    if (isValid) {
        textField.backgroundColor = [UIColor whiteColor];
    }
    else {
        textField.backgroundColor = [UIColor redColor];
    }
};
```

## Gradient Views
Whilst `CoreAnimation` provides us with `CAGradientLayer` it is not as comfortable to use as one would like. For this reason we supply `OriginateGradientView`.

```objective-c
UIColor *topColor = [UIColor whiteColor];
UIColor *blackColor = [UIColor blackColor];
OriginateGradientView *view = [[OriginateGradientView alloc] initWithFirstColor:topColor secondColor:blackColor];
```

## Motion Interpolation (Category on UIView)
With iOS 7 Apple introduced motion interpolation for views – i.e. you can make your subviews *respond* to device motion by having the system shift them slightly, thereby creating a parallax-like effect. That said, the API is tedious to use, which is why we extended `UIView` and introduced a property called `motionInterpolationEnabled`. It applies a default value and enables `x` and `y` axis shifting.
\
```objective-c
UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@\"logo\"]];
view.motionInterpolationEnabled = YES;
```

## Image Tinting (Category on UIImage)
To make the *tinting* of images easier, we provide to methods on `UIImage`:

```objective-c
UIImage *logo = [UIImage imageNamed:@\"logo\"];
UIImage *blackLogo = [logo imageTintedWithColor:[UIColor blackColor]];
```

## Hexadecimal Colors (Category on UIColor)
Most designers work with colors using the hexadecimal system. `UIColor` by default only really works well with plain RGB values between 0 and 1.

```objective-c
// Red
UIColor *redColor = [UIColor hex:0xFF0000];

// Green at 50% Opacity
UIColor *redColor = [UIColor hex:0x00FF00 alpha:0.5];
```

# License
OriginateUI is available under the MIT license. See the LICENSE file for more info.",
  :category => 'ios ui',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/rails-delegate-js',
  :title => 'Delegation Pattern for JavaScript',
  :description => 'A simple helper to implement the delegation pattern in JavaScript code bases',
  :long_description => 'This module implements the delegation pattern for JavaScript, in the very popular and usable Rails style.',
  :readme => "# Delegation Pattern for JavaScript

[![Circle CI](https://circleci.com/gh/Originate/rails-delegate-js.svg?style=shield)](https://circleci.com/gh/Originate/rails-delegate-js)
[![Dependency Status](https://david-dm.org/originate/rails-delegate-js.svg)](https://david-dm.org/originate/rails-delegate-js)
[![devDependency Status](https://david-dm.org/originate/rails-delegate-js/dev-status.svg)](https://david-dm.org/originate/rails-delegate-js#info=devDependencies)


This module implements the
[delegation pattern](https://en.wikipedia.org/wiki/Delegation_pattern)
for JavaScript,
in the very popular and usable
[Rails style](http://apidock.com/rails/Module/delegate).


## Delegating methods

```javascript
delegate = require('rails-delegate').delegate;

function Car() {
  this.engine = new Engine();

  delegate('start', 'stop', 'cylinders', { from: this, to: this.engine });
};

myCar = new Car;
```

Now `myCar.start()` calls `myCar.engine.start()` and
`myCar.stop()` calls `myCar.engine.stop()`.
You can also access the property `myCar.cylinders`,
which contains the value of `myCar.engine.cylinders`.

More information in the spec for delegating [methods](features/delegating-methods.feature)
and [properties](features/delegating-properties.feature).
This library also provides meaningful [error messages](features/error-messages.feature).


## Delegating Events

You can also forward events emitted by wrapped classes.

```javascript
delegateEvent = require('rails-delegate').delegateEvent;

function Car() {
  this.engine = new Engine();

  delegateEvent('starting', 'stopping', { from: this.engine, to: this });
};
```

Now if `myCar.engine` emits a starting `starting` event,
`myCar` also emits that event.


## Alternatives

This library aims for maximally readable syntax
that closely matches the
[Rails version](http://apidock.com/rails/Module/delegate).
There are other libraries that are different and more versatile,
for example
[node-delegates](https://github.com/tj/node-delegates).


## Development

See our [developer guidelines](CONTRIBUTING.md)",
  :category => 'rails javascript web',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/nitroglycerin',
  :title => 'Nitroglycerin',
  :description => 'Simplifies the control flow in Node.js test scripts by automatically failing on all errors',
  :long_description => "Makes JavaScript functions so volatile and explosive that they immediately throw on errors.
This is mostly useful for testing and simple command-line scripts. In production you most likely don't want to throw exceptions.",
  :readme => "# Nitroglycerin
[![Circle CI](https://circleci.com/gh/Originate/nitroglycerin.svg?style=shield)](https://circleci.com/gh/Originate/nitroglycerin)
[![Dependency Status](https://david-dm.org/originate/nitroglycerin.svg)](https://david-dm.org/originate/nitroglycerin)
[![Coverage Status](https://coveralls.io/repos/Originate/nitroglycerin/badge.svg?branch=master&service=github)](https://coveralls.io/github/Originate/nitroglycerin?branch=master)

_Makes JavaScript functions so volatile and explosive that they immediately throw on errors._

This is mostly useful for testing and simple command-line scripts.
In production you most likely don't want to throw exceptions.


## How it works

Let's say you have a small piece of test code that needs to set something up:

```coffeescript
resetDatabase (err) ->
  if err then throw new Error(err)
  createUser name: 'Alfred Nobel', (err, alfred) ->
    if err then throw new Error(err)
    # run your tests using alfred here
```

Checking that these calls didn't error out requires a bit of ceremony in Node.js,
either in the form of manual error checking as described above, promises,
or [async.waterfall](https://github.com/caolan/async#waterfall).
Nitroglycerin removes most of this ceremony:

```coffeescript
N = require 'nitroglycerin'

resetDatabase N ->
  createUser name: 'Alfred Nobel', N (alfred) ->
    # run your tests using alfred here
```

The functions wrapped in Nitroglycerin
will immediately throw an exception when they receive an error
or execute the callback with the error argument stripped.


## Development

See the [developer documentation](CONTRIBUTING.md)",
  :category => 'javascript web test',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/o-tools-node',
  :title => 'O-Tools for NodeJS repositories',
  :description => "Scripts to update NPM repositories according to Originate's guidelines",
  :long_description => "Tools for managing NodeJS repositories according to Originate's guidelines.",
  :readme => "# O-Tools for NodeJS repositories

[![CircleCI](https://circleci.com/gh/Originate/o-tools-node.svg?style=shield)](https://circleci.com/gh/Originate/o-tools-node)
[![Dependency Status](https://david-dm.org/Originate/o-tools-node.svg)](https://david-dm.org/Originate/o-tools-node)
[![devDependency Status](https://david-dm.org/Originate/o-tools-node/dev-status.svg)](https://david-dm.org/Originate/o-tools-node#info=devDependencies)

> Tools for managing NodeJS repositories according to
  [Originate's guidelines](https://github.com/Originate/guide/blob/master/javascript/node_js.md).


## Installation

```
$ npm i --save-dev o-tools-node
```

* make sure your $PATH includes `./bin` and `/node_modules/.bin` (in this order)

* add these scripts to the `bin` folder of your Node.JS code base
  and make them do their thing:

  <table>
    <tr>
      <th>spec</th>
      <td>runs all tests and linters</td>
    </tr>
    <tr>
      <th>build</th>
      <td>builds your project</td>
    </tr>
  </table>

* set up the CI server to automatically publish
  new releases from the `release` branch:
  * add a `deployment` section
    similar to [the one in this repo](circle.yml)
    to your circle.yml file
  * go to [npmjs.com](https://www.npmjs.com/settings/tokens)
    and copy the authentication token there into the clipboard
  * go to the project settings of your project on [CircleCI](https://circleci.com),
    and in the \"Environment Variables\" section add an environment variable
    named `AUTH_TOKEN` with the npm auth token as content.


## Tools

O-tools-node adds a number of command-line tools to your repo
to help you and others develop it more effectively:


* __setup:__
  Installs the Node.JS dependencies for your code base.
  To use a customized setup script for your code base,
  put your own `setup` script into your `./bin` folder.

  ```
  $ setup
  ```

* __lint:__
  runs [dependency-lint](https://github.com/charlierudolph/dependency-lint)

  ```
  $ lint
  ```

* __update-check:__
  checks whether updates to your dependencies are available

  ```
  $ update-check
  ```

* __update:__
  updates all your dependencies to their latest versions.

  ```
  $ update
  ```

* __publish:__
  releases a new version to NPM

  ```
  $ publish <patch|minor|major>
  ```


## Development

see our [developer documentation](CONTRIBUTING.md)",
  :category => 'node.js web',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/o-tools-livescript',
  :title => 'O-Tools for LiveScript developers',
  :description => 'This NPM module provides the build and watch scripts for compiling LiveScript code bases.',
  :long_description => 'This NPM module provides the build and watch scripts for compiling LiveScript code bases.',
  :readme => "# O-Tools for LiveScript
> build and watch scripts for LiveScript developers

[![CircleCI](https://circleci.com/gh/Originate/o-tools-livescript.svg?style=shield)](https://circleci.com/gh/Originate/o-tools-livescript)
[![Dependency Status](https://david-dm.org/originate/o-tools-livescript.svg)](https://david-dm.org/originate/o-tools-livescript)
[![devDependency Status](https://david-dm.org/originate/o-tools-livescript/dev-status.svg)](https://david-dm.org/originate/o-tools-livescript#info=devDependencies)


This NPM module provides the `build` and `watch` scripts for compiling LiveScript code bases.


## Usage

* add `o-tools-livescript` to your codebase:

  ```
  $ npm install --save-dev o-tools-livescript
  ```

* add `./bin` to you `PATH` environment variable

* remove the files `bin/build` and `bin/watch` from your code base
  if you plan on using the versions provided by this library

Now you can run `build` to compile source code in `src` to `dist`,
and `watch` to do this continuously on every file change.



## Release a new version

```
$ publish <patch|minor|major>
```

The new version is pushed by the CI server, which can take a few minutes.",
  :category => 'web javascript',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/asca',
  :title => 'Asca',
  :description => 'Simplifies call patterns in asynchronous control flows',
  :long_description => 'Convenient and readability improving parameter binding for asynchronous JavaScript functions.',
  :readme => "# Asca
[![Circle CI](https://circleci.com/gh/Originate/asca/tree/master.svg?style=shield)](https://circleci.com/gh/Originate/asca/tree/master)
[![Coverage Status](https://coveralls.io/repos/Originate/asca/badge.svg?branch=master&service=github)](https://coveralls.io/github/Originate/asca?branch=master)
[![Dependency Status](https://david-dm.org/originate/asca.svg)](https://david-dm.org/originate/asca)
[![devDependency Status](https://david-dm.org/originate/asca/dev-status.svg)](https://david-dm.org/originate/asca#info=devDependencies)

Convenient and readability improving parameter binding
for asynchronous JavaScript functions.


1. load it

  ```coffeescript
  asca = require 'asca'
  ```


2. define asynchronous functions using asca


  ```coffeescript

  sayHi = asca (name, done) ->
    console.log \"Hello \#{name}\"
    done()
  ```

3. the `sayHi` method behaves completely normal if called normally,
   i.e. given all parameters

  ```coffeescript
  sayHi 'world', ->   #> \"Hello world\" & calls the given method when done
  ```

4. if called without the last parameter (the asynchronous callback),
  the `sayHi` method returns a method with all the given parameters bound to it.
  This method can be called later by just giving it the callback.

  ```coffeescript
  sayWorldLater = sayHi 'world'   # 'sayWorldLater' is the sayHi method with
                                  # the argument 'world' bound to it
  sayWorldLater ->                #> \"Hello world\" & calls the given method when done
  ```

5. This binding allows very readable asynchronous code constructs,
  for example when using [async.js](https://github.com/caolan/async):

  ```coffeescript
  # instead of this madness
  async.parallel [
    (done) -> sayHi 'world', done
    (done) -> sayHi 'universe', done
  ]

  # or this mess
  async.parallel [
    sayHi.bind this, 'world'
    sayHi.bind this, 'universe'
  ]

  # we can now say
  async.parallel [
    sayHi 'world'
    sayHi 'universe'
  ]
  ```

  Or in many other places that call a method later
  ```coffeescript
  # instead of
  setTimeout (-> sayHi 'world'), 2000

  # we can now say
  setTimeout sayHi('world'), 2000
  ```

  All asynchronous JavaScript methods should behave like this.

  There are other libraries like [curry](https://www.npmjs.com/package/curry)
  that provide more comprehensive currying and binding,
  and might be more appropriate depending on what you want to do.
  This library is focussed around delayed asynchrounous function calling,
  performs error checking specifically for this use case,
  and does that with high performance while being extremely lightweight.",
  :category => 'javascript web',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/OriginateFoundation',
  :title => 'OriginateFoundation',
  :description => 'OriginateFoundation bundles fundamental categories and classes commonly used to streamline iOS development.',
  :long_description => 'OriginateFoundation bundles fundamental behaviors / categories / extensions commonly used to streamline iOS development.',
  :readme => "<img src=\"OriginateFoundationLogo.png\" alt=\"OriginateFoundation Logo\" width=\"500\"/>
<hr />
[![Build Status](https://travis-ci.org/Originate/OriginateFoundation.svg?branch=pk-travis)](https://travis-ci.org/Originate/OriginateFoundation)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/badge/CocoaPods-compatible-4BC51D.svg?style=flat)](https://cocoapods.org)
<br />
> **OriginateFoundation** bundles fundamental categories and classes commonly used to streamline iOS development.

# Requirements
- iOS 8.0+
- macOS 10.10+

# Features
- [x] Safe Block Execution
- [x] Improved Logging
- [x] ISO8601 Date Formatter Support
- [x] Collection of Higher-Order Functions

# Installation with CocoaPods
Add the following lines to your `Podfile` and run `pod install`:

```ruby
source 'https://github.com/Originate/CocoaPods.git'
pod 'OriginateFoundation'
```

# Installation with Carthage
Add the following line to your `Cartfile` and run `carthage update`:
```
github \"Originate/OriginateFoundation\"
```

# Usage
## Import the Framework
After adding the module to your respective build target, you need to import it wherever you would like to use it.

```objective-c
@import OriginateFoundation;
```

## Executing Blocks Safely
When designing or consuming block-based APIs, we sometimes do not care about a `completionBlock` or similar. In those cases it is common to pass `nil` as the arguments value. If we were to try and execute a `nil` block, the application will crash.

### OF_SAFE_EXEC()
In order to avoid having to write…
```objective-c
if (completionHandler) {
    completionHandler(arg1, arg2,…);
}
```
…all the time, **OriginateFoundation** provides the `OF_SAFE_EXEC()` family of macros. The above code can be re-written as:
```objective-c
// Will safely execute on the current queue.
OF_SAFE_EXEC(completionHandler, arg1, arg2,…);
```

### OF_SAFE_EXEC_MAIN()
The above case is often times also commonly accompanied / wrapped by a `dispatch_async` onto the main queue. In case we are on the main queue already, we’re unnecessarily delaying the execution of the block by pushing it to the end of the queue.

`OF_SAFE_EXEC_MAIN()` can assist in this case, by guaranteeing that the passed block will be both checked for presence, and executed immediately in case we are already on the main queue. If we are not on the main queue, execution is scheduled asynchronously on it.

```objective-c
// Will safely execute on the main queue (immediately if possible).
OF_SAFE_EXEC_MAIN(completionHandler, arg1, arg2,…);
```

## Logging
The default `NSLog()` function does not get stripped automatically when building a release build. Neither does it contain information about the function and context in which it was used.

### OFLog()
`OFLog()` ensures that…
- …the logging statements are only included when building for DEBUG builds.
- …additional information regarding the call-site is automatically included.

```objective-c
// MyViewController.m
43| ...
44| - (void)viewDidLoad {
45|    OFLog(@\"Hello World\");
46| }
47| ...
```

```objective-c
// Output:
2016-07-01 12:00:00.000 BUILD_TARGET[PID:MACHPORT] -[MyViewController viewDidLoad]:45 > Hello World.
```

### OFLogModule()
`OFLogModule()` behaves the same as `OFLog()`, except that it takes an additional parameter at the first position, which can be any object type. The idea is to have a convenient way to scope log statements by module or severity for easier parsing afterwards.

```objective-c
// MyViewController.m
43| ...
44| - (void)viewDidLoad {
45|    OFLogModule(@\"AppCore\", @\"Application Core Loaded\");
46| }
47| ...
```

```objective-c
// Output:
2016-07-01 12:00:00.000 BUILD_TARGET[PID:MACHPORT] [AppCore] -[MyViewController viewDidLoad]:45 > Application Core Loaded.
```

## ISO8601DateFormatter
Up until and including iOS 9, `Foundation` did not provide built-in mechanisms to parse ISO8601 date-time strings. Our category on `NSDateFormatter` makes this simple:

```objective-c
NSString *string = @\"2016-07-01T19:59:59Z\"; // ISO 8601 String
NSDate *date = [NSDateFormatter of_dateFromISO8601String:string];
```

```objective-c
NSDate *date = [NSDate date];
NSString *string = [NSDate of_ISO8601StringFromDate:date];
```

## OFFunctional
Based on [PKFunctional](https://github.com/pkluz/PKFunctional) you have access to an entire suite of commonly used higher-order functions. This includes but is not limited to `map`, `filter`, `reduce`, `zip` and others.

```objective-c
NSArray *numbers = @[@1, @2, @3, @4];
NSArray *doubled = [numbers of_map:^NSNumber *(NSNumber *number) {
    return @([number integerValue] * 2);
}];

// `doubled` is now equal to @[@2, @4, @6, @8].
```

Consult [`NSArray+OFFunctional.h`](OriginateFoundation/Sources/NSArray+OFFunctional.h) for more details and [`OFFunctionalTests.m`](Tests/Sources/OFFunctionalTests.m) for example usage.

# License
**OriginateFoundation** is available under the MIT license. See the [LICENSE](LICENSE) file for more info.",
  :category => 'ios macos framework',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/CocoaPods',
  :title => 'Originate iOS CocoaPods',
  :description => "Originate's iOS CocoaPod Specs Repo",
  :long_description => "This is Originate's CocoaPods spec repo.",
  :readme => "# Originate iOS CocoaPods

This is Originate's CocoaPods spec repo.

## How to use?

In your project's Podfile, add a new source:

```ruby
source 'https://github.com/Originate/CocoaPods.git'
```

And specify the desired CocoaPods spec.

```ruby
pod 'OriginateActionSheet'
pod 'OriginateAutoLayout'
pod 'OriginateHTTP'
pod 'OriginateRemoteCollection'
pod 'OriginateScrollViewFloater'
pod 'OriginateSlideshow'
pod 'OriginateUI'
```


## Adding a new pod / Updating existing pods

Read the [Making a CocoaPod](https://guides.cocoapods.org/making/making-a-cocoapod.html) guide.

Assuming that a pod repository already exists:

```
$ pod lib create OriginateNewPodName
$ ... setup pod repository ...
$ ... push up to remote repo ...
```

Each pod should have the following folder structure within this repository ([Originate/CocoaPods](https://github.com/Originate/CocoaPods)):

```
.
├── OriginateNewPodName/
│   ├── 0.0.1/
│   │   └── OriginateNewPodName.podspec
│   ├── 0.0.2/
│   │   └── OriginateNewPodName.podspec
│   └── ...
...
```

Each version of the pod has its own subfolder and its own .podspec file. Ensure that the .podspec files have the correct versions assigned (`s.version`) and are pointing to the correct pod repository (`s.source`). Adjust other fields in the [.podspec](http://guides.cocoapods.org/syntax/podspec.html) as necessary.

The pod repos must have a git tag corresponding to the version specified in the Podfile.


## Available pods

* [OriginateActionSheet](https://github.com/Originate/OriginateActionSheet)
* [OriginateAutoLayout](https://github.com/Originate/OriginateAutoLayout)
* [OriginateHTTP](https://github.com/Originate/OriginateHTTP)
* [OriginateRemoteCollection](https://github.com/Originate/OriginateRemoteCollection)
* [OriginateScrollViewFloater](https://github.com/Originate/OriginateScrollViewFloater)
* [OriginateSlideshow](https://github.com/Originate/OriginateSlideshow)
* [OriginateUI](https://github.com/Originate/OriginateUI)",
  :category => 'ios',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/docker-dd-agent',
  :title => 'Datadog Agent Dockerfile',
  :description => 'Datadog Agent Dockerfile for Trusted Builds',
  :long_description => 'This repository is meant to build the base image for a Datadog Agent container. You will have to use the resulting image to configure and run the Agent.',
  :readme => "# Datadog Agent Dockerfile

This repository is meant to build the base image for a Datadog Agent container. You will have to use the resulting image to configure and run the Agent.


## Quick Start

The default image is ready-to-go. You just need to set your API_KEY in the environment.

```
docker run -d --name dd-agent -v /var/run/docker.sock:/var/run/docker.sock -v /proc/:/host/proc/:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -e API_KEY={your_api_key_here} datadog/docker-dd-agent
```

If you are running on Amazon Linux, use the following instead:

```
docker run -d --name dd-agent -v /var/run/docker.sock:/var/run/docker.sock -v /proc/:/host/proc/:ro -v /cgroup/:/host/sys/fs/cgroup:ro -e API_KEY={your_api_key_here}
datadog/docker-dd-agent
```

Starting from Agent 5.7 we also provide an image based on [Alpine Linux](https://alpinelinux.org/). This image is a little smaller (about 10%) than the Debian-based one, and benefits from Alpine's security-oriented design.
It is compatible with all options described in this file (dogstatsd only, enabling integrations, etc.).

This image is available under the `alpine` Docker tag and can be used this way:
```
docker run -d --name dd-agent -h `hostname` -v /var/run/docker.sock:/var/run/docker.sock -v /proc/:/host/proc/:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -e API_KEY={your_api_key_here} datadog/docker-dd-agent:alpine
```

Please note that in this version, check configuration files must be stored in `/opt/datadog-agent/agent/conf.d/` instead of `/etc/dd-agent/conf.d/`


## Versioning

As per Agent 5.5.0. The docker image is following a new versioning pattern to allow us to release changes to the Docker image of the Datadog Agent but with the same version of the Agent.

The Docker image version will have the following pattern:

`X.Y.Z` where X is the major version of the Docker Image, Y is the minor version, Z will represent the Agent version.

e.g. the first version of the Docker image that will bundle the Datadog Agent 5.5.0 will be:
```
10.0.550
```

## Configuration

### Hostname

By default the agent container will use the `Name` field found in the `docker info` command from the host as a hostname. To change this behavior you can update the `hostname` field in `/etc/dd-agent/datadog.conf`. The easiest way for this is to use the `DD_HOSTNAME` environment variable (see below).

### Environment variables

A few parameters can be changed with environment variables.

* `DD_HOSTNAME` set the hostname (write it in `datadog.conf`)
* `TAGS` set host tags. Add `-e TAGS=\"simple-tag-0,tag-key-1:tag-value-1\"` to use [simple-tag-0, tag-key-1:tag-value-1] as host tags.
* `EC2_TAGS` set EC2 host tags. Add `-e EC2_TAGS=yes` to use EC2 custom host tags. Requires an [IAM role](https://github.com/DataDog/dd-agent/wiki/Capturing-EC2-tags-at-startup) associated with the instance.
* `LOG_LEVEL` set logging verbosity (CRITICAL, ERROR, WARNING, INFO, DEBUG). Add `-e LOG_LEVEL=DEBUG` to turn logs to debug mode.
* `PROXY_HOST`, `PROXY_PORT`, `PROXY_USER` and `PROXY_PASSWORD` set the proxy configuration.
* `DD_URL` set the Datadog intake server to send Agent data to (used when [using an agent as a proxy](https://github.com/DataDog/dd-agent/wiki/Proxy-Configuration#using-the-agent-as-a-proxy) )
* `DOGSTATSD_ONLY` tell the image to only start a standalone dogstatsd instance.
* `SD_BACKEND`, `SD_CONFIG_BACKEND`, `SD_BACKEND_HOST`, `SD_BACKEND_PORT` and `SD_TEMPLATE_DIR` configure service discovery.
`SD_BACKEND` can only be set to `docker` for now, since service discovery works only with docker containers.
`SD_CONFIG_BACKEND` can be set to `etcd` or `consul` which are the two configuration stores we support right now.
`SD_BACKEND_HOST` and `SD_BACKEND_PORT` are used to configure the connection to the configuration store, and `SD_TEMPLATE_DIR` to specify the path where the check configuration templates are stored.


**Note:** it is possible to use `DD_TAGS` instead of `TAGS`, `DD_LOG_LEVEL` instead of `LOG_LEVEL` and `DD_API_KEY` instead of `API_KEY`, these variables have the same impact.

This change was introduced to ease the setup in environments where the environments variables are set globally. In such environments, generic variable names such as `TAGS` or `API_KEY` can lead to conflicts with the configuration of other containers.

If the agent is installed in such an environment (Amazon Elastic Beanstalk for example), we recommend using the `DD_` prefixed variables to avoid configuration issues.

### Enabling integrations

To enable integrations you can write your YAML configuration files in the `/conf.d` folder, they will automatically be copied to `/etc/dd-agent/conf.d/` when the container starts.  You can also do the same for the `/checks.d` folder.   Any Python files in the `/checks.d` folder will automatically be copied to the `/etc/dd-agent/checks.d/` when the container starts.

1. Create a configuration folder on the host and write your YAML files in it.  The examples below can be used for the `/checks.d` folder as well.

    ```
    mkdir /opt/dd-agent-conf.d
    touch /opt/dd-agent-conf.d/nginx.yaml
    ```

2. When creating the container, mount this new folder to `/conf.d`.
    ```
    docker run -d --name dd-agent -v /var/run/docker.sock:/var/run/docker.sock -v /proc/:/host/proc/:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -v /opt/dd-agent-conf.d:/conf.d:ro -e API_KEY={your_api_key_here} datadog/docker-dd-agent
    ```

    _The important part here is `-v /opt/dd-agent-conf.d:/conf.d:ro`_

Now when the container starts, all files in `/opt/dd-agent-conf.d` with a `.yaml` extension will be copied to `/etc/dd-agent/conf.d/`. Please note that to add new files you will need to restart the container.

### Build an image

To configure specific settings of the agent straight in the image, you may need to build a Docker image on top of this image.

1. Create a `Dockerfile` to set your specific configuration or to install dependencies.

    ```
    FROM datadog/docker-dd-agent
    # Example: MySQL
    ADD conf.d/mysql.yaml /etc/dd-agent/conf.d/mysql.yaml
    ```

2. Build it.

    `docker build -t dd-agent-image .`

3. Then run it like the `datadog/docker-dd-agent` image.

    ```
    docker run -d --name dd-agent -v /var/run/docker.sock:/var/run/docker.sock -v /proc/:/host/proc/:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -e API_KEY={your_api_key_here} dd-agent-image
    ```

4. It's done!

You can find [some examples](https://github.com/DataDog/docker-dd-agent/tree/master/examples) in our Github repository.


## Information

To display information about the Agent's state with this command.

`docker exec dd-agent service datadog-agent info`

Warning: the `docker exec` command is available only with Docker 1.3 and above.

## Logs

### Copy logs from the container to the host

That's the simplest solution. It imports container's log to one's host directory.

`docker cp dd-agent:/var/log/datadog /tmp/log-datadog-agent`

### Supervisor logs

Basic information about the Agent execution are available through the `logs` command.

`docker logs dd-agent`


## DogStatsD

### Standalone DogStatsD

To run DogStatsD without the full Agent, add the `DOGSTATSD_ONLY` environment variable to the `docker run` command.

```
docker run -d --name dogstatsd -v /var/run/docker.sock:/var/run/docker.sock -v /proc/mounts:/host/proc/mounts:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -e API_KEY={your_api_key_here} -e DOGSTATSD_ONLY=true datadog/docker-dd-agent
```

This option allows you to run dogstatsd alone, without supervisor. One consequence of this is that the following command returns logs from dogstatsd directly instead of supervisor:

`docker logs dogstatsd`

### DogStatsD from the host

DogStatsD can be available on port 8125 from anywhere by adding the option `-p 8125:8125/udp` to the `docker run` command.

To make it available from your host only, use `-p 127.0.0.1:8125:8125/udp` instead.

### DogStatsD from other containers

#### Using Docker links

To send data to DogStatsD from other containers, add a `--link dogstatsd:dogstatsd` option to your run command.

For example, run a container `my_container` with the image `my_image`.

```
docker run  --name my_container           \
            --all_your_flags              \
            --link dogstatsd:dogstatsd    \
            my_image
```

DogStatsD address and port will be available in `my_container`'s environment variables `DOGSTATSD_PORT_8125_UDP_ADDR` and `DOGSTATSD_PORT_8125_UDP_PORT`.

#### Using Docker host IP

Since the Agent container port 8125 should be linked to the host directly, you can connect to DogStatsD though the host. By default, the IP of the host in a Docker container is `172.17.42.1`. So you can configure your DogStatsD client to connect to `172.17.42.1:8125`.


## Limitations

The Agent won't be able to collect disk metrics from volumes that are not mounted to the Agent container. If you want to monitor additional partitions, make sure to share them to the container in your docker run command (e.g. `-v /data:/data:ro`)

Docker isolates containers from the host. As a result, the Agent won't have access to all host metrics.

Known missing/incorrect metrics:

* Network
* Process list

Also, several integrations might be incomplete. See the \"Contribute\" section.

## Contribute

If you notice a limitation or a bug with this container, feel free to open a [Github issue](https://github.com/DataDog/docker-dd-agent/issues). If it concerns the Agent itself, please refer to its [documentation](http://docs.datadoghq.com/) or its [wiki](https://github.com/DataDog/dd-agent/wiki).",
  :category => 'framework',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/chai-match-pattern',
  :title => 'Chai Match Pattern',
  :description => 'Chai plugin wrapper for lodash-match-pattern',
  :long_description => 'This is a Chai plugin for general purpose JavaScript Object pattern matching. It wraps the lodash-match-pattern module -- which is built on the lodash-checkit module, which itself is a lodash extension which adds validation functionality from the popular checkit module.',
  :readme => "# chai-match-pattern
[![NPM Version](https://img.shields.io/npm/v/chai-match-pattern.svg)](https://www.npmjs.com/package/chai-match-pattern)
![CircleCI](https://circleci.com/gh/Originate/chai-match-pattern.svg?style=shield&circle-token=:circle-token)
[![David Dependencies](https://david-dm.org/Originate/chai-match-pattern.svg)](https://david-dm.org/Originate/chai-match-pattern)

Related Modules:
[![lodash-match-pattern](https://img.shields.io/npm/v/lodash-match-pattern.svg?label=lodash-match-pattern)](https://www.npmjs.com/package/lodash-match-pattern)
[![lodash-checkit](https://img.shields.io/npm/v/lodash-checkit.svg?label=lodash-checkit)](https://www.npmjs.com/package/lodash-checkit)

This is a Chai plugin for general purpose JavaScript Object pattern matching. It wraps the [`lodash-match-pattern`](https://github.com/originate/lodash-match-pattern) module -- which is built on the [`lodash-checkit`](https://github.com/Originate/lodash-checkit) module,  which itself is a [`lodash`](https://lodash.com/docs) extension which adds validation functionality from the popular [`checkit`](https://github.com/tgriesser/checkit) module.

SEE [`lodash-match-pattern`](https://github.com/originate/lodash-match-pattern) FOR DETAILS ON HOW TO DEFINE PATTERNS TO MATCH.


#### Basic Usage
```
npm install chai-match-pattern --save-dev
```
In your test file insert

```javascript
var chai = require('chai');
var chaiMatchPattern = require('chai-match-pattern');
chai.use(chaiMatchPattern);
var _ = chaiMatchPattern.getLodashModule(); // recommend using our lodash extension
```

Then use patterns to check your JSON with the `.matchPattern(pattern)` assertion function.  For example

```javascript
chai.expect({a: 1, b: 'abc'}).to.matchPattern({a: 1, b: _.isString});
```

Additionally any of the included `isXxxx` functions can be used directly as assertion functions. For example

```javascript
chai.expect(7.5).isBetween(7, 8);
```

Extensive details and examples about how to specify patterns can be found in the [`lodash-match-pattern`](https://github.com/originate/lodash-match-pattern) documentation.",
  :category => 'framework',
  :text_color => '#000000'

Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
  :github => 'https://github.com/Originate/lodash-checkit',
  :title => 'Lodash Checkit',
  :description => 'Mashup of lodash and checkit modules for use in lodash-match-pattern',
  :long_description => 'This is an extension of lodash with extra isXxxx methods from the Checkit module, along with is...Case methods derived from the lodash case conversion methods. All functions have corresponding isNotXxxx methods as well.',
  :readme => "# lodash-checkit

![CircleCI badge](https://circleci.com/gh/Originate/lodash-checkit.svg?style=shield&circle-token=:circle-token)
[![lodash-checkit](https://img.shields.io/npm/v/lodash-checkit.svg)](https://www.npmjs.com/package/lodash-checkit)

Related modules: [![lodash-match-pattern](https://img.shields.io/npm/v/lodash-match-pattern.svg?label=lodash-match-pattern)](https://www.npmjs.com/package/lodash-match-pattern)
[![chai-match-pattern](https://img.shields.io/npm/v/chai-match-pattern.svg?label=chai-match-pattern)](https://www.npmjs.com/package/chai-match-pattern)


This is an extension of lodash with extra `isXxxx` methods from the Checkit module, along with `is...Case` methods derived from the lodash case conversion methods. All functions have corresponding `isNotXxxx` methods as well.

- [`lodash` module details](https://lodash.com/docs)
- [`checkit` module details](https://github.com/tgriesser/checkit)

# Lodash-Checkit \"isXxxx\" function list
| Name | From |
| ---  | ---  |
| isAlpha | from Checkit module's regex validator \"alpha\" |
| isAlphaDash | from Checkit module's regex validator \"alphaDash\" |
| isAlphaNumeric | from Checkit module's regex validator \"alphaNumeric\" |
| isAlphaUnderscore | from Checkit module's regex validator \"alphaUnderscore\" |
| isArguments | inherited from lodash module |
| isArray | inherited from lodash module |
| isArrayBuffer | inherited from lodash module |
| isArrayLike | inherited from lodash module |
| isArrayLikeObject | inherited from lodash module |
| isBase64 | from Checkit module's regex validator \"base64\" |
| isBetween | from Checkit module's validator \"between\" |
| isBoolean | inherited from lodash module |
| isBuffer | inherited from lodash module |
| isCamelCase | from lodash \"...Case\" function |
| isContainerFor | from Checkit module's validator \"contains\" |
| isDate | inherited from lodash module |
| isDifferent | from Checkit module's validator \"different\" |
| isElement | inherited from lodash module |
| isEmail | from Checkit module's regex validator \"email\" |
| isEmpty | inherited from lodash module |
| isEqual | inherited from lodash module |
| isEqualWith | inherited from lodash module |
| isError | inherited from lodash module |
| isExactLength | from Checkit module's validator \"exactLength\" |
| isExists | from Checkit module's validator \"exists\" |
| isFinite | inherited from lodash module |
| isFunction | inherited from lodash module |
| isGreaterThan | from Checkit module's validator \"greaterThan\" |
| isGreaterThanEqualTo | from Checkit module's validator \"greaterThanEqualTo\" |
| isInRange | from Checkit module's validator \"range\" |
| isInteger | from Checkit module's regex validator \"integer\" |
| isIpv4 | from Checkit module's regex validator \"ipv4\" |
| isIpv6 | from Checkit module's regex validator \"ipv6\" |
| isKebabCase | from lodash \"...Case\" function |
| isLength | inherited from lodash module |
| isLessThan | from Checkit module's validator \"lessThan\" |
| isLessThanEqualTo | from Checkit module's validator \"lessThanEqualTo\" |
| isLowerCase | from lodash \"...Case\" function |
| isLuhn | from Checkit module's regex validator \"luhn\" |
| isMap | inherited from lodash module |
| isMatch | inherited from lodash module |
| isMatchWith | inherited from lodash module |
| isMaxLength | from Checkit module's validator \"maxLength\" |
| isMinLength | from Checkit module's validator \"minLength\" |
| isNaN | inherited from lodash module |
| isNative | inherited from lodash module |
| isNatural | from Checkit module's regex validator \"natural\" |
| isNaturalNonZero | from Checkit module's regex validator \"naturalNonZero\" |
| isNil | inherited from lodash module |
| isNotAlpha | from not \"isAlpha\" |
| isNotAlphaDash | from not \"isAlphaDash\" |
| isNotAlphaNumeric | from not \"isAlphaNumeric\" |
| isNotAlphaUnderscore | from not \"isAlphaUnderscore\" |
| isNotBase64 | from not \"isBase64\" |
| isNotBetween | from not \"isBetween\" |
| isNotCamelCase | from not \"isCamelCase\" |
| isNotContainerFor | from not \"isContainerFor\" |
| isNotDifferent | from not \"isDifferent\" |
| isNotEmail | from not \"isEmail\" |
| isNotExactLength | from not \"isExactLength\" |
| isNotExists | from not \"isExists\" |
| isNotGreaterThan | from not \"isGreaterThan\" |
| isNotGreaterThanEqualTo | from not \"isGreaterThanEqualTo\" |
| isNotInRange | from not \"isInRange\" |
| isNotInteger | from not \"isInteger\" |
| isNotIpv4 | from not \"isIpv4\" |
| isNotIpv6 | from not \"isIpv6\" |
| isNotKebabCase | from not \"isKebabCase\" |
| isNotLessThan | from not \"isLessThan\" |
| isNotLessThanEqualTo | from not \"isLessThanEqualTo\" |
| isNotLowerCase | from not \"isLowerCase\" |
| isNotLuhn | from not \"isLuhn\" |
| isNotMaxLength | from not \"isMaxLength\" |
| isNotMinLength | from not \"isMinLength\" |
| isNotNatural | from not \"isNatural\" |
| isNotNaturalNonZero | from not \"isNaturalNonZero\" |
| isNotNumeric | from not \"isNumeric\" |
| isNotRequired | from not \"isRequired\" |
| isNotSnakeCase | from not \"isSnakeCase\" |
| isNotStartCase | from not \"isStartCase\" |
| isNotUpperCase | from not \"isUpperCase\" |
| isNotUrl | from not \"isUrl\" |
| isNotUuid | from not \"isUuid\" |
| isNull | inherited from lodash module |
| isNumber | inherited from lodash module |
| isNumeric | from Checkit module's validator \"numeric\" |
| isObject | inherited from lodash module |
| isObjectLike | inherited from lodash module |
| isPlainObject | inherited from lodash module |
| isRegExp | inherited from lodash module |
| isRequired | from Checkit module's validator \"required\" |
| isSafeInteger | inherited from lodash module |
| isSet | inherited from lodash module |
| isSnakeCase | from lodash \"...Case\" function |
| isStartCase | from lodash \"...Case\" function |
| isString | inherited from lodash module |
| isSymbol | inherited from lodash module |
| isTypedArray | inherited from lodash module |
| isUndefined | inherited from lodash module |
| isUpperCase | from lodash \"...Case\" function |
| isUrl | from Checkit module's regex validator \"url\" |
| isUuid | from Checkit module's regex validator \"uuid\" |
| isWeakMap | inherited from lodash module |
| isWeakSet | inherited from lodash module |",
  :category => 'framework',
  :text_color => '#000000'

# Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
#   :github => '',
#   :title => '',
#   :description => '',
#   :long_description => '',
#   :readme => "",
#   :category => '',
#   :text_color => ''
#
# Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
#   :github => '',
#   :title => '',
#   :description => '',
#   :long_description => '',
#   :readme => "",
#   :category => '',
#   :text_color => ''
#
# Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
#   :github => '',
#   :title => '',
#   :description => '',
#   :long_description => '',
#   :readme => "",
#   :category => '',
#   :text_color => ''
#
# Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
#   :github => '',
#   :title => '',
#   :description => '',
#   :long_description => '',
#   :readme => "",
#   :category => '',
#   :text_color => ''
#
# Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
#   :github => '',
#   :title => '',
#   :description => '',
#   :long_description => '',
#   :readme => "",
#   :category => '',
#   :text_color => ''
#
# Resource.create! :background => 'https://pbs.twimg.com/profile_images/484319547403407360/T96-0rfi.jpeg',
#   :github => '',
#   :title => '',
#   :description => '',
#   :long_description => '',
#   :readme => "",
#   :category => '',
#   :text_color => ''
