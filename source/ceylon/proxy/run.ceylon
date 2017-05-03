
class Person(shared String name) {
    shared void hello(String name, Integer count) {
        value message = "Hola ``name``! ";
        print(message.repeat(count));
    }
}

shared void run() {
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

    print(proxiedPerson.name);
    proxiedPerson.hello("world", 3);
    print(proxiedPerson is Person);
}