# Cross-platform interceptors for Ceylon

A tiny library that defining a `proxy()` function which 
allows an `Interceptor` for method invocation and attribute 
evaluation to be attached to a Ceylon object.

This library works on both JVM and JavaScript VMs.

## Requirements

Ceylon 1.3.2 is required.

For the `proxy()` function to work correctly on the JVM, 
[EE compiler mode][] must be enabled.

[EE compiler mode]: https://ceylon-lang.org/documentation/1.3/reference/interoperability/ee-mode/

## Example

    value person = Person("Gavin");

    Person proxiedPerson = proxy {
        person;
        object handler satisfies Interceptor<Person> {

            shared actual Return call<Return,Args>
                (Person target, String name, Args args, Return method(Args args))
                    given Args satisfies Anything[] {
                print("calling '``name``()' with args ``args``");
                return method(args);
            }

            shared actual Type get<Type>
                (Person target, String name, Type attribute) {
                print("got '``name``'");
                return attribute;
            }

        }
    };
