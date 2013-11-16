# Wunderlist Command-line Interface

A command-line interface for commandline users and Wunderlist-lovers

## Installation

```shell
$ gem install wunderlist-cli
```

## Usage

### Setup your credentials

```shell
$ wunderlist setup # Enter your login. (It will be saved under ~/.wunderlist)
```
### Show all lists and tasks

```shell
$ wunderlist
```

### Show all lists with ids

```shell
$ wunderlist all_lists
```

### Show tasks in specific list

```shell
$ wunderlist -l LIST_ID
```
### Add a task to the Inbox

```shell
$ wunderlist add "Test wunderlist-cli"
```
### Add a task to a specific list

```shell
$ wunderlist add "Test adding to a list" -l LIST_ID
```

### Complete a task

```shell
$ wunderlist complete TASK_ID
```
### Delete a task

```shell
$ wunderlist delete TASK_ID
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
