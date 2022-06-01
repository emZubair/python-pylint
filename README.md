
# Python Pylint  
Ensure Python code quality using pylint and isort.

### Details


[pylint](https://github.com/PyCQA/pylint)  
> Pylint is a Python static code analysis tool which looks for programming errors, helps to enforce a coding standard, 
> sniffs for code smells and offers simple refactoring suggestions.
 
[isort](https://github.com/timothycrosley/isort)  
> isort is a Python utility / library to sort imports alphabetically, and automatically separated into sections 
> and by type.


## Configuration

#### Options
| Name          	| Description                                 	| Optional 	| Default  	|
|---------------	|---------------------------------------------	|----------	|----------	|
| source        	| Source file or directory                    	| false    	| "."      	|
| strict        	| Set strictness for lint [low, medium, high] 	| false    	| "medium" 	|
| pylint-options 	| Pylint options                               	| false    	| ""       	|
| isort-options 	| Isort options                               	| false    	| ""       	|
| django        	| Confirm if source is a Django project       	| false    	| false    	|

#### Strictness

**High**
- Must not have any type errors.
- Must not have any code format issues.
- Must not have import disorganization.
- Must meet code standard style (PEP8). Code must have a Pylint score of 10.


**Medium (default)**
- Must not have any type errors.
- Must not have any code format issues.
- Must not have import disorganization.
- Code must have a Pylint score of 8 or greater.

**Low**
- Must not have any type errors.
- Must not have any code format issues.

#### (Optional) More pylint customization
Create a setup.cfg or a .pylintrc file in the current working directory.

```
[pylint]
ignore=
    migrations,
    manage.py,
    __init__.py,
    apps.py,
    admin.py,
    models.py,
    serializers.py,
    urls.py,
disable=
    import-error,
    missing-module-docstring,
    missing-function-docstring
```

#### (Optional) More isort customization
Create a setup.cfg or a .isort.cfg file in the current working directory.

```
[isort]
include_trailing_comma=True
known_first_party=app
lines_between_sections=0
lines_between_types=0
known_django=django
known_drf=rest_framework
line_length=100
multi_line_output=3
sections=FUTURE,STDLIB,DJANGO,DRF,THIRDPARTY,FIRSTPARTY,LOCALFOLDER
```

## Example
```yaml  
 steps:
 - uses: actions/checkout@v2  
 - name: Python Linter
   uses: sunnysid3up/python-linter@master
   with:
     source: "src"
     pylint-options: "--rcfile=setup.cfg"
     isort-options: "-w 100"
     django: true
```

#### Cloned from [python-linter](https://github.com/sunnysid3up/python-linter)